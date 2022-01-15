# Mapa de registos
# i:		$t0
# a:		$s0
# a+i:		$t1
# var_r,
# stdev_r:	$f12
	
	.eqv print_double, 3
	.eqv print_string, 4
	.eqv read_double, 7
	.eqv print_char, 11
	.eqv SIZE, 10
	
	.data
str1:
	.asciiz "\nvar: "
str2:
	.asciiz "\nstdev: "
	.align 3
a:
	.space 80	# SIZE*8
	.text
	.globl main
main:
	addiu $sp, $sp, -8			# preserve values in stack
	sw $ra, 0($sp)				#
	sw $s0, 4($sp)				#
	
	la $s0, a					# // $s0 = a
	li $t0, 0					# // i = 0 
for:							# for(i = 0; i < SIZE; i++) {
	bge $t0, SIZE, endfor		#
	li $v0, read_double			#	// read_double()
	syscall						#
	sll $t1, $t0, 3				#	// $t1 = i*8 (working with doubles)
	addu $t1, $s0, $t1			#	// $t1 = a+i
	s.d $f0, 0($t1)				#	a[i] = read_double()
	addi $t0, $t0, 1			# 	// i++
	j for						#
endfor:							# }
	move $a0, $s0				# var_r = var(a, SIZE)
	li $a1, SIZE				#
	jal var						#
	mov.d $f12, $f0				#
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, print_double		# print_double(var_r)
	syscall						#
	move $a0, $s0				# stdev_r = stdev(a, SIZE)
	li $a1, SIZE				#
	jal stdev					#
	mov.d $f12, $f0				#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	li $v0, print_double		# print_double(stdev_r)
	syscall						#
	li $v0, 0					# return 0
	
	lw $ra, 0($sp)				# retrieve values from stack
	lw $s0, 4($sp)				#
	addiu $sp, $sp, 8			#
	jr $ra

# #define SIZE 10
#
# int main(void) {
#	static double a[SIZE];
#	double var_r, stdev_r;
#	int i;
#	for(i = 0; i < SIZE; i++)
#		scanf("%lf", a+i);
#	
#	var_r = var(a, SIZE);
#	stdev_r = stdev(a, SIZE);
#	printf("var: %.2lf\nstdev: %.2lf\n", var_r, stdev_r);
#	return 0;
# }
