addi $t0, $0,10
addi $t1, $0,0	#$t1 = i, will be used to count loops within the for loop
#initializing A,B,C
addi $s1, $0,1 	#A
addi $s2, $0,-1	#B
addi $s3, $0,1	#C
sll, $s3,$s3,9

#initializing variables that will be used to chage A,B,C
addi $t2, $0, 4
addi $t3, $0, -1

#initializing the answer register
addi $s5,$0,0
#for loop
for:
beq $t1, $t0, end
mul $s4,$s2,$s1	#A*B
mul $s4, $s4,$s3 #AB*C
add $s5,$s5,$s4	#summing A*B*C to $s5
#changing A,B,C values for the next multiplication
mul $s1,$s1, $t2		#*4
mul $s2, $s2, $t3	#*(-1)
srl $s3, $s3, 1		#/2
addi $t1, $t1, 1		#i++
j for
end:
