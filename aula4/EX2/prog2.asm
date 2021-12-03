# Mapa de registos
# num: $t0
# str: $t1
# str*: $t2
		
	.data
	.eqv SIZE, 20
	.eqv read_string, 8
	.eqv print_int10, 1
str:	.space 21
	.text
	.globl main
main:
	li $v0, read_string		# read_string(str, SIZE)
	la $a0, str				#
	li $a1, SIZE			#
	syscall					#
	li $t0, 0				# num = 0
	la $t1, str				# $t1 = str
while:						#
	lb $t2, 0($t1)			# $t2 = str*
	beq $t2, '\0', endwhile	# while( str* != '\0' )
	blt $t2, '0', endif		# 	if( (str[i] >= '0') && (str[i] <= '9') )
	bgt $t2, '9', endif		#
	addi $t0, $t0, 1		#		num++
endif:						#
	addi $t1, $t1, 1		# 	str++
	j while					# }
endwhile:					#
	li $v0, print_int10		# print_int10(num)
	move $a0, $t0			#
	syscall					#
	jr $ra