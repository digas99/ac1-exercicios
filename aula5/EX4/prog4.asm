# Mapa de registos
# $t0: houveTroca
# $t1: p
# $t2: *p
# $t3: pLast
# $t4: *(p+1)

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
	la $t1, lista			# // p = lista
	li $t3, SIZE			# // $t3 = SIZE
	sub $t3, $t3, 1			# // $t3 = SIZE - 1
	sll $t3, $t3, 2			# // $t3 = (SIZE - 1)*4
	add $t3, $t1, $t3		# pLast = lista + (SIZE - 1)
for1:						# for (p=lista; p <= pLast; p++) {
	bgt $t1, $t3, do		#
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, read_int		#	*p = read_int()
	syscall					#
	sw $v0, 0($t1)			#
	addi $t1, $t1, 4		#	// p+=4
	j for1					# }
do:							# do {
	li $t0, FALSE			# 	houveTroca = FALSE
	la $t1, lista			#	// p = lista
for2:						#	for (p=lista; p < pLast; p++) {
	bge $t1, $t3, endfor2	#		
	lw $t2, 0($t1)			#		// $t2 = *p
	lw $t4, 4($t1)			#		// $t4 = *(p+1)
	ble $t2, $t4, endif		#		if (*p > *(p+1)) {
	sw $t4, 0($t1)			#			*p = *(p+1)
	sw $t2, 4($t1)			#			*(p+1) = *p
	li $t0, TRUE			#			houveTroca = TRUE
endif:						#		}
	addi $t1, $t1, 4		#
	j for2					#
endfor2:					#
	beq $t0, TRUE, do		# } while(houveTroca=TRUE);
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	la $t1, lista			# // p = lista
for3:						# for (p=lista; p <= pLast; p++) {
	bgt $t1, $t3, endfor3	#
	li $v0, print_int10		#	print_int10(*p)
	lw $a0, 0($t1)			#
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	addi $t1, $t1, 4		#	// p+=4
	j for3					# }	
endfor3:					#
	jr $ra
