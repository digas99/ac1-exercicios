# Mapa de registos
# $t0: i
# $t1: j
# $t2: array
# $t3: array+i
# $t4: array[i]
# $t5: &(array[i][j])
# $t6: array[i][j]
	
	.data
array:
	.word arr1, arr2, arr3
arr1:
	.asciiz "Array"
arr2:
	.asciiz "de"
arr3:
	.asciiz "ponteiros"
str1:
	.asciiz "\nString #"
str2:
	.asciiz ": "
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_int10, 1
	.text
	.globl main
main:
	la $t2, array			# // $t2 = array
	li $t0, 0				# // i = 0
for:						# for(i=0; i < SIZE; i++) {
	bge $t0, SIZE, endfor	#
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, print_int10		#	print_int10(i)
	move $a0, $t0			#	// $a0 = i
	syscall					#
	li $v0, print_string	#	print_string(str2)
	la $a0, str2			#
	syscall					#
	sll $t3, $t0, 2			#	// $t3 = i*4
	addu $t3, $t2, $t3		#	// $t3 = array + (i*4)
	lw $t4, 0($t3)			#	// $t4 = array[i] = &(array[i][0])
	li $t1, 0				#	j = 0
while:						#	
	addu $t5, $t4, $t1		#	// $t5 = $(array[i][j])
	lb $t6, 0($t5)			#	// $t6 = array[i][j]
	beq $t6, '\0', endwhile	#	while(array[i][j] != '\0') {
	li $v0, print_char		#		print_char(array[i][j])
	move $a0, $t6			#
	syscall					#
	li $v0, print_char		#		print_char('-')
	li $a0, '-'				#
	syscall					#
	addi $t1, $t1, 1		#		j++
	j while					# 	}
endwhile:					#
	addi $t0, $t0, 1		#	// i++
	j for					#
endfor:						# }
	jr $ra
