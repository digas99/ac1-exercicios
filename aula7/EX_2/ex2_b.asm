	.data
	.eqv print_string, 4
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
main:	addiu $sp, $sp, -4	# guardar na stack
	sw $ra, 0($sp)		#

	la $a0, str		# print_string(strrev(str))
	jal strrev		#
	move $a0, $v0		#
	li $v0, print_string	#
	syscall			#
	li $v0, 0		# return 0
	
	lw $ra, 0($sp)		# repor a stack
	addiu $sp, $sp, 4	# 
	
	jr $ra