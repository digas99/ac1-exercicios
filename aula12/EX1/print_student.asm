	# offsets
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	
	.eqv print_intu10, 36
	.eqv print_string, 4
	.eqv print_float, 2
	.eqv print_char, 11
	
	.data
str1:
	.asciiz "\nN. Mec: "
str2:
	.asciiz "\nNome: "
str3:
	.asciiz "\nNota: "
	.text
	.globl print_student
print_student:
	move $t0, $a0				# // $t0 = p
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, print_intu10		# print_intu10(p->id_number)
	lw $a0, id_number($t0)		#
	syscall						#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	li $v0, print_string		# print_string(p->first_name)
	addiu $a0, $t0, first_name	#
	syscall						#
	li $v0, print_char			# print_char(' ')
	li $a0, ' '					#
	syscall						#
	li $v0, print_string		# print_string(p->last_name)
	addiu $a0, $t0, last_name	#
	syscall						#
	li $v0, print_string		# print_string(str3)
	la $a0, str3				#
	syscall						#
	li $v0, print_float			# print_float(p->grade)
	l.s $f12, grade($t0)		#
	syscall						#
	jr $ra
