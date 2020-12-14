# Mapa de registos
# $t0 = p
# $t1 = *p
# $t2 = lista + SIZE

	.data
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv SIZE, 10
	.eqv print_int10, 1
	.eqv print_string, 4
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz	"; "
	.text
	.globl main
main:	la $a0, str1		# print_string(str1)
	li $v0, print_string	#
	syscall			#
	la $t0, lista		# p = lista
	li $t2, SIZE		#
	sll $t2, $t2, 2		#
	addu $t2, $t0, $t2	# $t2 = lista + SIZE
while:	bge $t0, $t2, endw	# while (p < lista + SIZE) {
	lw $t1, 0($t0)		#	$t1 = p*
	li $v0, print_int10	# 	print_int10(*p)
	move $a0, $t1		#	
	syscall			#
	la $a0, str2		# 	print_string(str2)
	li $v0, print_string	#
	syscall			#
	addiu $t0, $t0, 4	# 	p++
	j while			# }
endw:	jr $ra			#