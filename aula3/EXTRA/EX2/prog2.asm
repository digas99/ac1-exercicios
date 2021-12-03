# Mapa de registos
# $t0 : res
# $t1 : i
# $t2 : mdor
# $t3 : mdo

	.data
str1:
	.asciiz "Introduza dois números:\n"
str2:
	.asciiz "Resultado: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	.text
	.globl main
main:
	li $t0, 0					# res = 0
	li $t1, 0					# i = 0
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, read_int			# mdor = read_int() & 0x0F
	syscall						#
	andi $t2, $v0, 0x0F			#
	li $v0, read_int			# mdo = read_int() & 0x0F
	syscall						#
	andi $t3, $v0, 0x0F			#
while:							#
	beqz $t2, endw				# while ((mdor != 0) && (i++ < 4)) {
	bge $t1, 4, endw			#
	addi $t1, $t1, 1			#
	andi $t4, $t2, 0x00000001	#	if( (mdor & 0x00000001) != 0 )
	beqz $t4, endif				#
	add $t0, $t0, $t3			#		res = res + mdo
endif:							#
	sll $t3, $t3, 1				#	mdo = mdo << 1
	srl $t2, $t2, 1				#	mdor = mdor >> 1
	j while						# }
endw:							#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	li $v0, print_int10			# print_int10(res)
	move $a0, $t0				#
	syscall						#
	jr $ra