# Mapa de registos
# $t0: i
# $t1: array
# $t2: array+i
# $t3: SIZE*4

	.data
array:
	.word str1, str2, str3
str1:
	.asciiz "Array"
str2:
	.asciiz "de"
str3:
	.asciiz "ponteiros"
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	.text
	.globl main
main:
	li $t0, 0				# // i = 0
	la $t1, array			# // $t1 = array
	li $t3, SIZE			# // $t3 = SIZE
	sll $t3, $t3, 2			# // $t3 = SIZE*4
for:						#
	bge $t0, $t3, endfor	# for(i=0; i < SIZE; i++) {
	addu $t2, $t1, $t0		#	// $t2 = array+i
	li $v0, print_string	#	print_string(array[i])
	lw $a0, 0($t2)			#
	syscall					#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#	
	addi $t0, $t0, 4		#	// i++
	j for					# }
endfor:						#
	jr $ra					