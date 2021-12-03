	.data
	.eqv read_int, 5
	.eqv print_int10, 1
	.eqv print_char, 11
	.text
	.globl main
main:
	ori $v0, $0, read_int		# $t0 = read_int()
	syscall						#
	or $t0, $0, $v0				#
	ori $v0, $0, read_int		# $t1 = read_int()
	syscall						#
	or $t1, $0, $v0				#
	and $t2, $t0, $t1			# $t2 = $t0 & $t1
	ori $v0, $0, print_int10	# print_int10($t2)
	or $a0, $0, $t2				#
	syscall						#
	ori $v0, $0, print_char		# print_char('\n')
	ori $a0, $0, '\n'			#
	syscall						#
	or $t3, $t0, $t1			# $t3 = $t0 | $t1
	ori $v0, $0, print_int10	# print_int10($t3)
	or $a0, $0, $t3				#
	syscall						#
	ori $v0, $0, print_char		# print_char('\n')
	ori $a0, $0, '\n'			#
	syscall						#
	nor $t4, $t0, $t1			# $t4 = $t0 | $t1
	ori $v0, $0, print_int10	# print_int10($t4)
	or $a0, $0, $t4				#
	syscall						#
	ori $v0, $0, print_char		# print_char('\n')
	ori $a0, $0, '\n'			#
	syscall						#
	xor $t5, $t0, $t1			# $t5 = $t0 | $t1
	ori $v0, $0, print_int10	# print_int10($t5)
	or $a0, $0, $t5				#
	syscall						#
	ori $v0, $0, print_char		# print_char('\n')
	ori $a0, $0, '\n'			#
	syscall						#
	jr $ra
	
	