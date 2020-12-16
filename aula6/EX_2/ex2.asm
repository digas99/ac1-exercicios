# Mapa de registos
# p:		$t0
# pultimo:	$t1

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
main:	la $t0, array		# p = array
	li $t1, SIZE		# pultimo = array + (SIZE * 4)
	sll $t1, $t1, 2		#
	addu $t1, $t0, $t1	#
for:	bge $t0, $t1, endfor	# for(; p < pultimo; p++) {
	lw $a0, 0($t0)		#	print_str(*p)
	li $v0, print_string	#
	syscall			#
	li $a0, '\n'		#	print_char('\n')
	li $v0, print_char	#
	syscall			#
	addiu $t0, $t0, 4	#
	j for			# }
endfor:	jr $ra			#
	
