	.eqv print_double, 3
	
	.data
	.text
	.globl main
main:
	addiu $sp, $sp, -4			# preserve values in stack
	sw $ra, 0($sp)				#
	
	jal f2						# print_double(f2())
	li $v0, print_double		# 
	mov.d $f12, $f0				#
	syscall						#
	
	lw $ra, 0($sp)				# retreive values from stack
	addiu $sp, $sp, 4			#
	jr $ra
