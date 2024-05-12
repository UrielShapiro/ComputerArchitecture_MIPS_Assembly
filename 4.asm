add $s4, $0, $s1 #$s4 <- base address
addi $t1, $0,0	#counter for not exceeding the aray length
addi $t5,$0,1	#will be used to check if the overflow is bigger than one (or equal)
addi $t0, $0,0	#counter for the amount of overflows

for:
beq $t1,$s2, end	#end if reached the end of the array
lw $s5, 0($s4)	#$s5 <- content of arr[$t1]
mult $s5,$s5	#arr[i]^2
mfhi $t4		#$t4 will store the overflow	
bge $t4,1,plus1	#if hi > 1, count that as an overflow
continue:
addi $s4, $s4, 4	#set $s4 for the next jump
addi $t1, $t1,1	#i++
j for

plus1:
addi $t0, $t0, 1	#counts the amount of overflows
j continue

end:
