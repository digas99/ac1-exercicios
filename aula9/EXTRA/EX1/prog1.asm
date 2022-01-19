# Mapa de registos
# result:	$f0
# array:	$t1
# array+i:	$t2
	
	.eqv SIZE, 8
	.eqv print_double, 3
	.eqv print_string, 4
	.eqv read_double, 7
	
	.data
str:
	.asciiz "Median: "
	.align 8
array:
	.double 1,2,3,4,5,6,7,8
	.text
	.globl main
main:
	addiu $sp, $sp, -4		# preserve values in stack
	sw $ra, 0($sp)			#
	
	la $a0, array			# result = median(array, SIZE)
	li $a1, SIZE			#
	jal median				#
	li $v0, print_string	# print_string(str)
	la $a0, str				#
	syscall					#
	li $v0, print_double	# print_double(result)
	mov.d $f12, $f0			#
	syscall					#
	
	lw $ra, 0($sp)			# retrieve values from stack
	addiu $sp, $sp, 4		#
	jr $ra

# #define SIZE 8
#
# void main(void) {
#	double array[] = {1,2,3,4,5,6,7,8};
#	double result;
#
#	result = median(array, SIZE);
#	printf("Median: %lf\n", result);
# }