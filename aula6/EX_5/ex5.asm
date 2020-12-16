# Mapa de registos
# argc:			$t0
# argv:			$t1
# i:			$t2
# argv+i:		$t3
# argv+i+len:		$t4
# curr_arg_len:		$t5
# uppercase_counter:	$t6
# lowercase_counter:	$t7

	.data
	.eqv print_int10, 1
	.eqv print_str, 4
	.eqv print_char, 11
str1:	.asciiz "Argumentos de entrada do programa: "
str2:	.asciiz "Argumento #"
str3:	.asciiz "Nr. caracteres: "
str4:	.asciiz "Nr. letras M, m: "
str5:	.asciiz "Argumento com o maior nr. caracteres: "
	.text
	.globl main
main:	move $t0, $a0		# $t0 = argc
	move $t1, $a1		# $t1 = argv
	li $v0, print_str	# print_str(str1)
	la $a0, str1		#
	syscall			#
	li $v0, print_char	# print_char('\n')
	li $a0, '\n'		#
	syscall			#
	li $t2, 0		# for (i=0; i < argc; i++) {
for1:	bge $t2, $t0, endf1	#
	sll $t3, $t2, 2		#	$t3 = argv + (i*4)
	addu $t3, $t1, $t3	#
	lw $t3, 0($t3)		#	$t3 = argv[i*4]
	li $t5, 0		#	curr_arg_len = 0;
	li $t6, 0		#	uppercase_counter = 0
	li $t7, 0		#	lowercase_counter = 0
while1:	addu $t4, $t3, $t5	#	$t4 = argv+(i*4)+len
	lb $t4, 0($t4)		#	$t4 = argv[i*4][len]
	beqz $t4, endw1		#	while (argv[i*4][len] != 0) {
	blt $t4, 65, elsif1	#		if (curr_char >= 65 && curr_char <= 90)
	bgt $t4, 90, elsif1	#
	addiu $t6, $t6, 1	#			uppercase_counter++
	j endif1		#
elsif1:	blt $t4, 97, endif1	#		if (curr_char >= 97 && curr_char <= 122)
	bgt $t4, 122, endif1	#
	addiu $t7, $t7, 1	#			lowercase_counter++
endif1:	addiu $t5, $t5, 1	#		curr_arg_len++
	j while1		#	}
endw1:	li $v0, print_char	# 	print_str('\t')
	li $a0, '\t'		#
	syscall			#
	li $v0, print_str	# 	print_str(str2)
	la $a0, str2		#
	syscall			#
	li $v0, print_int10	# 	print_int10(i)
	move $a0, $t2		#
	syscall			#
	li $v0, print_char	# 	print_str(':')
	li $a0, ':'		#
	syscall			#
	li $v0, print_char	# 	print_str(' ')
	li $a0, ' '		#
	syscall			#
	li $v0, print_str	# 	print_str(argv[i*4])
	move $a0, $t3		#
	syscall			#
	li $v0, print_char	# 	print_char('\n')
	li $a0, '\n'		#
	syscall			#
	li $v0, print_char	# 	print_str('\t')
	li $a0, '\t'		#
	syscall			#
	li $v0, print_str	# 	print_str(str3)
	la $a0, str3		#
	syscall			#	
	li $v0, print_int10	# 	print_int10(curr_arg_len)
	move $a0, $t5		#
	syscall			#
	li $v0, print_char	# 	print_char('\n')
	li $a0, '\n'		#
	syscall			#
	li $v0, print_char	# 	print_str('\t')
	li $a0, '\t'		#
	syscall			#
	li $v0, print_str	# 	print_str(str4)
	la $a0, str4		#
	syscall			#
	li $v0, print_int10	# 	print_int10(uppercase_counter)
	move $a0, $t6		#
	syscall			#
	li $v0, print_char	# 	print_str(',')
	li $a0, ','		#
	syscall			#
	li $v0, print_char	# 	print_str(' ')
	li $a0, ' '		#
	syscall			#	
	li $v0, print_int10	# 	print_int10(lowercase_counter)
	move $a0, $t7		#
	syscall			#
	li $v0, print_char	# 	print_char('\n')
	li $a0, '\n'		#
	syscall			#
	addiu $t2, $t2, 1	# }
	j for1			#
endf1:	jr $ra
