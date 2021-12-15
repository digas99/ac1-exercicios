# Mapa de registos
# p: $t0
# *p: $t1

	.data
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_string, 4
str1:
	.asciiz "Introduza uma string: "
	.align 2
str:
	.space 21
	.text
	.globl main
main:
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, read_string		# read_string(str, SIZE)
	la $a0, str				#
	li $a1, SIZE			#
	syscall					#
	la $t0, str				# p = str
while:						#
	lb $t1, 0($t0)			# $t1 = *p
	beq $t1, '\0', endwhile	# while (*p != '\0') {
	sub $t1, $t1, 'a'		# 	$t1 = *p - 'a'
	addi $t1, $t1, 'A'		#	$t1 = *p - 'a' + 'A'
	sb $t1, 0($t0)			#	store new value of p
	addiu $t0, $t0, 1		# 	p++
	j while					# }
endwhile:					#
	li $v0, print_string	# print_string(str)
	la $a0, str				#
	syscall					#
	jr $ra
	