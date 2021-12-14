# Mapa de registos
# $t0: p
# $t1: pultimo
	
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
	la $t0, array			# p = array
	li $t1, SIZE			# // $t1 = SIZE
	sll $t1, $t1, 2			# // $t1 = SIZE*4
	addu $t1, $t0, $t1		# // $t1 = array + (SIZE*4)
for:						# for(; p < pultimo; p++) {
	bge $t0, $t1, endfor	#
	li $v0, print_string	#	print_string(*p)
	lw $a0, 0($t0)			#
	syscall					#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#
	addiu $t0, $t0, 4		# 	// p++
	j for					# }
endfor:						#
	jr $ra