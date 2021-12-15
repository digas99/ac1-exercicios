# Mapa de registos
# *s:	$t0	
# len:	$t1
	
	.data
	.eqv print_string, 4
str:
	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
main:
	addiu $sp, $sp, -4		# preserve values in stack 
	sw $ra, 0($sp)			#

	la $a0, str				# // $a0 = str
	jal strrev				# // strrev(str)
	move $a0, $v0			# // $a0 = strrev(str)
	li $v0, print_string	# print_string(strlen(str))
	syscall					#
	li $v0, 0				# return 0

	lw $ra, 0($sp)			# retrieve values from stack
	addiu $sp, $sp, 4		#
	
	jr $ra
