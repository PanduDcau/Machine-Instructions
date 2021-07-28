
.data
num1: .word 10,15
newline: .asciiz "\n"

.text
la $t0, 0
lw $a0, num1($t0)
li $v0, 1
syscall

la $a0, newline
li $v0, 4
syscall
li $v0, 1
addiu $t0,$t0, 4
lw $a0,num1($t0)
syscall
li, $v0, 10
syscall