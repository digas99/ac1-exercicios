# Mapa de registos
# p:		$t0
# penultimo:	$t1
# *p:		$t2
# soma:		$t3
	.data
array:	.word 7692, 23, 5, 234
	.eqv print_int10, 1
	.eqv SIZE, 4
	.text
	.globl main
main:	li $t3, 0		# soma = 0
	li $t4, SIZE		#
	sub $t4, $t4, 1		# $t4 = SIZE - 1
	sll $t4, $t4, 2		# cada posição do array ocupa 4 bits na memória
				# ssl 2 = mul 4
	la $t0, array		# p = array
	addu $t1, $t0, $t4	# penultimo = array + SIZE - 1
while:	bgt $t0, $t1, endw	# while(p <= pultimo) {
	lw $t2, 0($t0)		#	$t2 = *p;
	add $t3, $t3, $t2	#	soma += (*p);
	addiu $t0, $t0, 4	#	p++;
	j while			# }
endw:	ori $a0, $t3, 0		# print_int10(soma);
	li $v0, print_int10	#
	syscall			#
	jr $ra			#
				