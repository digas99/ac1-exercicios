# Mapa de registos
# a:	$t0
# n*4:	$t1
# p:	$t2
	
	.eqv print_int10, 1
	.eqv print_string, 4
	
	.data
str1:
	.asciiz ", "
	.text
	.globl print_array
print_array:
	move $t0, $a0				# // $t0 = a
	sll $t1, $a1, 2				# // $t1 = n*4
	addu $t2, $t0, $t1			# *p = a + n
for:							# for(; a < p; a++) {
	bge $t0, $t2, endfor		#
	li $v0, print_int10			# 	print_int10( *a )
	lw $a0, 0($t0)				#
	syscall						#
	li $v0, print_string		#	print_string(str1)
	la $a0, str1				#
	syscall						#
	addiu $t0, $t0, 4			#	// a++
	j for						#
endfor:							# }
	jr $ra
