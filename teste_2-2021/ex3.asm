# typedef struct 
# {							Align	Dim		Offset
# 		char id;			1		1		0
#		int sum;			4		4		4
#		char sample[29];	1		29		8
#		unsigned char ns;	1		1		37
#		float average;		4		4		40
# } pressure				4		44

# Mapa de registos
# pts: 		$a0
# maxIndex:	$a1
# i:		$t0
# j:		$t1
# sum:		$t2
# acc:		$f4

	# offsets
	.eqv id, 0
	.eqv sum, 4
	.eqv sample, 8
	.eqv ns, 37
	.eqv average, 40
	
	# sizes
	.eqv PRESSURE_SIZE, 44
	
	.data
acc:
	.float 0.0
	.text
	.globl reCalc
reCalc:
	li $t2, 0						# sum = 0
	la $t0, acc						# acc = 0.0
	l.s $f4, 0($t0)					#
	li $t0, 0						# // i = 0
for1:								# for (i = 0; i < maxIndex; i++, pts++) {
	bge $t0, $a1, endfor1			#
	li $t1, 0						# 	// j = 0
for2:								#	for (j = 0; j < pts->ns; j++) {
	lb $t3, ns($a0)					#		// $t3 = pts->ns
	bge $t1, $t3, endfor2			#
	lw $t3, sample($a0)				#		// $t3 = pts->sample
	addu $t4, $t3, $t1				#		// $t4 = (pts->sample)+j
	lb $t2, 0($t4)					#		sum += pts->sample[j]
	addi $t1, $t1, 1				#		// j++
	j for2							#
endfor2:							#	}
	sw $t2, sum($a0)				#	// pts->sum = sum
	lb $t3, ns($a0)					#	// $t3 = pts->ns
	mtc1 $t3, $f6					#	// $f6 = (float)pts->ns
	cvt.s.w $f6, $f6				#
	mtc1 $t2, $f8					#	// $f8 = (float)sum
	cvt.s.w $f8, $f8				#
	div.s $f8, $f8, $f6				#	pts->average = (float)sum / (float)pts->ns
	sw $f8, average($a0)			#
	add.s $f4, $f4, $f8				#	acc += pts->average
	addi $t0, $t0, 1				#	// i++
	addiu $a0, $a0, PRESSURE_SIZE	#	// pts++
	j for1							#
endfor1:							# }
	mtc1 $a1, $f6					# // $f6 = (float)maxIndex
	cvt.s.w $f6, $f6				#
	div.s $f0, $f4, $f6				# return (acc / (float)maxIndex)
	jr $ra