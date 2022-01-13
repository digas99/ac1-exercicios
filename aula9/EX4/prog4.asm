# Mapa de registos
# i:		$t0
# SIZE*8:	$t1
# a:		$s0
# a+i:		$t2
	
	.eqv SIZE, 10
	.eqv read_int, 5
	.eqv print_double, 3
	.eqv print_string, 4
	
	.data
str1:
	.asciiz "\nAverage: "
str2:
	.asciiz "\nMax: "
	.align 3
a:
	.space 80	# 10*8
	.text
	.globl main
main:
	addiu $sp, $sp, -8		# preserve values in stack
	sw $ra, 0($sp)			#
	sw $s0, 4($sp)			#
	
	la $s0, a				# // $s0 = a
	li $t0, 0				# // i = 0
	li $t1, SIZE			# // $t1 = SIZE
	sll $t1, $t1, 3			# // $t1 = SIZE * 8
for:						# for(i = 0; i < SIZE; i++) {
	bge $t0, $t1, endfor	#
	li $v0, read_int		#	// read_int()
	syscall					#
	mtc1.d $v0, $f4			#	// (double)read_int()
	cvt.d.w $f4, $f4		#
	addu $t2, $s0, $t0		#	// $t2 = a+i
	s.d $f4, 0($t2)			#	a[i] = (double)read_int()
	addi $t0, $t0, 8		#	// i++
	j for					#
endfor:						# }
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
	move $a0, $s0			# // average(a, SIZE)
	li $a1, SIZE			#
	jal average				#
	li $v0, print_double	# print_double( average(a, SIZE) )
	mov.d $f12, $f0			#
	syscall					#
	li $v0, print_string	# print_string(str2)
	la $a0, str2			#
	syscall					#
	move $a0, $s0			# // average(a, SIZE)
	li $a1, SIZE			#
	jal max					#
	li $v0, print_double	# print_double( average(a, SIZE) )
	mov.d $f12, $f0			#
	syscall					#
	li $v0, 0				# return 0
	
	lw $ra, 0($sp)			# retreive values from stack
	lw $sp, 4($sp)			#
	addiu $sp, $sp, 8		#
	jr $ra
