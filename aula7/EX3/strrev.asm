# Mapa de registos
# str:	$s0
# p1:	$s1
# p2:	$s2

	.data
	.text
	.globl strrev
strrev:
	addiu $sp, $sp, -16			# save values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#
	
	move $s0, $a0				# // $s0 = str
	move $s1, $a0				# *p1 = str
	move $s2, $a0				# *p2 = str
while1:							# while(*p2 != '\0') {
	lb $t0, 0($s2)				#
	beq $t0, '\0', endw1		#
	addiu $s2, $s2, 1			#	p2++
	j while1					# }
endw1:							#
	subu $s2, $s2, 1			# p2--
while2:							# while( p1 < p2 ) {
	bge $s1, $s2, endw2			#
	move $a0, $s1				#	// $a0 = p1
	move $a1, $s2				#	// $a1 = p2
	jal exchange				#	exchange(p1, p2)
	addiu $s1, $s1, 1			#	p1++
	subu $s2, $s2, 1			#	p2--
	j while2					# }
endw2:							#
	move $v0, $s0				# return str
	
	lw $s2, 12($sp)				# retrieve values from stack
	lw $s1, 8($sp)				#
	lw $s0, 4($sp)				#
	lw $ra, 0($sp)				#
	addiu $sp, $sp, 16			#
	
	jr $ra
	
#################################	
	
exchange:
	lb $t0, 0($a0)				# // $t0 = *c1
	lb $t1, 0($a1)				# // $t1 = *c2
	sb $t1, 0($a0)				# *c1 = *c2
	sb $t0, 0($a1)				# *c2 = *c1
	jr $ra