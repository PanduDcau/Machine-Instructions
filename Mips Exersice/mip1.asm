#Program  datadec

.text
main: la $t0, array1
lw $a0, ($t0)
li $v0,1 #$v0 represent the systemcall number
syscall

addi $t0,$t0, 4
lw $a0, ($t0)
li $v0,1
syscall

li $v0, 10
syscall
.data

array1: .word 4,6 #8 bytes are allocated