	.data
	.eqv read_int, 5
	.text
	.globl main
main:
	ori $v0, $0, read_int	# $t0 = read_int()
	syscall					#
	ori $t0, $v0, $0		#
	srl $t1, $t0, 1			# $t1 = $t0 >> 1
	xor $t1, $t0, $t1		# $t1 = $t0 ^ $t1
	jr $ra
	
	