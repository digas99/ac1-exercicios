	.data
	.eqv read_int, 5
	.text
	.globl main
main:	
	ori $v0, $0, read_int	# $t0 = read_int() nor 0
	syscall					#
	nor $t0, $v0, $0		#
	jr $ra