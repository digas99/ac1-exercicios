# Mapa de registos
# array:		$a0
# value:		$a1
# pos:			$a2
# size:			$a3	
# i:			$t0	
# i*4:			$t1
# array+i,
# array+pos:	$t2
# array[i]:		$t3
	
	.data
	.text
	.globl insert
insert:
	ble $a2, $a3, else		# if(pos > size) {
	li $v0, 1				# 	return 1
	j endif					# }
else:						# else {
	sub $t0, $a3, 1			# 	// i = size-1
for:						#	for(i = size-1; i >= pos; i--) {
	blt $t0, $a2, endfor	#
	sll $t1, $t0, 2			#		// $t1 = i*4
	addu $t2, $a0, $t1		#		// $t2 = array+i
	lw $t3, 0($t2)			#		// $t3 = array[i]
	sw $t3, 4($t2)			#		array[i+1] = array[i]
	sub $t0, $t0, 1			#		// i--
	j for					#	}
endfor:						#
	sll $t2, $a2, 2			#	// $t2 = pos*4
	addu $t2, $a0, $t2		# 	// $t2 = array+pos
	sw $a1, 0($t2)			# 	array[pos] = value
	li $v0, 0				#	return 0
endif:						# }
	jr $ra