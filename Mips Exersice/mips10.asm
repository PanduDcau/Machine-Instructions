# print two floats and get the sum
.text
li $v0,6
syscall
mov.s $f1,$f0
li $v0,6
syscall
mov.s $f2,$f0
add.s $f12,$f1,$f2
li $v0,2
syscall