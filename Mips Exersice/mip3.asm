.text
readValue:

la $a0,prompt
li,$v0,4
syscall

li $v0,5
syscall

la $t0, value
sw $v0,0($t0)
syscall

.data
prompt: .asciiz "Enter your Integer :"
.align 2  #provide a align deractive for give a word boundary
value: .space 20 #specify number of bytes to be allocated