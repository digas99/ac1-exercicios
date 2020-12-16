# Mapa de registos
# array:	$t0
# i:		$t1
# array+i:	$t2

	.data
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
arr0:	.asciiz "Array"
arr1:	.asciiz "de"
arr2:	.asciiz "ponteiros"
array:	.word arr0, arr1, arr2
	.text
	.globl main
main:	la $t0, array		# $t0 = array
	li $t1, 0		# for(i=0; i < SIZE; i++) {
for:	bge $t1, SIZE, endfor	#
	sll $t2, $t1, 2		#
	addu $t2, $t0, $t2	#	$t2 = array+i
	lw $a0, 0($t2)		#	print_str(array[i])
	li $v0, print_string	#
	syscall			#
	li $a0, '\n'		#	print_char('\n')
	li $v0, print_char	#
	syscall			#
	addiu $t1, $t1, 1	#
	j for			# }
endfor:	jr $ra			#
	
