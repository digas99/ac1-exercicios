	.data
	.text
	.globl main
main:	ori $t0, $0, 0x0F1E	# $t0 = 0x0F1E
	#ori $t1, $0, 0xFFFF	# $t1 = 0xFFFF
	nor $t2, $0, $t0
	#xor $t2, $t1, $t0	# $t2 = 0x0F1E ^ 0xFFFF
	
	jr $ra