# Mapa de registos
# num: $t0
# i: $t1
# str: $t2
# str+i: $t3
# str[i]: $t4

	.data
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
str:
	.space 21
	.text
	.globl main
main:
	li $v0, read_string		# read_string(str, SIZE)
	la $a0, str				#
	li $a1, SIZE			#
	syscall					#
	li $t0, 0				# num = 0
	li $t1, 0				# i = 0
	la $t2, str				# $t2 = str // get first position of array
while:						#
	addu $t3, $t2, $t1		# $t3 = str+i // move i steps
	lb $t4, 0($t3)			# $t4 = str[i] // get value from that new address
	beq $t4, '\0', endwhile	# while (str[i] != '\0') {
	blt $t4, '0', endif		#	if( (str[i] >= '0') && (str[i] <= '9') )
	bgt $t4, '9', endif		#
	addi $t0, $t0, 1		#		num++
endif:						#
	addi $t1, $t1, 1		# 	i++
	j while					# }
endwhile:					#
	li $v0, print_int10		# print_int10(num)
	move $a0, $t0			#
	syscall					#
	jr $ra					