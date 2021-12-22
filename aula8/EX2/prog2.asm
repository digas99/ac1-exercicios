# Mapa de registos
# val:	$s0	
	
	.data
	.eqv MAX_STR_SIZE, 33
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
str:
	.space 34
	.text
	.globl main
main:
	addiu $sp, $sp, -8		# save values in stack
	sw $ra, 0($sp)			#
	sw $s0, 4($sp)			#
	
do:							# do {
	li $v0, read_int		#	val = read_int()
	syscall					#
	move $s0, $v0			#
	move $a0, $s0			#	// itoa(val, 2, str)
	li $a1, 2				#
	la $a2, str				#
	jal itoa				#
	move $a0, $v0			#	print_string( itoa(val, 2, str) )
	li $v0, print_string	#
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	move $a0, $s0			#	// itoa(val, 8, str)
	li $a1, 8				#
	la $a2, str				#
	jal itoa				#
	move $a0, $v0			#	print_string( itoa(val, 8, str) )
	li $v0, print_string	#
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	move $a0, $s0			#	// itoa(val, 16, str)
	li $a1, 16				#
	la $a2, str				#
	jal itoa				#
	move $a0, $v0			#	print_string( itoa(val, 16, str) )
	li $v0, print_string	#
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#
	bnez $s0, do			# } while (val != 0)
	li $v0, 0				# return 0

	lw $ra, 0($sp)			# retreive values from stack
	lw $s0, 4($sp)			#
	addiu $sp, $sp, 8		# 
	jr $ra