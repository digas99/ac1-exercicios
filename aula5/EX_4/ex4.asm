# Mapa de registos
# houveTroca:	$t1
# p:		$t2
# *p:		$t3
# pUltimo:	$t4

	.data
	.eqv FALSE, 0
	.eqv TRUE, 1
	.eqv SIZE, 10
	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
str1:	.asciiz "Inserir valores no array:\n"
str2:	.asciiz "Valores do array ordenado:\n"
	.align	2
lista:	.space 40
	.text
	.globl main
main:	li $v0, print_string	# print_string(str1)
	la $a0, str1		#
	syscall			#
	la $t2, lista		# p = lista
	li $t5, SIZE		# pUltimo = p + (SIZE - 1)
	sub $t5, $t5, 1		# 
	sll $t5, $t5, 2		#
	addu $t4, $t2, $t5	#
for1:	bgt $t2, $t4, do	# for (p = lista; p <= pUltimo; p++) {	
	li $v0, read_int	#	*p = read_int()
	syscall			#
	sw $v0, 0($t2)		#
	addi $t2, $t2, 4	#
	j for1			# }
do:				# do {
	li $t1, FALSE		# 	houveTroca = FALSE
	la $t2, lista		# 	p = lista	
for2:	bge $t2, $t4, endf2	#	for (p = lista; p <= pUltimo; p++) {
	lw $t3, 0($t2)		#		$t3 = *p
	lw $t5, 4($t2)		#		$t5 = *(p+1)
	ble $t3, $t5, endif	#		if (*p > *(p+1)) {
	sw $t5, 0($t2)		#			*p = $t5
	sw $t3, 4($t2)		#			*(p+1) = $t3
	li $t1, TRUE		#			houveTroca = TRUE
endif:	addi $t2, $t2, 4	#		}
	j for2			#	}
endf2:	beq $t1, TRUE, do	# } while (houveTroca == TRUE)
	li $v0, print_string	# print_string(str2)
	la $a0, str2		#
	syscall			#
	la $t2, lista		# p = lista	
for3:	bgt $t2, $t4, endf3	# for (p = lista; p <= pUltimo; p++) {	
	lw $a0, 0($t2)		#	print_int10(*p)
	li $v0, print_int10	#
	syscall			#
	li $a0, ' '		#	print_char(' ')
	li $v0, print_char	#
	syscall			#
	addi $t2, $t2, 4	#
	j for3			# }
endf3:	jr $ra			#
