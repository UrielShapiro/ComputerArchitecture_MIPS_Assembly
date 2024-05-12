addi $s0,$0,1	#first data to insert
addi $s3, $0, 0x10011020	#inserting the address to $s3
add $s2,$0,$s3	#inserting the address to $s2, so we won't lose the base address
addi $t1,$0,31	#initializing a variable that stores the amount of iterations of the loop
for:
beq $s0,$t1, end	#branch when $s0 reaches 31 (which won't be inserted)
sw $s0,0($s2)	#storing $s0 into $s2 address
#changing variables for the next iteration
addi $s2,$s2,4	#increasing the address by 4 (a jump to the next word)
addi $s0,$s0,2	#adding 2 to $s0, the next data that will be inserted to the memory
j for
end:
