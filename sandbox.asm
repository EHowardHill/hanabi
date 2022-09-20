.data
     str1: .asciiz    "A"
.globl main
main:
    li $a0, $str1
    add $v0, 4, $zero
    syscall
    
    add $v0, 10, $zero
    syscall