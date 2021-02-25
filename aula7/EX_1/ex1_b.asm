	.data
	.eqv print_int10, 1
str:	.asciiz "Arquitetura de Computadores I"
	.text
	.globl main
main:	addiu $sp, $sp, -4	# increase stack pointer
	sw $ra, 0($sp)		# preserve $ra
				#
	la $a0, str		# $a0 = str
	jal strlen		# strlen(str)
	move $a0, $v0		# print_int10(strlen(str))
	li $v0, print_int10	#
	syscall			#
	li $v0, 0		# return 0
				#
	lw $ra, 0($sp)		# retrieve $ra
	addiu $sp, $sp, 4	# decrease stack pointer
				#
	jr $ra			#