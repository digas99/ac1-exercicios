# Mapa de registos
# x: $f20
# tol: $f22
# fact: $s0
# i: $s1
# tmp: $f24
# sum: $f26
	
	.data
sum:
	.float 0.0
k:
	.float 1.0
	.text
	.globl func2
func2:
	addiu $sp, $sp, -28		# preserve values in stack
	sw $ra, 0($sp)			#
	s.s $f20, 4($sp)		#
	s.s $f22, 8($sp)		#
	sw $s0, 12($sp)			#
	sw $s1, 16($sp)			#
	s.s $f24, 20($sp)		#
	s.s $f26, 24($sp)		#
	
	li $s0, 1				# fact = 1
	li $s1, 1				# i = 1
	mov.s $f20, $f12		# // $f20 = x
	mov.s $f22, $f14		# // $f22 = tol
	la $t0, sum				# sum = 0.0
	l.s $f26, 0($t0)		#
do:							# do {
	mul $s0, $s0, $s1		#	fact = fact * 1
	mov.s $f12, $f20		#	// pow(x, i)
	move $a0, $s1			#
	jal pow					#
	mtc1 $s0, $f4			#	// $f4 = (float)fact
	cvt.s.w $f4, $f4		#	
	div.s $24, $f0, $f4		#	tmp = pow(x, i) / (float)fact
	add.s $26, $f26, $f24	#	sum = sum + tmp
	addi $s1, $s1, 1		#	i++
	c.le.s $f24, $f22		# 
	bc1f do					# } while (tmp > tol)
	la $t0, k				# return (sum + 1.0)
	l.s $f4, 0($t0)			#
	add.s $f0, $f26, $f4	#
	
	lw $ra, 0($sp)			# retreive values in stack
	l.s $f20, 4($sp)		#
	l.s $f22, 8($sp)		#
	lw $s0, 12($sp)			#
	lw $s1, 16($sp)			#
	l.s $f24, 20($sp)		#
	l.s $f26, 24($sp)		#
	addiu $sp, $sp, 28		#
	jr $ra