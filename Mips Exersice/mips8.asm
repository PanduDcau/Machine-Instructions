.text
la $a0, indata
li $a1,11
li $v0, 8
syscall
li $v0,4
syscall
li $v0,10
syscall
.data

indata: .space 20 #reserve 20 bytes