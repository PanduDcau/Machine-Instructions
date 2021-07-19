.data
array: .word 1:4

.text
 li $t0,0
 lw $a0, array($t0)
 li $v0,1
 syscall
 addi $t0,$t0,4
 lw $a0,array($t0)
 li $v0,1
 syscall
  addi $t0,$t0,4
 lw $a0,array($t0)
 li $v0,1
 syscall
  addi $t0,$t0,4
 lw $a0,array($t0)
 li $v0,1
 syscall




