	.eqv print_double, 3
	.eqv read_double, 7
	.eqv print_string, 4
	
	.data
str1:
	.asciiz "Value (ºF): "
str2:
	.asciiz " ºC\n"
	.text
	.globl main
main:
	addiu $sp, $sp, -4		# preserve values in stack
	sw $ra, 0($sp)			#
	
while:						# while (true) {
	li $v0, print_string	#	print_string(str1)
	la $a0, str1			#
	syscall					#
	li $v0, read_double		#	$f12 = read_double()
	syscall					#	// fahrenheit = read_double()
	mov.d $f12, $f0			#	$f12 = f2c($f12)
	jal f2c					#	// celcius = f2c(fahrenheit);
	mov.d $f12, $f0			#
	li $v0, print_double	#	print_double($f12)
	syscall					#	// print_double(celcius)
	li $v0, print_string	#	print_string(str2)
	la $a0, str2			#
	syscall					#
	j while					# }
	
	lw $ra, 0($sp)			# retreive values from stack
	addiu $sp, $sp, 4		#
	jr $ra

# #include <stdio.h>
#
# double f2c(double );
#
# void main(void) {
#	double fahrenheit, celcius;
#
#	while (true) {
#		printf("Value (ºF): ");
#		scanf("%lf", &fahrenheit);
#		celcius = f2c(fahrenheit);
#		printf("%lf ºC\n", celcius);
#	}
# }
#
# double f2c(double ft) {
#	return (5.0 / 9.0 * (ft - 32.0));
# }