	.data
str1:
	.asciiz "Introduza 2 numeros\n"
str2:
	.asciiz "A soma dos dois numeros é: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
main:
	la $a0, str1				# print_string(str1)
	ori $v0, $0, print_string	#
	syscall						#
	ori $v0, $0, read_int		# a = read_int()
	syscall						#
	move $t1, $v0				#
	ori $v0, $0, read_int		# b = read_int()
	syscall						#
	move $t2, $v0				#
	la $a0, str2				# print_string(str2)
	ori $v0, $0, print_string	#
	syscall						#
	add $a0, $t1, $t2			# print_int10(a+b)
	ori $v0, $0, print_int10	#
	syscall						#
	jr $ra