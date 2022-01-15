# Mapa de registos
# i:		$s0
# y:		$s1
# x:		$f20
# result:	$f22
	
	.data
k0:
	.float 1.0
	.text
	.globl xtoy
xtoy:
	addiu $sp, $sp, -28		# preserve values in stack
	sw $ra, 0($sp)			#
	sw $s0, 4($sp)			#
	sw $s1, 8($sp)			#
	s.d $f20, 12($sp)		#
	s.d $f22, 20($sp)		#
	
	mov.s $f20, $f12		# // $f20 = x
	move $s1, $a0			# // $s1 = y
	li $s0, 0				# // i = 0
	la $t0, k0				# // result = 1.0
	l.s $f22, 0($t0)		#
for:
	move $a0, $s1			# // abs(y)
	jal abs					#
	bge $s0, $v0, endfor	# for(i=0, result=1.0; i < abs(y); i++) {
	blez $s1, else			#	if(y > 0) {
	mul.s $f22, $f22, $f20	#		result *= x
	j endif					#	}
else:						# 	else {
	div.s $f22, $f22, $f20	#		result /= x
endif:						#	}
	addi $s0, $s0, 1		#	// i++
	j for					#
endfor:						# }
	mov.s $f0, $f22			# return result
	
	lw $ra, 0($sp)			# retrieve values from stack
	lw $s0, 4($sp)			#
	lw $s1, 8($sp)			#
	l.d $f20, 12($sp)		#
	l.d $f22, 20($sp)		#
	addiu $sp, $sp, 28		#
	jr $ra

#############################
# int abs(int )

abs:
	bgez $a0, endif_abs		# if (val < 0) {
	abs $a0, $a0			#	val = -val
endif_abs:					# }
	move $v0, $a0			# return val
	jr $ra