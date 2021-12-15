# Mapa de registos
# exit_value:	$t0
	
	.data
	.eqv STR_MAX_SIZE, 30
	.eqv print_string, 4
	.eqv print_int10, 1
str1:
	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:
	.space 31
str3:
	.asciiz "\n"
str4:
	.asciiz "String too long: "
	.text
	.globl main
main:
	addiu $sp, $sp, -4				# preserve values in stack
	sw $ra, 0($sp)					#

	la $a0, str1					# // strlen(str1)
	jal strlen						#
	bgt $v0, STR_MAX_SIZE, else		# if(strlen(str1) <= STR_MAX_SIZE) {
	la $a0, str2					#	strcpy(str2, str1)
	la $a1, str1					#
	jal strcpy						#
	li $v0, print_string			#	print_string(str2)
	la $a0, str2					#
	syscall							#
	li $v0, print_string			#	print_string(str3)
	la $a0, str3					#
	syscall							#
	la $a0, str2					#	// strrev(str2)
	jal strrev						#
	move $a0, $v0					#	print_string(strrev(str2))
	li $v0, print_string			#
	syscall							#
	li $t0, 0						#	exit_value = 0
	j endif							# }
else:								# else {
	li $v0, print_string			#	print_string(str4)
	la $a0, str4					#
	syscall							#
	la $a0, str1					#	// strlen(str1)
	jal strlen						#
	move $a0, $v0					#	print_int10(strlen(str1))
	li $v0, print_int10				#
	syscall							#
	li $t0, -1						#	exit_value = -1
endif:								# }
	move $v0, $t0					# return exit_value
	
	lw $ra, 0($sp)					# retrieve values from stack
	addiu $sp, $sp, 4				#
	
	jr $ra
