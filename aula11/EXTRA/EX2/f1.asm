	# offsets
	.eqv a1, 0
	.eqv i, 16
	.eqv a2, 20
	.eqv g, 40
	
	.data
s1:
	.asciiz "Str_1"		# a1: 14 bytes, "Str_1": 5+1=6 bytes
	.space 8			# 14-6=8 bytes
	.word 2021
	.asciiz "Str_2"		# a2: 17 bytes, "Str_2": 5+1=6 bytes
	.space 11			# 17-6=11 bytes
	.double 2.718281828459045
	.text
	.globl f1
f1:
	la $t0, s1			# // $t0 = s1
	l.d $f0, g($t0)		# return s1.g
	jr $ra