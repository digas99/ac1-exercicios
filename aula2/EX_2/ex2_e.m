	.data
	.text
	.globl main
main:	li $t0, 7		# $t0 = gray = 7
	or $t1, $0, $t0		# $t1 = num = gray
	
	srl $t3, $t1, 4		# $t3 = num >> 4
	xor $t1, $t1, $t3	# num = num ^ (num >> 4)
	
	srl $t3, $t1, 2		# $t3 = num >> 2
	xor $t1, $t1, $t3	# num = num ^ (num >> 2)
	
	srl $t3, $t1, 1		# $t3 = num >> 1
	xor $t1, $t1, $t3	# num = num ^ (num >> 1)
	
	or $t2, $0, $t1		# $t2 = bin = num
	
	jr $ra