.text
li $9,20
li $10,10
add $10,$9,$10
li $v0,10
syscall

#adding number with system call
li $t0, 3
li $t1, 5
add $a0, $t0,$t1
#mov $a0,$t2
li $v0,1
syscall
li $v0,10
.data