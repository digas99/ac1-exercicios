	.data
	.eqv print_int10, 1
str:
	.asciiz "Arquitetura de Computadores I"
	.text
	.globl main
main:
	addiu $sp, $sp, -4		# preserve values in stack 
	sw $ra, 0($sp)			#

	la $a0, str				# // $a0 = str
	jal strlen				# // strlen(str)
	move $a0, $v0			# // $a0 = strlen(str)
	li $v0, print_int10		# print_int10(strlen(str))
	syscall					#
	li $v0, 0				# return 0

	lw $ra, 0($sp)			# retrieve values from stack
	addiu $sp, $sp, 4		#
	
	jr $ra
