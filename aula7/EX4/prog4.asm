# Mapa de Registos
# str2:		$s0

	.data
str1:
	.asciiz "Arquitetura de "
	.align 2
str2:
	.space 51
str3:
	.asciiz "Computadores I"
	.eqv print_string, 4
	.eqv print_char, 11
	.text
	.globl main
main:
	addiu $sp, $sp, -8		# preserve values in stack
	sw $ra, 0($sp)			#
	sw $s0, 4($sp)			#

	la $s0, str2			# $s0 = str2
	move $a0, $s0			# strcpy(str2, str1)
	la $a1, str1			#
	jal strcpy				#
	li $v0, print_string	# print_string(str2)
	move $a0, $s0			#
	syscall					#
	li $v0, print_char		# print_char('\n')
	li $a0, '\n'			#
	syscall					#
	la $a0, str1			# // strcat(str2, str3)
	la $a1, str3			#
	jal strcat				#
	move $a0, $v0			# print_string(strcat(str2, str3))
	li $v0, print_string	#
	syscall					#
	li $v0, 0				# return 0
	
	lw $ra, 0($sp)			# retrieve values from stack
	lw $s0, 4($sp)			#
	addiu $sp, $sp, 8		#
	jr $ra