# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
# $t3 - flag
	.data
str1:	.asciiz	"Introduza um número: "
str2:	.asciiz	"\nO Valor em binário é: "
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv	print_char, 11
	.text
	.globl main
main:	la $a0, str1			# print_string(str1)
	li $v0, print_string		#
	syscall				#
					#
	li $v0, read_int		# value=read_int()
	syscall				#
	or $t0, $0, $v0			#
					#
	la $a0, str2			# print_string(str2)
	li $v0, print_string		#
	syscall				#
					#	
	li $t2, 0			# i = 0
	li $t3, 0			# flag = 0;
for:	bgeu $t2, 32, endfor		# while (i < 32) {
	srl $t1, $t0, 31		#	bit = value >> 31;
	beq $t3, 1, if			#	if(flag == 1 || bit != 0)
	beq $t1, 0, endif		#
if:	li $t3, 1			#		flag = 1;
	rem $t4, $t2, 4			#		if ((i%4)==0)
	bne $t4, 0, endif2		#
	li $a0, ' '			#			print_char(' ')
	li $v0, print_char		#	
	syscall				#
endif2:	addi $t1, $t1, 0x30		#		print_char(0x30 + bit);
	or $a0, $t1, $0			#		
	li $v0, print_char		#	
	syscall				#
endif:	sll $t0, $t0, 1			#	value = value << 1;
	addi $t2, $t2, 1		# 	i++;
	j for				# }
endfor: jr $ra	