	.data
	.eqv print_int10, 1
str:
	.asciiz "101101"
#	.asciiz "2020 e 2024 sao anos bissextos"
	.text
	.globl main
main:
	addiu $sp, $sp, -4		# preserve values in stack
	sw $ra, 0($sp)			#
	
	la $a0, str				# 
#	jal atoi				# // atoi(str)
	jal atoi_bin			# // atoi_bin(str)
	move $a0, $v0			# print_int10(atoi(str))
	li $v0, print_int10		#
	syscall					#
	li $v0, 0				# return 0
	
	lw $ra, 0($sp)			# retreive values from stack
	addiu $sp, $sp, 4		#
	jr $ra
