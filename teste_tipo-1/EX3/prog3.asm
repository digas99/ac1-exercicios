# Mapa de registos
# n_even: 	$t0
# n_odd: 	$t1
# p1: 		$t2
# p2: 		$t3
# a+N,
# b+n_odd: 	$t4
# *p1:		$t5

# Note: working with integers which use 4 bytes each in memory
# 		so some values might be multiplied by 4

	.data
	.eqv N, 35
	.eqv read_int, 5
	.eqv print_int10, 1
a:
	.space 140	# 35*4
b:
	.space 140	# 35*4
	.text
	.globl main
main:
	li $t0, 0				# n_even = 0
	li $t1, 0				# n_odd = 0
	la $t2, a				# // p1 = a
	li $t4, N				# // $t4 = N
	sll $t4, $t4, 2			# // $t4 = N*4
	addu $t4, $t2, $t4		# // $t4 = a + n
for1:						#
	bge $t2, $t4, endfor1	# for ( p1 = a; p1 < (a + N); p1++ ) {
	li $v0, read_int		#	// read_int()
	syscall					#
	sw $v0, 0($t2)			#	*p1 = read_int()
	addiu $t2, $t2, 4		#	// p1+=4
	j for1					# }
endfor1:					#
	la $t2, a				# // p1 = a
	la $t3, b				# // p2 = b
for2:						#
	bge $t2, $t4, endfor2	# for ( p1 = a, p2 = b; p1 < (a + N); p1++ ) {
	lw $t5, 0($t2)			#	// $t5 = *p1
	rem $t6, $t5, 2			#	// $t6 = *p1 % 2
	beqz $t6, else			#	if ( (*p1 % 2) != 0 ) {
	sw $t5, 0($t3)			#		*p2 = *p1
	addiu $t3, $t3, 4		#		p2++ // p2+=4
	addi $t1, $t1, 1		#		n_odd++
	j endif					#	}
else:						#	else
	addi $t0, $t0, 1		#		n_even++
endif:						#
	addiu $t2, $t2, 4		#	// p1+=4
	j for2					# }
endfor2:					#
	la $t3, b				# // p2 = b
	sll $t4, $t1, 2			# // $t4 = n_odd*4
	addu $t4, $t3, $t4		# // $t4 = b + n_odd
for3:						#
	bge $t3, $t4, endfor3	# for ( p2 = b; p2 < (b + n_odd); p2++ ) {
	li $v0, print_int10		#	print_int10(*p2)
	lw $a0, 0($t3)			#	// $a0 = *p2
	syscall					#
	addiu $t3, $t3, 4		#	// p2+=4
	j for3					# }
endfor3:					#
	jr $ra