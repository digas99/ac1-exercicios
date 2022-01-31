	# offsets
	.eqv a1, 0
	.eqv g, 16
	.eqv a2, 24
	.eqv v, 32
	.eqv k, 36
	
	.data
s2:
	.asciiz "St1"		# a1: 10 bytes, "St1": 3+1=4 bytes
	.space 6			# 10-4=6 bytes
	.double 3.141592653589
	.word 291, 756
	.asciiz "X"
	.float 1.983
	.text
	.globl f2
f2:
	la $t0, s2				# // $t0 = s2
	l.d $f4, g($t0)			# // $f4 = s2.g
	addiu $t1, $t0, a2		# // $t1 = &a2
	lw $t1, 4($t1)			# // $t1 = s2.a2[1]
	mtc1.d $t1, $f6			# // (double)$t1
	cvt.d.w $f6, $f6		# //
	l.s $f8, k($t0)			# // $f6 = s2.k
	cvt.d.s $f8, $f8		# // (double)$f8
	mul.d $f0, $f4, $f6		# return (s2.g * s2.a2[1] / k)
	div.d $f0, $f0, $f8		#
	jr $ra
