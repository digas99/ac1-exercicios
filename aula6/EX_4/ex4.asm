# Mapa de registos
# argc:		$t0
# argv:		$t1
# argv+i:	$t2
# i:		$t3

	.data
	.eqv print_int10, 1
	.eqv print_str, 4
str1:	.asciiz "Nr. de parametros:"
str2:	.asciiz "\nP"
str3:	.asciiz ": "
	.text
	.globl main
main:	move $t0, $a0		# $t0 = argc
	move $t1, $a1		# $t1 = argv
	li $v0, print_str	# print_str(str1)
	la $a0, str1		#
	syscall			#
	li $v0, print_int10	# print_int10(argc)
	move $a0, $t0		#
	syscall			#
	li $t3, 0		# for (i=0; i < argc; i++) {
for:	bge $t3, $t0, endf	#
	li $v0, print_str	# 	print_str(str2)
	la $a0, str2		#
	syscall			#
	li $v0, print_int10	# 	print_int10(i)
	move $a0, $t3		#
	syscall			#
	li $v0, print_str	# 	print_str(str3)
	la $a0, str3		#
	syscall			#
	sll $t2, $t3, 2		#	argv + (i*4)
	addu $t2, $t1, $t2	#	
	li $v0, print_str	# 	print_str(argv[i*4])
	lw $a0, 0($t2)		#
	syscall			#
	addiu $t3, $t3, 1	# }
	j for			#
endf:	jr $ra
	