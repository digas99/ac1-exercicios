# Mapa de registos
# count:	$s0
# res:		$s1
# s:		$s2
# *s:		$s3	
		
	.data
	.text
	.globl atoi_bin
atoi_bin:
	addiu $sp, $sp, -20			# save values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#
	sw $s3, 16($sp)				#
	
	li $s0, 0					# count = 0
	li $s1, 0					# res = 0
	jal strrev					# // strrev(s)
	move $s2, $v0				# $s2 = strrev(s)
while:							#
	lb $s3, 0($s2)				# while (*s == '0' || *s == '1') {
	beq $s3, '0', inwhile		#
	bne $s3, '1', endw			#
inwhile:						#
	bne $s3, '1', endif			#	if (*s++ == '1') {
	li $a0, 2					#		// pow(2,count)
	move $a1, $s0				#
	jal pow						#
	add $s1, $s1, $v0			#		res += power(2,count)
endif:							#	}
	addiu $s2, $s2, 1			# 	s++
	addi $s0, $s0, 1			# 	count++
	j while						# }
endw:							# 
	move $v0, $s1				# return res
		
	lw $ra, 0($sp)				# retreive values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	lw $s3, 16($sp)				#
	addiu $sp, $sp, 20			#
	jr $ra

#################################

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
	
	lw $ra, 0($sp)				# retrieve values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	addiu $sp, $sp, 16			#
	
	jr $ra
	
#################################	
	
exchange:
	lb $t0, 0($a0)				# // $t0 = *c1
	lb $t1, 0($a1)				# // $t1 = *c2
	sb $t1, 0($a0)				# *c1 = *c2
	sb $t0, 0($a1)				# *c2 = *c1
	jr $ra
	
#################################

pow:
	li $t0, 1					# res = 1
	li $t1, 0					# // i = 0
for:							# for (i=0; i<e; i++) {
	bge $t1, $a1, endfor		#
	mul $t0, $t0, $a0			#	res *= n
	addi $t1, $t1, 1			# 	// i++
	j for						# }
endfor:							#
	move $v0, $t0				# return res
	jr $ra