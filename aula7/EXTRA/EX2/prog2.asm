# Mapa de registos
# array_size:		$s0
# insert_value:		$s1
# insert_pos:		$s2
	
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.data
str1:
	.asciiz "Size of array: "
str2:
	.asciiz "array["
str3:
	.asciiz "] = "
str4:
	.asciiz "Enter the value to be inserted: "
str5:
	.asciiz "Enter the position: "
str6:
	.asciiz "\nOriginal array: "
str7:
	.asciiz "\nModified array: "
	.align 4
array:
	.space 200	# 50*4
	.text
	.globl main
main:
	addiu $sp, $sp, -16			# preserve values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#

	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, read_int			# array_size = read_int()
	syscall						#
	move $s0, $v0				#
	li $t0, 0					# // i=0
for:							# for(i=0; i < array_size; i++) {
	bge $t0, $s0, endfor		#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	li $v0, print_int10			# print_int10(i)
	move $a0, $t0				#
	syscall						#
	li $v0, print_string		# print_string(str3)
	la $a0, str3				#
	syscall						#
	la $t1, array				# // $t1 = array
	sll $t3, $t0, 2				# // $t3 = i*4
	addu $t2, $t1, $t3			# // $t2 = array+i
	li $v0, read_int			# array[i] = read_int()
	syscall						#
	sw $v0, 0($t2)				#
	addiu $t0, $t0, 1			#	// i++
	j for						#
endfor:							# }
	li $v0, print_string		# print_string(str4)
	la $a0, str4				#
	syscall						#
	li $v0, read_int			# insert_value = read_int()
	syscall						#
	move $s1, $v0				#
	li $v0, print_string		# print_string(str5)
	la $a0, str5				#
	syscall						#
	li $v0, read_int			# insert_pos = read_int()
	syscall						#
	move $s2, $v0				#
	li $v0, print_string		# print_string(str6)
	la $a0, str6				#
	syscall						#
	la $a0, array				# print_array(array, array_size)
	move $a1, $s0				#
	jal print_array				#
	la $a0, array				# insert(array, insert_value, insert_pos, array_size)
	move $a1, $s1				#
	move $a2, $s2				#
	move $a3, $s0				#
	jal insert					#
	li $v0, print_string		# print_string(str7)
	la $a0, str7				#
	syscall						#	
	la $a0, array				# print_array(array, array_size+1)
	move $a1, $s0				#
	addi $a1, $a1, 1			#
	jal print_array				#
	li $v0, 0					# return 0
	
	lw $ra, 0($sp)				# retreive values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	addiu $sp, $sp, 16			#
	jr $ra