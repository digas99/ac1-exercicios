# Mapa de registos
# val:	$f12
# xn:	$f4
# i:	$t0
# aux:	$f6
	
	.data
k0:
	.double 1.0
k1:
	.double 0.0
k2:
	.double 0.5
	.text
	.globl sqrt
sqrt:
	la $t1, k0				# xn = 1.0
	l.d $f4, 0($t1)			#
	li $t0, 0				# i = 0
	la $t1, k1				# $f6 = 0.0
	l.d $f6, 0($t1)			#
	c.le.d $f12, $f6		# if(val > 0.0) {
	bc1t else				#
do:							#	do {
	mov.d $f6, $f4			#		aux = xn
	div.d $f8, $f12, $f4	#		// $f8 = val/xn
	add.d $f4, $f4, $f8		#		// xn = xn + val/xn
	la $t1, k2				#		// $f8 = 0.5
	l.d $f8, 0($t1)			#
	mul.d $f4, $f8, $f4		#		xn = 0.5 * (xn + val/xn)
	c.eq.d $f6, $f4			#	} while((aux != xn) && (++i < 25))
	bc1t enddo				#	// leave loop if aux == xn
	addi $t0, $t0, 1		#	// i++
	blt $t0, 25, do			#	// loop if ++i < 25
enddo:
	j endif					# }
else:						# else {
	la $t1, k1				# xn = 0.0
	l.d $f4, 0($t1)			#
endif:						# }
	mov.d $f0, $f4			# return xn
	jr $ra