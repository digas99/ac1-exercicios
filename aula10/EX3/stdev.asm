	.data
	.text
	.globl stdev
stdev:
	addiu $sp, $sp, -4	# preserve values in stack
	sw $ra, 0($sp)		#

	jal var				# // var(array, nval)
	mov.d $f12, $f0		# return sqrt( var(array, nval) )
	jal sqrt			#
	
	lw $ra, 0($sp)		# retrieve values from stack
	addiu $sp, $sp 4	#
	jr $ra