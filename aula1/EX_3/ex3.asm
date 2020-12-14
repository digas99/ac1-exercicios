	.data
	.text
	.globl main
main:	ori $v0, $0, 5		# $v0 = read_int()
	syscall
	or $t0, $0, $v0		# $t0 = $v0
	ori $t2, $0, 8		# $t2 = 8
	add $t1, $t0, $t0	# $t1 = $t0 + $t0 = x + x = 2 * x
	sub $t1, $t1, $t2	# $t1 = $t1 - $t2 = y = 2 * x - 8
	or $a0, $0, $t1		# $a0 = $t1
	ori $v0, $0, 1		# #v0 = print_int10()
	syscall
	
	ori $a0, $0, '\n'
	ori $v0, $0, 11
	syscall
	
	or $a0, $0, $t1		# $a0 = $t1
	ori $v0, $0, 34		# #v0 = print_int16()
	syscall
	
	ori $a0, $0, '\n'
	ori $v0, $0, 11
	syscall
	
	or $a0, $0, $t1		# $a0 = $t1
	ori $v0, $0, 36		# #v0 = print_intu10()
	syscall
	jr $ra		