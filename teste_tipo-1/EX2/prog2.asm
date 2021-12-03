# Mapa de registos
# i: 			$t0
# v:			$t1
# &(val[0]):	$t2
# &(val[i]):	$t3
# SIZE*4:		$t4

# Note: working with integers which use 4 bytes each in memory
# 		so some values might be multiplied by 4

	.data
	.eqv SIZE, 8
	.eqv print_int10, 1
	.eqv print_char, 11
	.eqv print_string, 4
str1:
	.asciiz "Result is: "
	.align 2
val:
	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.text
	.globl main
main:
	la $t2, val				# // $t2 = val
	li $t4 SIZE				# // $t6 = SIZE
	sll $t4, $t4, 2			# // $t6 = SIZE*4
	li $t0, 0				# i = 0
do:							# do {
	addu $t3, $t2, $t0		#	// $t3 = val + i
	lw $t1, 0($t3)			#	v = val[i]
	div $t6, $t4, 2			#	// $t6 = SIZE/2
	add $t6, $t0, $t6		#	// $t6 = i+SIZE/2
	addu $t6, $t2, $t6		#	// $t6 = val + (i+SIZE/2)
	lw $t7, 0($t6)			#	// $t7 = val[i+SIZE/2]
	sw $t7, 0($t3)			#	val[i] = val[i+SIZE/2]
	sw $t1, 0($t6)			#	val[i+SIZE/2] = v
	addi $t0, $t0, 4		#	// i+=4
	div $t6, $t4, 2			#	// $t6 = SIZE/2
	blt $t0, $t6, do		# } while ( ++i < ( SIZE/2 ) )
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
	li $t0, 0				# i = 0
do2:						# do {
	li $v0, print_int10		# 	print_int10( val[i] )
	addu $t3, $t2, $t0		#	// $t3 = val + i
	lw $a0, 0($t3)			#	// $a0 = val[i]
	syscall					#
	addi $t0, $t0, 4		#	i++ // i+=4
	li $v0, print_char		#	print_char(',')
	li $a0, ','				#
	syscall					#
	blt $t0, $t4, do2		# } while ( i < SIZE )
	jr $ra