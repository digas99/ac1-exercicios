# Mapa de registos
# val: 		$t0
# n: 		$t1
# min: 		$t2
# max: 		$t3

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	.eqv read_int, 5
str1:
	.asciiz "Digite ate 20 inteiros (zero para terminar):"
str2:
	.asciiz "Maximo/minimo sao: "
	.text
	.globl main
main:
	li $t1, 0				# n = 0
	li $t2, 0x7FFFFFFF		# min = 0x7FFFFFFF
	li $t3, 0x80000000 		# max = 0x80000000
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
do:							# do {
	li $v0, read_int		# 	// read_int()
	syscall					#
	move $t0, $v0			#	val = read_int()
	beqz $t0, endif1		#	if ( val != 0 ) {
	ble $t0, $t3, if3		#		if ( val > max )
	move $t3, $t0			#			max = val
if3:						#
	bge $t0, $t2, endif1	#		if ( val < min )
	move $t2, $t0			#			min = val
endif1:						#	}
	addi $t1, $t1, 1		#	n++
	bge $t1, 20, enddo		# } while ( (n < 20) && ( val != 0 ) )
	bnez $t0, do			#
enddo:						#
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	li $v0, print_int10		# print_int10(max)
	move $a0, $t3			#
	syscall					#
	li $v0, print_char		# print_char(':')
	li $a0, ':'				#
	syscall					#
	li $v0, print_int10		# print_int10(min)
	move $a0, $t2			#
	syscall					#
	jr $ra