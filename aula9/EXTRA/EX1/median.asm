# Mapa de registos
# houveTroca:	$t0	
# i:			$t1	
# i*8:			$t4
# nval:			$a1
# array:		$a0
# array+i:		$t2
# array[i]:		$f4
# array[i+1]:	$f6
		
	.eqv TRUE, 1
	.eqv FALSE, 0
	
	.data
	.text
	.globl median
median:						# do {
	li $t0, FALSE			# 	houveTroca = False
	li $t1, 0				# 	// i = 0
	sub $t3, $a1, 1			# 	// $t3 = nval-1
for:						# 	for( i = 0; i < nval-1; i++ ) {
	bge $t1, $t3, endfor	#
	sll $t4, $t1, 3			#
	addu $t2, $a0, $t4		# 		// $t2 = array+i
	l.d $f4, 0($t2)			#		// $f4 = array[i]
	l.d $f6, 8($t2)			#		// $f6 = array[i+1]
	c.le.d $f4, $f6			#		if( array[i] > array[i+1] ) {
	bc1t endif				#
	s.d $f6, 0($t2)			#			// array[i] = array[i+1]	
	s.d $f4, 8($t2)			#			// array[i+1] = array[i]
	li $t0, TRUE			#			houveTroca = TRUE
endif:						# 		}
	addi $t1, $t1, 1		#		// i++
	j for					#
endfor:						# 	}
	beq $t0, TRUE, median	# } while ( houveTroca == TRUE )
	div $a1, $a1, 2			# // $a1 = nval/2
	sll $a1, $a1, 3			# // $a1 = (nval/2)*8
	addu $t2, $a0, $a1		# return array[nval/2]
	l.d $f0, 0($t2)			#
	jr $ra