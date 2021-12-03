# Mapa de registos
# $t0 : value
# $t1 : bit
# $t2 : i
# $t3 : flag
	
	.data
str1:
	.asciiz "Introduza um numero: "
str2:
	.asciiz "\nO valor em binário é: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	.text
	.globl main
main:
	la $a0, str1				# print_string(str1)
	ori $v0, $0, print_string	#
	syscall						#
	ori $v0, $0, read_int		# value = read_int()
	syscall						#
	move $t0, $v0				#
	la $a0, str2				# print_string(str2)
	ori $v0, $0, print_string	#
	syscall						#
	li $t2, 0					# i = 0
	li $t3, 0					# flag = 0
do:								# do {
	srl $t1, $t0, 31			#	bit = value >> 31
	beq $t3, 1, if				#	if (flag == 1 || bit != 0) {
	beqz $t1, endif				#
if:								#
	li $t3, 1					#		flag = 1
	rem $t4, $t2, 4				#		$t4 = i % 4
	bnez $t4, endif2			#		if ((i % 4) == 0)
	ori $v0, $0, print_char		#			print_char(' ')
	li $a0, ' '					#
	syscall						#
endif2:							#
	addi $t4, $t1, 0x30			#		$t4 = bit + 0x30
	ori $v0, $0, print_char		#		print_char(0x30 + bit)
	move $a0, $t4				#
	syscall						#	}
endif:							#
	sll $t0, $t0, 1				#	value = value << 1
	addi $t2, $t2, 1			#	i++ 
	blt $t2, 32, do				# } while (i < 32)
	jr $ra
