# Mapa de registos
# i:		$t0
# j:		$t1
# SIZE*4-1:	$t2
# lista:	$t3
# lista+i:	$t4
# lista[i]:	$t5
# lista+j:	$t6
# lista[j]:	$t7
	
	.data
	.eqv SIZE, 10
	.eqv read_int, 5
	.eqv print_string, 4
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
	li $t0, 0				# // i=0
	la $t3, lista			# // $t3=lista
	li $t2, SIZE			# // $t2=SIZE
	sll $t2, $t2, 2			# // $t2=SIZE*4
	sub $t2, $t2, 1			# // $t2=SIZE*4-1
for1:						# for (i=0; i <= SIZE-1; i++) {
	bgt $t0, $t2, endfor1	#
	li $v0, print_string	# 	print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, read_int		#	// read_int()
	syscall					#
	addu $t4, $t3, $t0		#	// $t4=lista+i
	sw $v0, 0($t4)			#	lista[i]=read_int()
	addiu $t0, $t0, 4		#	// i+=4
	j for1					# }
endfor1:					#
	li $t0, 0				# // i=0
for2:						# for (i=0; i < SIZE-1; i++) {
	bge $t0, $t2, endfor2	#
	addi $t1, $t0, 4		#	// j=i+4
for3:						#	for (j=i+1; j <= SIZE-1; j++) {
	bgt $t1, $t2, endfor3	#
	addu $t4, $t3, $t0		#		// $t4=lista+i
	lw $t5, 0($t4)			#		// $t5=lista[i]
	addu $t6, $t3, $t1		#		// $t6=lista+j
	lw $t7, 0($t6)			#		// $t7=lista[j]
	ble $t5, $t7, endif		#		if(lista[i] > lista[j]) {
	sw $t7, 0($t4)			#			lista[i]=lista[j]
	sw $t5, 0($t6)			#			lista[j]=lista[i]
endif:						#		}	
	addi $t1, $t1, 4		#		// j+=4
	j for3					#	}
endfor3:					#
	addi $t0, $t0, 4		#	// i+=4	
	j for2					# }
endfor2:					#
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	li $t0, 0				# // i=0
for4:						# for (i=0; i <= SIZE-1; i++) {
	bgt $t0, $t2, endfor4	#
	addu $t4, $t3, $t0		#		// $t4=lista+i
	lw $a0, 0($t4)			#		// $a0=lista[i]
	li $v0, print_int10		#		print_int10(lista[i])
	syscall					#
	li $v0, print_char		#	print_char(' ')
	li $a0, ' '				#
	syscall					#
	addi $t0, $t0, 4		#	// i+=4
	j for4					# }
endfor4:					#
	jr $ra