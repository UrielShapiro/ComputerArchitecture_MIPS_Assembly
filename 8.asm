addi $s0,$0,0x1234
sll $s0,$s0,16
add $s0,$s0,$a1
slt $t1,$t2,$s3
#beq $t1 $0 0x3
sllv $s1,$s7,$t1
or $s5,$t9,$a3
#j 0x100003
sub $s2,$t5,$a2