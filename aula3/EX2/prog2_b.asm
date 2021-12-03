# Mapa de registos
# value: $t0
# bit: $t1
# i: $t2	
	
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
	li $t2, 0					# for (i=0; i < 32; i++) {
for:							#
	bgeu $t2, 32, endfor		#
	andi $t1, $t0, 0x80000000	# 	bit = value & 0x80000000
	beqz $t1, else				#	if (bit != 0)
	li $a0, '1'					#		print_char('1')
	ori $v0, $0, print_char		#
	syscall						#
	j endif						#	
else:							#
	li $a0, '0'					#	else
	ori $v0, $0, print_char		#		print_char('0')
	syscall						#	
endif:							#
	sll $t0, $t0, 1				#	value = value << 1
	addi $t2, $t2, 1			# 
	j for						# }
endfor:							#
	jr $ra