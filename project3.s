
input: .space 1032
newline: .asciiz "\n"
error: .asciiz "NaN" #prints this for invalid outputs


main : 

li $v0, 8 #syscall for user input
la $a0, input #stores the input in the argument register
li $a1, 1001  # maximum input of 1000 charactars

move $s0, $a0 #moves the input to a temp register. 
