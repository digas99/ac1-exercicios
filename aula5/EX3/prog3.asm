# Mapa de registos
# $t0: houveTroca
# $t1: i
# $t2: lista
# $t3: lista+i
# $t4: lista[i]
# $t5: (SIZE-1)*4
# $t6: lista[i+1]

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.eqv print_char, 11
str1:
	.asciiz "Value: "
str2:
	.asciiz "Values from sorted array: "
	.align 2
lista:
	.space 40
	.text
	.globl main
main:
	la $t2, lista			# // $t2 = lista
	li $t5, SIZE			# // $t5 = SIZE
	sub $t5, $t5, 1			# // $t5 = SIZE - 1
	sll $t5, $t5, 2			# // $t5 = (SIZE-1) * 4
	li $t1, 0				# // i = 0
for1:						# for (i=0; i <= SIZE-1; i++) {
	bgt $t1, $t5, do		#
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	add $t3, $t2, $t1		#	// $t3 = lista + i
	li $v0, read_int		#	// read_int()
	syscall					#
	sw $v0, 0($t3)			#	lista[i] = read_int()
	addi $t1, $t1, 4		# 	// i += 4
	j for1					# }
do:							# do {
	li $t0, FALSE			# 	houveTroca = FALSE
	li $t1, 0				#	// i = 0
for2:						#	for (i=0; i < SIZE-1; i++) {
	bge $t1, $t5, endfor2	#
	add $t3, $t2, $t1		#	// $t3 = lista + i
	lw $t4, 0($t3)			#	// $t4 = lista[i]
	lw $t6, 4($t3)			#	// $t6 = lista[i+1]
	ble $t4, $t6, endif		#	if (lista[i] > lista[i+1]) {
	sw $t6, 0($t3)			#		lista[i] = lista[i+1]
	sw $t4, 4($t3)			#		lista[i+1] = lista[i]
	li $t0, TRUE			#		houveTroca = TRUE
endif:						#
	addi $t1, $t1, 4		#	// i+=4
	j for2					#	}
endfor2:	
	beq $t0, TRUE, do		# } while (houveTroca==TRUE)
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	li $t1, 0				# // i = 0
for3:						# for (i=0; i <= SIZE-1; i++) {
	bgt $t1, $t5, endfor3	#
	add $t3, $t2, $t1		# 	// $t3 = lista + i
	lw $t4, 0($t3)			#	// $t4 = lista[i]
	li $v0, print_int10		#	print_int10(lista[i])
	move $a0, $t4			#
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	addi $t1, $t1, 4		# 	// i+=4
	j for3					# }	
endfor3:					#
	jr $ra
