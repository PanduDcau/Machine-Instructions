#Index - 18001343 
#program name: Assignment2_18001343
#MIPS Programming Assignment 01 - Finding GCD of two numbers

.text
#FIRST INTEGER
#printing the message
la $a0,message1
li $v0,4
syscall
#reading the first integer
li $v0,5
syscall
move $t1,$v0 
#now $t1 holds the first integer

#SECOND INTEGER
#Printing the message
la $a0,message2
li $v0,4
syscall
#reading the second integer
li $v0,5
syscall
move $t2,$v0 
#now $t2 holds the second integer

#calculating the gcd 
loop:
beq $t1, $t2, output #if two numbers are equal print the output and end the program
bgt $t1,$t2,updateFirstNumber #if (first number > second number), then branch to updateFirstNumber
#Else update the second number
sub $t2,$t2,$t1 # $t2 <= $t2 - $t1
#jump to endIf
j endIf

updateFirstNumber:
#updating the first number
sub $t1,$t1,$t2 # $t1 <= $t1 - $t2

endIf:
#jump to the begining of the loop
j loop

output:
#PRINTING THE OUTPUT
#printing the message
la $a0,message3
li $v0,4
syscall
#printing the gcd
move $a0,$t1
li $v0,1
syscall

#ending the program
li $v0,10
syscall

.data
message1: .asciiz "\nEnter the first integer: "
message2: .asciiz "\nEnter the second integer: "
message3: .asciiz "\nThe greatest common divisor: "
