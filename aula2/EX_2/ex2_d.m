	.data
	.text
	.globl main
main:	li $t0, 5		# $t0 = bin
	srl $t2, $t0, 1		# $t2 = bin >> 1
	xor $t1, $t0, $t2	# $t1 = bin ^ (bin >> 1)
	
	jr $ra