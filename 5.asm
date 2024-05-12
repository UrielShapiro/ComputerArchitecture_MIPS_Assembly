fib:
add $v0,$0,$0	#initializing $v0
bne $a1,1, not1	#if the argument is !=1, continue
addi $v0,$v0,1	#else: return 1
jr $ra
not1:	#checks if the argument is 0
bne $a1,$0, else	#if the argument is not 0, continue
add $v0,$0,$0	#else: return 0
jr $ra

else: 	#the argument is != 0,1. we will find what it is recursivly
addi $sp,$sp, -12	#empty 3 cells in the stack for $v0,$a1,$ra
sw $v0, 0($sp)   # store $ra
sw $a1, 4($sp)   # store $a1
sw $ra, 8($sp)	#store $v0
addi $a1, $a1, -1  # n = n - 1
jal fib     # recursive call for f(n-1) (because $a1 = n-1)
addi $sp,$sp,8
lw $t1, -8($sp)	#$t1 <- $v0 ($v0 is f(n-1))
lw $a1, -4($sp)	#$a1 <- $ra
add $v0,$v0,$t1	#$v0 += f(n-1)
addi $sp,$sp,-8	#$sp = -12(base)
sw $v0, 0($sp)
sw $a1,4($sp)
addi $a1,$a1,-2 	# n = n-2
jal fib
addi $sp, $sp, 12   # restore $sp
lw $ra, -4($sp)
lw $t1, -12($sp)
lw $a1, -8($sp)
add $v0,$v0,$t1
jr $ra

end:
