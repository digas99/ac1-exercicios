# Mapa de registos
# $t0 : gray
# $t1 : bin
# $t2 : mask

	.data
str1:
	.asciiz "Introduza um número: "
str2:
	.asciiz "\nValor em código Gray: "
str3:
	.asciiz "\nValor em binário: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int16, 34
	.text
	.globl main
main: 
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, read_int		# gray = read_int
	syscall					#
	move $t0, $v0			#
	srl $t2, $t0, 1			# mask = gray >> 1
	move $t1, $t0			# bin = gray
while:						#
	beqz $t2, endw			# while (mask != 0) {
	xor $t1, $t1, $t2		#	bin = bin ^ mask
	srl $t2, $t2, 1			#	mask = mask >> 1
	j while					# }
endw:						#
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	li $v0, print_int16		# print_int16(gray)
	move $a0, $t0			#
	syscall					#
	li $v0, print_string	# print_string(str3)
	la $a0, str3			#
	syscall					#
	li $v0, print_int16		# print_int16(bin)
	move $a0, $t1			#
	syscall					#
	jr $ra