# Mapa de registos
# p:	$s0
# *p:	$t0
		
	.data
	.text
	.globl strcat
strcat:
	addiu $sp, $sp, -8		# preserve values in stack
	sw $ra, 0($sp)			#
	sw $s0, 4($sp)			#
	
	move $s0, $a0			# // $s0 = $a0				
while:						# while(*p != '\0') {
	lb $t0, 0($a0)			# 	// $t0 = *p
	beq $t0, '\0', endw	 	# 
	addiu $a0, $a0, 1		#	p++
	j while					# }
endw:						#
	jal strcpy				# strcpy(p, src)
	move $v0, $s0			# return dst
	
	lw $ra, 0($sp)			#
	lw $s0, 4($sp)			#
	addiu $sp, $sp, 8		# put the values back in the variables
	jr $ra