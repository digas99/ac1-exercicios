# Mapa de registos
# i:			$t0	
# sum:			$f4
# array+i:		$t1
# array[i-1]:	$f6

	.data
k0:
	.double 0.0	
	.text
	.globl average
average:
	move $t0, $a1			# i = n
	sll $t0, $t0, 3			# // i *= 8
	la $t1, k0				# sum = 0.0
	l.d $f4, 0($t1)			#
for:						# for(; i > 0; i--) {
	blez $t0, endfor		#
	addu $t1, $a0, $t0		#	// $t1 = array+i
	l.d $f6, -8($t1)		#	// $f6 = array[i-1]
	add.d $f4, $f4, $f6		#	sum += array[i-1]
	sub $t0, $t0, 8			#	// i--
	j for					#
endfor:						# }
	mtc1.d $a1, $f6			# // $f6 = (double)n
	cvt.d.w $f6, $f6		#
	div.d $f0, $f4, $f6		# return sum / (double)n
	jr $ra
