	.data
k0:
	.double 5.0
k1:
	.double 9.0
k2:
	.double 32.0
	.text
	.globl f2c
f2c:
	la $t0, k0				# $f4 = 0.5
	l.d $f4, 0($t0)			#
	la $t0, k1				# $f6 = 0.5
	l.d $f6, 0($t0)			#
	div.d $f4, $f4, $f6		# $f4 = 5.0/9.0				
	la $t0, k2				# $f6 = 32.0
	l.d $f6, 0($t0)			#
	sub.d $f6, $f12, $f6	# $f6 = ft - 32.0
	mul.d $f0, $f4, $f6		# return (5.0 / 9.0 * (ft – 32.0))
	jr $ra
	
# double f2c(double ft) {
#	return (5.0 / 9.0 * (ft - 32.0));
# }