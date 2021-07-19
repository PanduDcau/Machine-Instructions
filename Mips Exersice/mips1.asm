.text
#li $t0,16
#addi $t1,$t0,4
la $a0,str
li $v0, 4
syscall
li $v0,10
syscall
.data

str: .asciiz "University of Colombo\n"
