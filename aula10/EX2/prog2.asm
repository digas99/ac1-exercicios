# Mapa de registos
# x:		$f20
# result:	$f0
	
	.eqv print_double, 3
	.eqv print_string, 4
	.eqv read_double, 7
	.eqv print_char, 11
	
	.data
str1:
	.asciiz "Square root of X\n"
str2:
	.asciiz "X: "
str3:
	.asciiz "sqrt("
	.text
	.globl main
main:
	addiu $sp, $sp, 12		# preserve values in stack
	sw $ra, 0($sp)			#
	s.d $f20, 4($sp)		#
	
	li $v0, print_string	# print_string(str1)
	la $a0, str1			#
	syscall					#
while:						# while (1) {
	li $v0, print_string	# 	print_string(str2)
	la $a0, str2			#
	syscall					#
	li $v0, read_double		# 	x = read_double()
	syscall					#
	mov.d $f20, $f0			#
	mov.d $f12, $f20		#	$f0 = sqrt(x)
	jal sqrt				#
	li $v0, print_string	#	print_string(str3)
	la $a0, str3			#
	syscall					#
	li $v0, print_double	#	print_float(x)
	mov.d $f12, $f20		#
	syscall					#
	li $v0, print_char		#	print_char(')')
	li $a0, ')'				#
	syscall					#
	li $v0, print_char		#	print_char('=')
	li $a0, '='				#
	syscall					#
	li $v0, print_double		#	print_float(result)
	mov.d $f12, $f0			#
	syscall					#
	li $v0, print_char		#	print_char('\n')
	li $a0, '\n'			#
	syscall					#
	j while					# }
	
	lw $ra, 0($sp)			# retrieve values from stack
	l.d $f20, 4($sp)		#
	addiu $sp, $sp, 12		#
	jr $ra

# void main(void) {
#	double x, result;
#
#	printf("Square root of X\n");
#	while (1) {
#		printf("X: ");
#		scanf("%lf", &x);
#		result = sqrt(x);
#		printf("sqrt(%.2lf) = %lf\n", x, result);
#	}
# }
