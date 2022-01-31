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
	
	.data
stg:
	.word 72343
	.asciiz "Napoleao"		# first_name: 18 bytes, 'Napoleao': 8+1=9 bytes
	.space 9				# 18-9 = 9 -> fill in the other 9 bytes left
	.asciiz "Bonaparte"		# last_name: 15 bytes, 'Bonaparte': 9+1=10 bytes
	.space 5				# 15-10 = 5 -> fill in the other 5 bytes left
	.float 5.1
str1:
	.asciiz "\nN. Mec: "
str2:
	.asciiz "\nNome: "
str3:
	.asciiz "\nNota: "
	.text
	.globl main
main:
	la $t0, stg					# // $t0 = stg
	li $v0, print_string		# print_string(str1)
	la $a0, str1				#
	syscall						#
	li $v0, print_intu10		# print_intu10(stg.id_number)
	lw $a0, id_number($t0)		#
	syscall						#
	li $v0, print_string		# print_string(str2)
	la $a0, str2				#
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
	li $v0, print_string		# print_string(str3)
	la $a0, str3				#
	syscall						#
	li $v0, print_float			# print_float(stg.grade)
	l.s $f12, grade($t0)		#
	syscall						#
	li $v0, 0					# return 0
	jr $ra
