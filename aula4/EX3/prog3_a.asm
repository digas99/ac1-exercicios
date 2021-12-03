# Mapa de registos
# p: $t0
# pultimo: $t1
# *p: $t2
# soma: $t3

	.data
	.eqv SIZE, 4
array:
	.word 7692, 23, 5, 234	
	.eqv print_int10, 1
	.text
	.globl main
main: 
	li $t3, 0				# soma = 0
	la $t0, array			# p = array
	li $t4, SIZE			# $t4 = SIZE
	sub $t4, $t4, 1			# $t4 = SIZE - 1
	sll $t4, $t4, 2			# $t4 = $t4 * 4 // each integer takes 4 bytes
							# // so to reach the last value add 4 to every value
	addu $t1, $t0, $t4		# ultimo = array + SIZE - 1;
while:						#
	bgtu $t0, $t1, endwhile	# while( p <= pultimo )
	lw $t2, 0($t0)			#	$t2 = *p
	add $t3, $t3, $t2		#	soma = soma + (*p)
	addiu $t0, $t0, 4		#	p++ // add 4 because working with integers
	j while					# }
endwhile:					#
	li $v0, print_int10		# print_int10(soma)
	move $a0, $t3			#
	syscall					#
	jr $ra
