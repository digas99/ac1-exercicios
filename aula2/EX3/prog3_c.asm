	.data
str1:
	.asciiz "So para chatear"
str2:
	.asciiz "AC1 - P"
	.eqv print_string, 4
	.text
	.globl main
main:
	la $a0, str2				# $a0 = "AC1 - P"
	ori $v0, $0, print_string	# print_string($a0)
	syscall						#
	jr $ra