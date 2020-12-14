	.data
str1:	.asciiz "Introduza 2 números:\n"
str2:	.asciiz "A soma dos 2 números é: "
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1
	.text
	.globl main
main:	la $a0, str1			# print_string("Introduza 2 numeros ");
	li, $v0, print_string		#
	syscall				#
					#
	li $v0, read_int		# a = read_int();
	syscall				#
	or $t0, $0, $v0			#
	
	li $v0, read_int		# b = read_int();
	syscall				#
	or $t1, $0, $v0			#
	
	la $a0, str2			# print_string("A soma dos 2 números é: ");
	li, $v0, print_string		#
	syscall				#
					#
	add $t2, $t0, $t1		# print_int10(a+b)
	or $a0, $0, $t2			#
	li $v0, print_int10		#
	syscall				#
					#
	jr $ra				#
