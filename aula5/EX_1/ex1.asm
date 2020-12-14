# Mapa de registos
# i:		$t0
# lista:	$t1
# lista + i:	$t2
	.data
	.eqv	SIZE, 5
str1:	.asciiz	"\nIntroduza um numero: "
	.align	2
lista:	.space	20
	.eqv	print_string, 4
	.eqv	read_int, 5
	.text
	.globl main
main:	li $t0, 0		# i = 0
while:	bge $t0, SIZE, endw	# while (i < SIZE) {
	la $a0, str1		#	print_string(str1)
	li $v0, print_string	#	
	syscall			#
	li $v0, read_int	#	$v0 = read_int()
	syscall			#
	la $t1, lista		#	$t1 = &lista[0]
	sll $t2, $t0, 2		#
	addu $t2, $t1, $t2	#	$t2 = &lista[i]
	sw $v0, 0($t2)		#	lista[i] = read_int()
	
	# just a small check to see if it was stored successfully
	lw $t3, 0($t2)		# load what was just stored
	li $v0, 1		# print_int10
	move $a0, $t3		# print_int10(content_loaded)
	syscall			#
	
	addi $t0, $t0, 1	#	i++
	j while			# }
endw:	jr $ra			#
