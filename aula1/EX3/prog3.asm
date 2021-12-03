	.data
	.eqv read_int, 5
	.eqv print_int10, 1
	.eqv print_int16, 34
	.eqv print_intu10, 36
	.eqv print_char, 11
	.text
	.globl main
main:
	ori $v0, $0, read_int		# $t0 = read_int()
	syscall						#
	or $t0, $0, $v0				#
	ori $t2, $0, 8				# $t2 = 8
	add $t1, $t0, $t0			# $t1 = 2$t0
	sub $t1, $t1, $t2			# $t1 = $t1 - $t2
	ori $v0, $0, print_int10	# print_int10($t1)
	or $a0, $0, $t1				#
	syscall						#
	ori $v0, $0, print_char		# print_char("\n")
	ori $a0, $0, '\n'			#
	syscall						#
	ori $v0, $0, print_int16	# print_int16($t1)
	or $a0, $0, $t1				#
	syscall						#
	ori $v0, $0, print_char		# print_char("\n")
	ori $a0, $0, '\n'			#
	syscall						#
	ori $v0, $0, print_intu10	# print_intu10($t1)
	or $a0, $0, $t1				#
	syscall						#
	jr $ra
