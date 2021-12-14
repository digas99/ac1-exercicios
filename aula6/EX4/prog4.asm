# Mapa de registos
# argc:		$t0	
# i:		$t1
# argv+i:	$t2
		
	.data
	.eqv print_str, 4
	.eqv print_int10, 1
str1:
	.asciiz "Nr. de parametros: "
str2:
	.asciiz "\nP"
str3:
	.asciiz ": "
	.text
	.globl main
main:
	move $t0, $a0				# // $t0 = argc
	li $v0, print_str			# print_str(str1)
	la $a0, str1				#
	syscall						#
	li $v0, print_int10			# print_int10(argc)
	move $a0, $t0				#
	syscall						#
	li $t1, 0					# // i = 0
for:							# for(i=0; i < argc; i++) {
	bge $t1, $t0, endfor		#
	li $v0, print_str			#	print_str(str2)
	la $a0, str2				#
	syscall						#
	li $v0, print_int10			#	print_int(i)
	move $a0, $t1				#
	syscall						#
	li $v0, print_str			#	print_str(str3)
	la $a0, str3				#
	syscall						#
	sll $t2, $t1, 2				#	// $t2 = i*4
	addu $t2, $a1, $t2			#	// $t2 = argv+i
	lw $a0, 0($t2)				#	// $a0 = argv[i]
	li $v0, print_str			#	print_str(argv[i])
	syscall						#
	addi $t1, $t1, 1			# 	// i++
	j for						# }
endfor:							#
	li $v0, 0					# return 0
	jr $ra						#