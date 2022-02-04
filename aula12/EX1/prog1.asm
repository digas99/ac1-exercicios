	.eqv MAX_STUDENTS, 4
	
	.eqv print_string, 4
	.eqv print_float, 2
	
	.data
st_array:
	.space 176	# sizeof(student) * 4 = 44*4
media:
	.float 0.0
str1:
	.asciiz "\nMedia: "
str2:
	.asciiz "\n\nBest Student:"
	.text
	.globl main
main:
	addiu $sp, $sp, -4			# preserve values in stack
	sw $ra, 0($sp)				#
	
	la $a0, st_array			# read_data(st_array, MAX_STUDENTS)
	li $a1, MAX_STUDENTS		#
	jal read_data				#
	la $a0, st_array			# pmax = max(st_array, MAX_STUDENTS, &media)
	li $a1, MAX_STUDENTS		#
	la $a2, media				#
	jal max						#
	move $t0, $v0				# $t0 = pmax
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, print_float			# print_float(media)
	la $t1, media				#
	l.s $f12, 0($t1)			#
	syscall						#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	move $a0, $t0				# print_student(pmax)
	jal print_student			#
	li $v0, 0					# return 0
	
	lw $ra, 0($sp)				# retreive values from stack
	addiu $sp, $sp, 4			#
	jr $ra