# i = $a0
# addr = $a1
# sum = $s0

StrangeSum:
addi $sp, $sp -8 #make room for $ra and $v0
sw $ra, 0($sp)
addi $s0, $0,0	#sum
addi $t0, $0,0	#j
#addi $t1,$0,1
addi $s2, $a1,0 #$s2 = address
for:
bgt $t0, $a0, continue 	#if j>i, end for loop
#slt $t3,$t0,$a0		#check if j<i
#beq $t0,$a0, skip	#for the case when j=i
#beq $t3, $0, continue	#if $t3 = 0 => j>=i
#skip:
lw $t2, 0($s2)
mul $t2, $t2,3
sw $t2, 0($s2)
add $s0, $s0, $t2	#sum+=Arr[j]
addi $s2,$s2,4		#increase the address by 4
addi $t0,$t0, 3	#j+=3
addi $t0,$t0, -1	#j--
j for

continue:
add $a0,$0, $s0
jal multi
lw $ra,0($sp)	#$s4 = $ra
addi $v0,$s0,0	#$v0 = original sum
addi $sp,$sp, 8
jr $ra

multi:
mul $v0, $a0,12
jr $ra