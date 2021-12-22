# Mapa de registos
# n:		$a0 -> $s0
# b:		$a1 -> $s1
# s:		$a2 -> $s2
# p:		$s3
# digit:	$t0

	.data
	.text
	.globl itoa
itoa:
	addiu $sp, $sp, -20			# save values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#
	sw $s3, 16($sp)				#

	move $s0, $a0				# $s0 = n
	move $s1, $a1				# $s1 = b
	move $s2, $a2				# $s2 = s
	move $s3, $s2				# *p = s
do:								# do {
	rem $t0, $s0, $s1			#	digit = n % b
	div $s0, $s0, $s1			#	n /= b
	move $a0, $t0				#	// toascii(digit)
	jal toascii					#
	sb $v0, 0($s3)				#	*p = toascii(digit)
	addiu $s3, $s3, 1			#	p++
	bgtz $s0, do				# } while(n > 0)
	li $t0, '\0'				# // $t0 = '\0'
	sb $t0, 0($s3)				# *p = '\0'
	move $a0, $s2				# strrev(s)
	jal strrev					#
	move $v0, $s2				# return s

	lw $ra, 0($sp)				# retreive values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	lw $s3, 16($sp)				#
	addiu $sp, $sp, 20			# 
	jr $ra
	
#################################

toascii:
	addi $a0, $a0, '0'			# v += '0'
	ble $a0, '9', endif			# if (v > '9')
	addi $a0, $a0, 7			#	v += 7 // 'A' - '9' - 1
endif:							#
	move $v0, $a0				# return v
	jr $ra