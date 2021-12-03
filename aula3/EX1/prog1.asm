# Mapa de registos
# soma: $t0
# value: $t1
# i: $t2

	.data
str1:
	.asciiz "Inroduza um numero: "
str2:
	.asciiz "Valor ignorado\n"
str3:
	.asciiz "A soma dos positivos é: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
main:
	li $t0, 0					# for (i=0, soma = 0; i < 5; i++) {
	li $t2, 0					#
for:							#
	bge $t2, 5, endfor			#
	la $a0, str1				# 	print_string(str1)
	ori $v0, $0, print_string	#	
	syscall						#	
	ori $v0, $0, read_int		# 	value = read_int()
	syscall						#
	move $t1, $v0				#
	ble $t1, $0, else			#	if (value > 0)
	add $t0, $t0, $t1			#		soma += value
	j endif						#
else:							#
	la $a0, str2				#	else
	ori $v0, $0, print_string	#		print_string(str2)
	syscall						#
endif:							#
	addi $t2, $t2, 1			# }
	j for						#
endfor:							#
	la $a0, str3				# print_string(str3)
	ori $v0, $0, print_string	#
	syscall						#
	move $a0, $t0				# print_int10(soma)
	ori $v0, $0, print_int10	#
	syscall						#
	jr $ra
	
	