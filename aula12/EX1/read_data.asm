# Mapa de registos
# st:	$t0
# st+i:	$t3
# ns:	$t1	
# i:	$t2
	
	# offsets
	.eqv id_number, 0
	.eqv first_name, 4
	.eqv last_name, 22
	.eqv grade, 40
	
	.eqv SIZE_STUDENT, 44
	.eqv SIZE_FIRST_NAME, 17
	.eqv SIZE_LAST_NAME, 14
	
	.eqv read_int, 5
	.eqv print_string, 4
	.eqv read_string, 8
	.eqv read_float, 6
	
	.data
str1:
	.asciiz "N. Mec: "
str2:
	.asciiz "Primeiro Nome: "
str3:
	.asciiz "Ultimo Nome: "
str4:
	.asciiz "Nota: "
	.text
	.globl read_data
read_data:
	move $t0, $a0					# // $t0 = st
	move $t1, $a1					# // $t1 = ns
	li $t2, 0						# // i = 0
for:								# for(i=0; i < ns; i++) {
	bge $t2, $t1, endfor			#
	mul $t3, $t2, SIZE_STUDENT		#	// $t3 = i*SIZE_STUDENT
	addu $t3, $t0, $t3			 	# 	// $t3 = st+i
	li $v0, print_string			#	print_string(str1);
	la $a0, str1					#
	syscall							#
	li $v0, read_int				#	st[i].id_number = read_int();
	syscall							#
	sw $v0, id_number($t3)			#
	li $v0, print_string			#	print_string(str2);
	la $a0, str2					#
	syscall							#
	li $v0, read_string				#	read_string(st[i].first_name, 17)
	addiu $a0, $t3, first_name		#	// $a0 = &(st[i].first_name)
	li $a1, SIZE_FIRST_NAME			#	
	syscall							#
	li $v0, print_string			#	print_string(str3);
	la $a0, str3					#
	syscall							#
	li $v0, read_string				#	read_string(st[i].last_name, 17)
	addiu $a0, $t3, last_name		#	// $a0 = &(st[i].last_name)
	li $a1, SIZE_LAST_NAME			#	
	syscall							#
	li $v0, print_string			#	print_string(str4);
	la $a0, str4					#
	syscall							#
	li $v0, read_float				#	st[i].grade = read_float()
	syscall							#
	s.s $f0, grade($t3)				# 
	addi $t2, $t2, 1				#	// i++
	j for							#
endfor:								# }
	jr $ra