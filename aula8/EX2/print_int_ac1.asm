	.data
	.eqv print_string, 4
buf:
	.space 33
	.text
	.globl print_int_ac1
print_int_ac1:
	addiu $sp, $sp, -4		# save values in stack
	sw $ra, 0($sp)			#

	la $a2, buf				# $a3 = buf
	jal itoa				# // itoa(val, base, buf)
	move $a0, $v0			# print_string(itoa(val, base, buf))
	li $v0, print_string	#
	syscall					#
	
	lw $ra, 0($sp)			# retreive values from stack
	addiu $sp, $sp, 4		#
	jr $ra