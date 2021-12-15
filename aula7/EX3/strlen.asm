# Mapa de registos
# len:	$t0	
# *s:	$t1
	
	.data
	.text
	.globl strlen
strlen:
	li $t0, 0				# len = 0
while:						# while(*s++ != '\0') {
	lb $t1, 0($a0)			# 	// $t1 = *s
	beq $t1, '\0', endw		#	
	addiu $a0, $a0, 1		#	// s++
	addi $t0, $t0, 1		#	len++
	j while					# }
endw:						#
	move $v0, $t0			# return len
	jr $ra
