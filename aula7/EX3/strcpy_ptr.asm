# Mapa de registos
# *src:	$t0
		
	.data
	.text
	.globl strcpy_ptr
strcpy_ptr:						# do {
	lb $t0, 0($a1)				# 	// $t0 = *src
	sb $t0, 0($a0)				# 	*p = *src
	addiu $a0, $a0, 1			# 	p++
	addiu $a1, $a1, 1			#	// src++
	bne $t0, '\0', strcpy_ptr	# while(*src++ != '\0')
	move $v0, $a0				# return dst
	jr $ra
	
# strcpy.c
#
# char *strcpy(char *dst, char *src) {
#	char *p = dst;
#	do {
#		*p++ = *src;
#	} while(*src++ != '\0');
#	return dst;
# }