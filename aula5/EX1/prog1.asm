# Mapa de registos
# i: 		$t0
# lista: 	$t1
# lista+i: 	$t2

	.data
	.eqv SIZE, 5
	.eqv print_string, 4
	.eqv read_int, 5
str1:
	.asciiz	"\nIntroduza um numero: "
	.align 2
lista:
	.space 20
	.text
	.globl main
main:
	la $t1, lista			# $t1 = lista
	li $t0, 0				# i = 0
	li $t3, SIZE			# // adapt value of SIZE to "traverse through" an array
	sll $t3, $t3, 2			# // of integers
for:						#
	bge $t0, $t3, endfor 	# for(i = 0; i < SIZE; i++) {
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	addu $t2, $t1, $t0		#	$t2 = lista+i
	li $v0, read_int		#	read_int()
	syscall					#
	sw $v0, 0($t2)			#	lista[i] = read_int()
	addiu $t0, $t0, 4		#	i++ // adapt value of i to "traverse through" an array of integers
	
	# just a small check to see if it was stored successfully
	lw $t4, 0($t2)			# load what was just stored
	li $v0, 1				# print_int10
	move $a0, $t4			# print_int10(content_loaded)
	syscall					#
	
	j for					# }
endfor:						#
	jr $ra
