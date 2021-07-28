.text
# Print the prompt
la $a0,in1
li $v0,4
syscall
#Read the first number
li $v0,5
syscall
# Move the number to register t0
move $t0,$v0

#Print the prompt
la $a0,in2
li $v0,4
syscall
#Read the second number
li $v0,5
syscall
#Move it to register t1
move $t1,$v0

start:
bgt $t0,$t1, label1
sub $t1,$t1, $t0
j print

label1: 
sub $t0,$t0,$t1

print:
bne $t0,$t1 start
#Print tne result in a0 register
la $a0,out
li $v0,4
syscall

move $a0,$t0
li $v0,1
syscall

li $v0,10
syscall

.data
in1: .asciiz "Enter the first integer :"
in2: .asciiz "Enter the second integer :"
out: .asciiz "The greatest common divisor = " 