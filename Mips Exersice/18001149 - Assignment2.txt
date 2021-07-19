# Start with data declarations
#Index Number :- 18001149

.data
input1: .asciiz "Enter First Integer n1: "
input2: .asciiz "Enter Second Integer n2: "
OutGCD: .asciiz "The Greatest Common Divisor of n1 & n2 is "
newline: .asciiz "\n"

.align 2
.globl main

.text

main:
#----------------------------------------------------------
#Reading Data ( I tried to Use recursion method to get The GCD)
# ---------------------------------------------------------
# Obtaining two integer inputs from the user
# ---------------------------------------------------------
    la $a0, input1         # input1 address is loaded into $a0 (Calling the Input n1)
    li $v0, 4              # Loading Input/Output code for the input1
    syscall                # Output is print

    li $v0, 5              # Integer Input loaded
    syscall                # Enter the integer n1 into $v0.
    add $a1, $v0, $zero    # keep n1 in $a1 (Register Zero is Used)

    la $a0, input2         # Input2  address is loaded into $a0 (Calling the Input n2)
    li $v0, 4              # load string output I/O code
    syscall                # Show St2 Output

    li $v0, 5              # load integer input code
    syscall                # Enter the integer n2 into $v0.
    add $a2, $v0, $zero    # keep n2 in $a2 to store the Value

# ---------------------------------------------------------
# Calling GCD function
# ---------------------------------------------------------
    addi $sp, $sp, -8      # stack should be adjusted for two items
    sw $a1, 4($sp)         # Argument1 should be saved
    sw $a2, 0($sp)         # Argument2 should be saved
    jal gcd                # Indicate to jump to "gcd" subroutine
    lw $a2, 0($sp)         # Argument2 is loaded
    lw $a1, 4($sp)         # Argument1 is loaded
    addi $sp, $sp, 4       # One item from the stack is removed; stack space is reused for $s0.
    add $s0, $v0, $zero    # Result from GCD stored in $s0
    sw $s0, 0($sp)         # Result of the GCD Subroutine will stored in $s0

# ---------------------------------------------------------
# Outputting Final GCD Results
# ---------------------------------------------------------
    la $a0, OutGCD         #OutGCD address is loaded into $a0
    li $v0, 4              # String output is loaded
    syscall                # OutGCD will be outputed 
    li $v0, 1              # Integer output will be loaded
    add $a0, $s0, $zero    # Comparing $a0 & $s0 , Result of GCD will put to $a0
    syscall                # Results will be Outputed from GCD
    li $v0, 1              # Integer output will be loaded
    la $a0, newline        # insert newline into $a0
    li $v0, 4              # String output will be loaded
    syscall                # Newline will be Printed

    li $v0, 10             # To terminate program, code will loaded from here
    syscall                # Program will be terminated
    
    # +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Calculates the Greatest Common Divisor
# ---------------------------------------------------------
gcd:
    addi $sp, $sp, -8      # stack should be adjusted for two items
    sw $ra, 4($sp)         # Keep the return address
# ---------------------------------------------------------
# Recursive Step (Part 1)
    div $a1, $a2           # Argument1 divided by Argument 2, store the remaining in $HI
    mfhi $s0               # In $s we store reminder of Argument1 % Argument2
    sw $s0, 0($sp)         # save the remainder
    bne $s0, $zero, L1     # If $s0 != 0 , Recurse should be triggered
# ---------------------------------------------------------
# Base Case
    add $v0, $a2, $zero   # $v0 is used to save Argument2 which contains the result
    addi $sp, $sp, 8      # Popping two items from stack
    jr $ra                # return
# ---------------------------------------------------------
# Recursive Step (Part 2)
L1:
    add $a1, $a2, $zero   # Setting Argument1 to Argument2
    lw $s0, 0($sp)        # Loading the StackPointer
    add $a2, $s0, $zero   # Setting argument2 to StackPointer
    jal gcd               # recursive call
    
# ---------------------------------------------------------
# Exit Recursion
    lw $ra, 4($sp)        # Preceding return address should be loaded
    addi $sp, $sp, 8      # Two Items pop from Stack
    jr $ra                # return

