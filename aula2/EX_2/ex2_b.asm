	.data
	.text
	.globl main
main:	li $t0, 0x862A5C1B
	sll $t2, $t0, 2
	srl $t3, $t0, 2
	sra $t4, $t0, 2
	
	jr $ra