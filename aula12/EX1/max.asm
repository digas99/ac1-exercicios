# Mapa de registos
# st:			$a0
# ns:			$a1
# media:		$a2
# p:			$t0
# st+ns:		$t1
# pmax:			$t2
# max_grade:	$f4
# sum:			$f6
# p->grade:		$f8

	# offsets
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	
	.eqv SIZE_STUDENT, 44

	.data
max_grade:
	.float -20.0
sum:
	.float 0.0
	.text
	.globl max
max:
	la $t0, max_grade				# // $t0 = &max_grade
	l.s $f4, 0($t0)					# // $f4 = max_grade
	la $t0, sum						# // $t0 = &sum
	l.s $f6, 0($t0)					# // $f6 = sum
	move $t0, $a0					# // p = st
	mul $t1, $a1, SIZE_STUDENT		# // $t1 = ns * SIZE_STUDENT
	addu $t1, $a0, $t1				# // $t1 = st + ns
for:								# for(p = st; p < (st + ns); p++) {
	bge $t0, $t1, endfor			#
	l.s $f8, grade($t0)				#	sum += p->grade
	add.s $f6, $f6, $f8				#
	c.le.s $f8, $f4					#	if(p->grade > max_grade) {
	bc1t endif						#
	mov.s $f4, $f8					#		max_grade = p->grade
	move $t2, $t0					#		pmax = p
endif:								#	}
	addiu $t0, $t0, SIZE_STUDENT	#	// p++
	j for							#
endfor:								# }
	mtc1 $a1, $f4					# // $f4 = (float)ns
	cvt.s.w $f4, $f4				#
	div.s $f6, $f6, $f4				# // $f6 = sum / (float)ns
	s.s $f6, 0($a2)					# *media = sum / (float)ns
	move $v0, $t2					# return pmax
	jr $ra