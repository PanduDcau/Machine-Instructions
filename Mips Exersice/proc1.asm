#proc01.asm
# Start with data declarations

.data
str1: .asciiz "Enter First Integer n1: "
str2: .asciiz "Enter Second Integer n2: "
str3: .asciiz "The Greatest Common Divisor of n1 & n2 is "
str4: .asciiz "\nThe Least Common Multiple of n1 & n2 is "
newline: .asciiz "\n"

.align 2
.globl main
.text

main:
# ---------------------------------------------------------
# Receiving two integer inputs from user
# ---------------------------------------------------------
    la $a0, str1           # load str1 address into $a0
    li $v0, 4              # load I/O code for string output
    syscall                # output str1

    li $v0, 5              # load I/O code for integer input
    syscall                # input integer n1 into $v0
    add $a1, $v0, $zero    # store n1 in $a1

    la $a0, str2           # load str2 address into $a0
    li $v0, 4              # load I/O code for string output
    syscall                # output str2

    li $v0, 5              # load I/O code for integer input
    syscall                # input integer n2 into $v0
    add $a2, $v0, $zero    # store n2 in $a2

# ---------------------------------------------------------
# Calling gcd -> need to preserve arguments for lcm
# ---------------------------------------------------------
    addi $sp, $sp, -8      # adjust stack for 2 items
    sw $a1, 4($sp)         # save argument1
    sw $a2, 0($sp)         # save argument2
    jal gcd                # jump to subroutine 'gcd'
    lw $a2, 0($sp)         # load argument2
    lw $a1, 4($sp)         # load argument1
    addi $sp, $sp, 4       # pop 1 item from the stack; reuse stack space for $s0
    add $s0, $v0, $zero    # $s0 = result from gcd
    sw $s0, 0($sp)         # save the result from gcd

# ---------------------------------------------------------
# Calling lcm
# ---------------------------------------------------------
    jal lcm                # jump to subroutine 'lcm'
    add $s1, $v0, $zero    # $s1 = result from lcm
    lw $s0, 0($sp)         # load result from gcd
    addi $sp, $sp, 4       # pop 1 item from the stack

# ---------------------------------------------------------
# Outputting Results
# ---------------------------------------------------------
    la $a0, str3           # load str3 address into $a0
    li $v0, 4              # load I/O code for string output
    syscall                # output str3
    li $v0, 1              # load I/O code for integer output
    add $a0, $s0, $zero    # $a0 = $s0; put gcd result in $a0 for output
    syscall                # output result from gcd
    la $a0, str4           # load str4 address into $a0
    li $v0, 4              # load I/O code for string output
    syscall                # output str4
    li $v0, 1              # load I/O code for integer output
    add $a0, $s1, $zero    # $a0 = $s1; put lcm result in $a0 for output
    syscall                # output result from lcm
    la $a0, newline        # load newline into $a0
    li $v0, 4              # load I/O code for string output
    syscall                # output a newline

    li $v0, 10             # load code for terminating program
    syscall                # terminate program

# ---------------------------------------------------------
# Calculates the greatest common divisor
# ---------------------------------------------------------
gcd:
    addi $sp, $sp, -8      # adjust stack for 2 items
    sw $ra, 4($sp)         # save the return address
# ---------------------------------------------------------
# Recursive Step (Part 1)
    div $a1, $a2           # divide arg1 by arg2; remainder in $HI
    mfhi $s0               # $s0 = arg 1 % arg2
    sw $s0, 0($sp)         # save the remainder
    bne $s0, $zero, L1     # recurse if $s0 != 0
# ---------------------------------------------------------
# Base Case
    add $v0, $a2, $zero   # argument2 holds result, store in $v0
    addi $sp, $sp, 8      # pop 2 items from stack
    jr $ra                # return
# ---------------------------------------------------------
# Recursive Step (Part 2)
L1:
    add $a1, $a2, $zero   # set arg1 to arg2
    lw $s0, 0($sp)        # load remainder
    add $a2, $s0, $zero   # set arg2 to remainder
    jal gcd               # recursive call
# ---------------------------------------------------------
# Exit Recursion
    lw $ra, 4($sp)        # load previous return address
    addi $sp, $sp, 8      # pop 2 items from the stack
    jr $ra                # return


# ---------------------------------------------------------
# Calculates the least common multiple
# ---------------------------------------------------------
lcm:
    addi $sp, $sp, -12  # adjust stack for 3 items
    sw $ra, 8($sp)      # store return address
    sw $a1, 4($sp)      # store $a1
    sw $a2, 0($sp)      # store $a2

    jal gcd             # call gcd; result stored in $v0

    lw $a2, 0($sp)      # load $a2
    lw $a1, 4($sp)      # load $a1
    lw $ra, 8($sp)      # load return address

    mult $a1, $a2       # store $a1 * $a2 in $HI and $LO
    mflo $t0            # move the product stored in $LO to $t0
    div $t0, $v0        # $LO = $a1 * $a2 / gcd($a1, $a2)
    mflo $v0            # move the result stored in $LO to $v0

    addi $sp, $sp, 12   # pop 3 items from the stack
    jr $ra              # return