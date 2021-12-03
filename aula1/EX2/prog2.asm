	.data
	.text
	.globl main
main:
	or $t0, $0, 5			# $t0 = 5
	ori $t2, $0, 8			# $t2 = 8
	add $t1, $t0, $t0		# $t1 = 2$t0
	sub $t1, $t1, $t2		# $t1 = $t1 - $t2
	jr $ra
