# Mapa de registos
# array:	$t0
# array+i:	$t1
# array+i+j:	$t2
# i:		$t3
# j:		$t4

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
str1:	.asciiz "\nString #"
str2:	.asciiz ": "
arr0:	.asciiz "Array"
arr1:	.asciiz "de"
arr2:	.asciiz "ponteiros"
array:	.word arr0, arr1, arr2
	.text
	.globl main
main:	la $t0, array		# $t0 = array
	li $t3, 0		# for(i=0; i < SIZE; i++) {
for:	bge $t3, SIZE, endfor	#
	li $v0, print_string	#	print_str(str1)
	la $a0, str1		#
	syscall			#
	li $v0, print_int10	#	print_int10(i)
	move $a0, $t3		#
	syscall			#
	li $v0, print_string	#	print_str(str2)
	la $a0, str2		#
	syscall			#
	li $t4, 0		#	j = 0
	sll $t1, $t3, 2		#	$t1 = array + (i*4)
	addu $t1, $t0, $t1	#	
	lw $t1, 0($t1)		#	$t1 = array[i*4]
while:	addu $t2, $t1, $t4	#	while (array[i][j] != '\0') {
	lb $a0, 0($t2)		#
	beq $a0, '\0', endw	#
	li $v0, print_char	# 	print_char(array[i][j])
	syscall		#
	li $a0, '-'		#	print_char('-')	
	syscall			#
	addiu $t4, $t4, 1	#	j++
	j while			#
endw:	addiu $t3, $t3, 1	# }
	j for			#
endfor:	jr $ra
	
	
	