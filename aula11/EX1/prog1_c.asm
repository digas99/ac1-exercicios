# Mapa de registos
# stg:		$t0	
	
	# offsets
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	
	# syscalls
	.eqv print_string, 4
	.eqv print_intu10, 36
	.eqv print_char, 11
	.eqv print_float, 2
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv read_float, 6
	
	.data
stg:
	.space 44
str1:
	.asciiz "N. Mec: "
str2:
	.asciiz "Nome:\n"
str3:
	.asciiz "Nota: "
	.text
	.globl main
main:
	la $t0, stg					# // $t0 = stg
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, read_int			# stg.id_number = read_int()
	syscall						#
	sw $v0, id_number($t0)		#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
	syscall						#
	li $v0, read_string			# read_string(stg.last_name, 14)
	addiu $a0, $t0, last_name	#
	li $a1, 14					#
	syscall						#
	li $v0, read_string			# read_string(stg.first_name, 17)
	addiu $a0, $t0, first_name	#
	li $a1, 17					#
	syscall						#
	li $v0, print_string		# print_string(str3)
	la $a0, str3				#
	syscall						#
	li $v0, read_float			# stg.grade = read_float()
	syscall						#
	s.s $f0, grade($t0)			#
	li $v0, print_intu10		# print_intu10(stg.id_number)
	lw $a0, id_number($t0)		#
	syscall						#
	li $v0, print_char			# print_char(' ')
	li $a0, ' '					#
	syscall						#
	li $v0, print_string		# print_string(stg.last_name)
	addiu $a0, $t0, last_name	#
	syscall						#
	li $v0, print_char			# print_char(',')
	li $a0, ','					#
	syscall						#
	li $v0, print_string		# print_string(stg.first_name)
	addiu $a0, $t0, first_name	#
	syscall						#
	li $v0, print_char			# print_char(' ')
	li $a0, ' '					#
	syscall	
	li $v0, print_float			# print_float(stg.grade)
	l.s $f12, grade($t0)		#
	syscall						#
	li $v0, 0					# return 0
	jr $ra
