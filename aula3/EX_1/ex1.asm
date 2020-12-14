# Mapa de registos:
# $t0 – soma
# $t1 – value
# $t2 - i
	.data
str1:	.asciiz	"Introduza um número: "
str2:	.asciiz	"Valor ignorado\n"
str3:	.asciiz "A soma dos positivos é: "
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_int10, 1
	.text
	.globl main
main:	li $t0, 0		# soma = 0
	li $t2, 0		# i = 0
for:	bge $t2, 5, endfor	# while(i < 5) {
				#
	li $v0, print_string	# 	print_string("Introduza um número");
	la $a0, str1		#
	syscall			#
				#
	li $v0, read_int	# 	value=read_int();
	syscall			#
	or $t1, $0, $v0		#
				#
	ble $t1, $0, else	# 	if (value > 0)
	add $t0, $t0, $t1	#		soma += value;
	j endif			#
				#
else:	li $v0, print_string	# 	print_string("Valor ignorado\n");
	la $a0, str2		#
	syscall			#
				#
endif:	addi $t2, $t2, 1	# 	i++;
	j for			# }
				#
endfor:	li $v0, print_string	# print_string("A soma dos positivos é: ");
	la $a0, str3		#
	syscall			#
				#
	li $v0, print_int10	# print_int10(soma);
	or $a0, $0, $t0		#
	syscall			#
				#
	jr $ra			#
