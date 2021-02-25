# Mapa de registos
# *s:	$t0	
# len:	$t1

	.data
	.text
	.globl strlen
strlen:	li $t1, 0		# len = 0
while:	lb $t0, 0($a0)		# while(*s++ != '\0') {
	beq $t0, '\0', endw	#
	addi $t1, $t1, 1	#	len++
	addiu $a0, $a0, 1	# }
	j while			#
endw:	move $v0, $t1		# return len
	jr $ra			#	
