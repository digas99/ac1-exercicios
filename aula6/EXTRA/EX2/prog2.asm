# Mapa de registos
# i:				$t0
# longest:			$t2
# argc:				$t2
# argv:				$t3
# argv+i
# argv[i]:			$t4
# argv[i][n_chars],
# max:				$t5
# counters:			$t6
# i*4,
# aux:				$t7

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
str1:
	.asciiz "\nArg #"
str2:
	.asciiz "\nChars: "
str3:
	.asciiz "\nUpper Case: "
str4:
	.asciiz "\nLower Case: "
str5:
	.asciiz "\n\nLongest Arg: "
str6:
	.asciiz "Main has no arguments."
	.align 2
longest:
	.space 4	# save the address to the longest word
counters:
	.word 0, 0, 0, 0 	# n_chars, n_uppc, n_lowc, max
	.text
	.globl main
main:
	move $t2, $a0			# // $t2=argc
	move $t3, $a1			# // $t3=argv
	la $t6, counters		# // $t6=counters
	li $t0, 0				# // i=0
for:						# for (i=1; i<argc; i++) {
	bge $t0, $t2, endfor	#
	li $t7, 0				#	// reset all n_counters
	sw $t7, 0($t6)			#	// n_chars=0
	sw $t7, 4($t6)			#	// n_uppc=0
	sw $t7, 8($t6)			#	// n_lowc=0
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, print_int10		#	print_int10(i)
	move $a0, $t0			#
	syscall					#
	li $v0, print_char		#	print_char(':')
	li $a0, ':'				#
	syscall					#
	sll $t7, $t0, 2			#	// i*=4
	addu $t4, $t3, $t7		#	// $t4=argv+i
	lw $t4, 0($t4)			#	// $t4=argv[i]
	lw $t7, 0($t6)			#	// $t7=n_chars
while:						#	while(argv[i][n_chars] != '\0') {
	addu $t5, $t4, $t7		#		// $t5=&(argv[i][n_chars])
	lb $t5, 0($t5)			#		// $t5=argv[i][n_chars]
	beq $t5, '\0', endw		#
	blt $t5, 0x41, if2		#		if (c >= 0x41 && c <= 0x5A) {
	bgt $t5, 0x5A, if2		#
	lw $t7, 4($t6)			#			// $t7=n_uppc
	addi $t7, $t7, 1		#			n_uppc++
	sw $t7, 4($t6)			#			// update counters with n_uppc
	j endifs				#		}
if2:						#		else if (c >= 0x61 && c <= 0x7A) {
	blt $t5, 0x61, endifs	#
	bgt $t5, 0x7A, endifs	#
	lw $t7, 8($t6)			#			// $t7=n_lowc
	addi $t7, $t7, 1		#			n_lowc++
	sw $t7, 8($t6)			#			// update counters with n_lowc
endifs:						#		}
	lw $t7, 0($t6)			#		// $t7=n_chars
	addi $t7, $t7, 1		#		n_chars++
	sw $t7, 0($t6)			#		// update counters with n_chars
	j while					#	}
endw:						#
	li $v0, print_string	# 	print_string(str2)
	la $a0, str2			#
	syscall					#
	li $v0, print_int10		#	print_int10(n_chars)
	move $a0, $t7			#
	syscall					#
	li $v0, print_string	# 	print_string(str3)
	la $a0, str3			#
	syscall					#
	li $v0, print_int10		#	print_int10(n_uppc)
	lw $a0, 4($t6)			#	// $a0=n_uppc
	syscall					#
	li $v0, print_string	# 	print_string(str4)
	la $a0, str4			#
	syscall					#
	li $v0, print_int10		#	print_int10(n_lowc)
	lw $a0, 8($t6)			#	// $a0=n_lowc
	syscall					#
	lw $t5, 12($t6)			#	// $t5=max
	bge $t5, $t7, endif3	#	if (max < n_chars) {
	sw $t7, 12($t6)			#		max = n_chars
	sll $t7, $t0, 2			#		// i*=4
	addu $t4, $t3, $t7		#		// $t4=argv+i
	la $t7, longest			#		// $t7=longest
	sw $t4, 0($t7)			#		longest=argv+i
endif3:						#	}
	addi $t0, $t0, 1		#	// i++
	j for					# }
endfor:						#
	blez $t2, else4			#	if (argc > 0) {
	li $v0, print_string	#		print_string(str5)
	la $a0, str5			#
	syscall					#
	li $v0, print_string	#		print_string(longest)
	la $a0, longest			#		// $a0=longest (address with the address of longest word)
	lw $a0, 0($a0)			#		// $a0=*longest (address to longest word)
	lw $a0, 0($a0)			#		// $a0=**longest (actual longest word)
	syscall					#
	j endif4				#	}
else4:						#	else {
	li $v0, print_string	#		print_string(str6)
	la $a0, str6			#
	syscall					#
endif4:						#	}
	jr $ra