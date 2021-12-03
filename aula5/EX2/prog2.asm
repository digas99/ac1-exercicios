# Mapa de registos
# p:	$t0
# last:	$t1

	.data
	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv print_int10, 1
str1:
	.asciiz "\nConteudo do array:\n"
str2:
	.asciiz "; "
	.align 2
lista:
	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.text
	.globl main
main:
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	la $t0, lista				# p = lista
	li $t1, SIZE				# $t1 = SIZE
	sll $t1, $t1, 2				# $t1 = SIZE * 4
	add $t1, $t0, $t1			# last = lista + SIZE
for:							#
	bge $t0, $t1, endfor		# for(p = lista; p < lista + SIZE; p++) {
	li $v0, print_int10			#	print_int10(*p)
	lw $a0, 0($t0)				#	$a0 = *p
	syscall						#
	li $v0, print_string		#	print_string(str2)
	la $a0, str2				#
	syscall						#
	addi $t0, $t0, 4			#	// p++
	j for						# }
endfor:							#
	jr $ra