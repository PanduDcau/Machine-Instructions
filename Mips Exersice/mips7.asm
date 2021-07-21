#system call 1 

.text
lw $a0, number
li $v0,1
syscall
li $v0,10
syscall
.data

number: .word 23