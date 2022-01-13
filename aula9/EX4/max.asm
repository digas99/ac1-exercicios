# Mapa de registos
# max:	$f4
# u:	$t0
# p:	$a0
# *p:	$f6

	.data
	.text
	.globl max
max:
	sub $a1, $a1, 1			# // $a1 = n-1
	sll $a1, $a1, 3			# // $a1 = (n-1)*8
	addu $t0, $a0, $a1		# *u = p+n–1
	l.d $f4, 0($a0)			# max = *p
	addiu $a0, $a0, 8		# p++
for:						# for(; p <= u; p++) {
	bgt $a0, $t0, endfor	#
	l.d $f6, 0($a0)			#	// $f6 = *p
	c.le.d $f6, $f4			#	if(*p > max) {
	bc1t endif				#	
	mov.d $f4, $f6			#		max = *p
endif:						#	}
	addiu $a0, $a0, 8		# 	p++
	j for					# 
endfor:						# }
	mov.d $f0, $f4			# return max
	jr $ra