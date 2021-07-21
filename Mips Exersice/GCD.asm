# index number : 18001521
.text
main:
#(1)read data ------------------------------------------------------------------
#print first message
la $a0,first
li $v0,4
syscall
#reading first integer
li $v0,5
syscall
move $t0,$v0

#print second message
la $a0,second
li $v0,4
syscall
#reading second integer
li $v0,5
syscall
move $t1,$v0

#find gcd---------------------------------------------------------------------
check:
#(2)if a and b are equals a=gcd (jump to print gcd)
beq $t0,$t1,gcd
#if a>b (jump to a-b)
bgt $t0,$t1,subab
#if a<b (jump to b-a)
blt $t0,$t1,subba

#(3)substract smaller from larger-----------
#substract b from a (a-b)
subab:
sub $t0,$t0,$t1
jal check
#substract a from b (b-a)
subba:
sub $t1,$t1,$t0
jal check

#print gcd -------------------------------------------------------------------
gcd:
#print printgcd message
la $a0,printgcd
li $v0,4
syscall
#print a (gcd)
move $a0,$t0
li $v0,1
syscall
jal end

#end program -----------------------------------------------------------------
end: 
li $v0,10
syscall

.data
first: .asciiz "\nEnter the first integer :"
second: .asciiz "\nEnter the second integer :"
printgcd: .asciiz "\nThe greatest common divisor ="