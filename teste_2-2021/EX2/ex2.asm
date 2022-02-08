# Mapa de registos
# argc: 	$s0
# argv: 	$s1
# i: 		$s2
# p: 		$s3
# argv+i:	$t0
	
	.eqv SIZE, 10
	.eqv print_float, 6

	.data
fArr:
	.space 40	# 10*4
	.text
	.globl main
main:
	addiu $sp, $sp, -20			# preserve values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	sw $s1, 8($sp)				#
	sw $s2, 12($sp)				#
	sw $s3, 16($sp)				#
	
	move $s0, $a0				# // $s0 = argc
	move $s1, $a1				# // $s1 = argv[]
	bge $s0, 1, endif			# if (argc < 1) {
	li $v0, -1					# 	return -1
	j end						# 
endif:							# }
	li $s2, 0					# // i = 0
	la $s3, fArr				# // p = fArr
for:							# for (i=0, p = fArr, (i < argc) && ( i < SIZE ); i++, p++) {
	bge $s2, $s0, endfor		#
	bge $s2, SIZE, endfor		#
	addu $t0, $s1, $s3			#	// $t0 = argv+i
	lb $a0, 0($t0)				#	// $a0 = argv[i]
	li $a1, 10					#	// $a1 = 10
	jal atoi					#	// atoi(argv[i], 10)
	mtc1 $v0, $f4				#	*p = (float)atoi(argv[i], 10)
	cvt.s.w $f4, $f4			#
	s.s $f4, 0($s3)				#
	addi $s2, $s2, 1			#	// i++
	addiu $s3, $s3, 4			#	// p++
	j for						#
endfor:							# }
	la $a0, fArr				# print_float(mean(fArr, argc))
	move $a1, $s1				#
	jal mean					#
	mov.s $f12, $f0				#
	li $v0, print_float			#
	syscall						#
	li $v0, 0					# return 0
	
end:							#
	lw $ra, 0($sp)				# retreive values from stack
	lw $s0, 4($sp)				#
	lw $s1, 8($sp)				#
	lw $s2, 12($sp)				#
	lw $s3, 16($sp)				#
	addiu $sp, $sp, 20			#