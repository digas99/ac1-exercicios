# Mapa de registos
# p1:	$s1	 	
# p2:	$s2
		
	.data
	.text
	.globl strrev
strrev:	addiu $sp, $sp, -16	# guardar valores na stack
	sw $ra, 0($sp)		#
	sw $s0, 4($sp)		#
	sw $s1, 8($sp)		#
	sw $s2, 12($sp)		#
	move $s0, $a0		#
	move $s1, $a0		# p1 = str
	move $s2, $a0		# p2 = str
while1:	lb $t0, 0($s2)		# $t0 = *p2
	beq $t0, '\0', endw1	# while(*p2 != '\0') {
	addiu $s2, $s2, 1	#	p2++
	j while1		# }
endw1:	addiu $s2, $s2, -1	# p2--
while2:	bge $s1, $s2, endw2	# while(p1 < p2) {
	move $a0, $s1		#	exchange(p1, p2);
	move $a1, $s2		#
	jal exchange		#
	addiu $s1, $s1, 1	#	p1++
	addiu $s2, $s2, -1	#	p2--
	j while2		# }
endw2:	move $v0, $s0		# return str
	
	lw $ra, 0($sp)		# repor stack
	lw $s0, 4($sp)		#
	lw $s1, 8($sp)		#
	lw $s2, 12($sp)		#
	addiu $sp, $sp, 16	#
	
	jr $ra

exchange:
	lb $t0, 0($a0)		# $t0 = *C1
	lb $t1, 0($a1)		# $t1 = *c2
	sb $t1, 0($a0)		# *c1 = $t1
	sb $t0, 0($a1)		# *c2 = $t0

	jr $ra
