# Mapa de registos
# i: $t0
# array: $t1
# array+i: $t2
# array[i]: $t3
# soma: $t4

	.data
	.eqv SIZE, 4
array:
	.word 7692, 23, 5, 234	
	.eqv print_int10, 1
	.text
	.globl main
main: 
	li $t4, 0				# soma = 0
	li $t0, 1				# i = 0
	la $t1, array			# $t1 = array
for:						#
	bge $t0, SIZE, endfor	# for (i=0; i<SIZE; i++) {
	add $t2, $t1, $t0		#	$t2 = array+i
	lw $t3, 0($t2)			#	$t3 = *(array+i) = array[i]
	add $t4, $t4, $t3		#	soma = soma + array[i]
	addiu $t0, $t0, 4		# 	i++ // $t0 += 4 because we are working with integers of 4 bytes each
	j for					# }
endfor:						#
	li $v0, print_int10		# print_int10(soma)
	move $a0, $t4			#
	syscall					#
	jr $ra



# New C program:

# #define SIZE 4
# int array[4] = {7692, 23, 5, 234};
#
# void main (void)
# {
# 	int soma = 0;
#	int i;
#	for (i=0; i<SIZE; i++) {
#		soma = soma + array[i];
#	}
#	print_int10(soma);
# }