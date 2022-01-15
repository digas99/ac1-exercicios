# Mapa de registos
# x:		$f20
# y:		$s0	
# result:	$f0
	
	.eqv print_int10, 1
	.eqv print_float, 2
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv read_float, 6
	.eqv print_char, 11
	
	.data
str1:
	.asciiz "X to the power of Y\n"
str2:
	.asciiz "X: "
str3:
	.asciiz "Y: "
	.text
	.globl main
main:
	addiu $sp, $sp, 16		# preserve values in stack
	sw $ra, 0($sp)			#
	s.d $f20, 4($sp)		#
	sw $s0, 12($sp)			#
	
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
while:						# while (1) {
	li $v0, print_string	# 	print_string(str2)
	la $a0, str2			#
	syscall					#
	li $v0, read_float		# 	x = read_float()
	syscall					#
	mov.s $f20, $f0			#
	li $v0, print_string	#	print_string(str3)
	la $a0, str3			#
	syscall					#
	li $v0, read_int		#	y = read_int()
	syscall					#
	move $s0, $v0			#
	mov.s $f12, $f20		#	$f0 = xtoy(x, y)
	move $a0, $s0			#
	jal xtoy				#
	li $v0, print_float		#	print_float(x)
	mov.s $f12, $f20		#
	syscall					#
	li $v0, print_char		#	print_char('^')
	li $a0, '^'				#
	syscall					#
	li $v0, print_int10		#	print_int10(y)
	move $a0, $s0			#
	syscall					#
	li $v0, print_char		#	print_char('=')
	li $a0, '='				#
	syscall					#
	li $v0, print_float		#	print_float(result)
	mov.s $f12, $f0			#
	syscall					#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#
	j while					# }
	
	lw $ra, 0($sp)			# retrieve values from stack
	l.d $f20, 4($sp)		#
	lw $s0, 12($sp)			#
	addiu $sp, $sp, 16		#
	jr $ra

# void main(void) {
#	float x, result;
#	int y;
#
#	printf("X to the power of Y\n");
#	while (1) {
#		printf("X: ");
#		scanf("%f", &x);
#		printf("Y: ");
#		scanf("%d", &y);
#		result = xtoy(x, y);
#		printf("%.2f^%d = %f\n", x, y, result);
#	}
# }