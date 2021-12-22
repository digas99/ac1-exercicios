# Mapa de registos
# val:	$s0	
		
	.data
	.eqv read_int, 5
	.eqv print_char, 11
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
	move $a0, $s0			#	print_int_ac1(val, 2)
	li $a1, 2				#
	jal print_int_ac1		#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#
	bnez $s0, do			# } while (val != 0)
	li $v0, 0				# return 0

	lw $ra, 0($sp)			# retreive values from stack
	lw $s0, 4($sp)			#
	addiu $sp, $sp, 8		# 
	jr $ra