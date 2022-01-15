# Mapa de registos
# i:		$s0
# nval:		$s1
# array:	$s2
# array+i:	$s3
# array[i]:	$f12
# media:	$f20
# soma:		$f22
	
	.data
k0:
	.float 0.0
	.text
	.globl var
var:
	addiu $sp, $sp, -28			# preserve values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#
	sw $s3, 16($sp)				#
	s.s $f20, 20($sp)			#
	s.s $f22, 24($sp)			#
	
	jal average					# // average(array, nval)
	cvt.s.d $f20, $f0			# media = (float)average(array, nval)
	move $s2, $a0				# // $s2 = array
	move $s1, $a1				# // $s1 = nval
	li $s0, 0					# // i = 0
	la $t0, k0					# // soma = 0.0
	l.s $f22, 0($t0)			#
for:							# for(i=0, soma=0.0; i < nval; i++) {
	bge $s0, $s1, endfor		#
	sll $t0, $s0, 3				#	// i*8 (working with doubles)
	addu $s3, $s2, $t0			#	// $s3 = array+i
	l.d $f12, 0($s3)			#	// $s12 = array[i]
	cvt.s.d $f12, $f12			#	// $s12 = (float)array[i]
	sub.s $f12, $f12, $f20		#	// $s12 = (float)array[i] - media
	li $a0, 2					#	// $a0 = 2
	jal xtoy					#	// xtoy((float)array[i] - media, 2)
	add.s $f22, $f22, $f0		#	soma += xtoy((float)array[i] - media, 2)
	addi $s0, $s0, 1			# 	// i++
	j for						#
endfor:							# }
	cvt.d.s $f0, $f22			# // (double)soma
	mtc1 $s1, $f4				# // $f4 = (double)nval
	cvt.d.w $f4, $f4			#
	div.d $f0, $f0, $f4			# return (double)soma / nval
	
	lw $ra, 0($sp)				# retrieve values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	lw $s3, 16($sp)				#
	l.s $f20, 20($sp)			#
	l.s $f22, 24($sp)			#
	addiu $sp, $sp, 28			#
	jr $ra
