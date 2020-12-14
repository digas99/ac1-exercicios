# // inserir aqui o código para leitura de valores e
# // preenchimento do array
# for (i=0; i < SIZE; i++) {
#	read_int(lista + i);
# }

# // inserir aqui o código de impressão do conteúdo do array
# for(i=0; i < SIZE; i++) {
#	print_int10(*(lista + i));
# }

# Mapa de registos
# i:		$t0
# houveTroca:	$t1
# lista:	$t2
# lista+i:	$t3

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
main:	la $t2, lista		# $t2 = lista
	li $v0, print_string	# print_string(str1)
	la $a0, str1		#
	syscall			#
	li $t0, 0		# for (i=0; i < SIZE; i++) {
for1:	bge $t0, SIZE, do	#
	sll $t3, $t0, 2		#	$t3 = lista[i]
	addu $t3, $t2, $t3	# 	
	li $v0, read_int	#	lista[i] = read_int()
	syscall			#
	sw $v0, 0($t3)		#
	addi $t0, $t0, 1	#
	j for1			# }
do:				# do {
	li $t1, FALSE		# 	houveTroca = FALSE
	li $t0, 0		# 	for (i=0; i < SIZE-1; i++) {
for2:	li $t4, SIZE		#
	subu $t4, $t4, 1	#
	bge $t0, $t4, endf2	#
	sll $t4, $t0, 2		#		$t3 = lista[i]
	addu $t3, $t2, $t4	#
	lw $t4, 0($t3)		#
	lw $t5, 4($t3)		#
	ble $t4, $t5, endif	#		if (lista[i] > lista[i+1]) {
	sw $t5, 0($t3)		#			lista[i] = $t5
	sw $t4, 4($t3)		#			lista[i+1] = $t4
	li $t1, TRUE		#			houveTroca = TRUE
endif:	addi $t0, $t0, 1	# 		}
	j for2			#	}
endf2:	beq $t1, TRUE, do	# } while (houveTroca == TRUE)
	li $v0, print_string	# print_string(str2)
	la $a0, str2		#
	syscall			#
	li $t0, 0		# for (i=0; i < SIZE; i++) {
for3:	bge $t0, SIZE, endf3	#	
	sll $t3, $t0, 2		#	$t3 = lista[i]
	addu $t3, $t2, $t3	#
	lw $a0, 0($t3)		#	print_int10(lista[i])
	li $v0, print_int10	#
	syscall			#
	li $a0, ' '		#	print_char(' ')
	li $v0, print_char	#
	syscall			#
	addi $t0, $t0, 1	#
	j for3			# }
endf3:	jr $ra			#
		
	
