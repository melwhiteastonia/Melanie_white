
input: .space 1032
newline: .asciiz "\n" #prints it on a new line
error: .asciiz "NaN" #prints this for invalid outputs
comma: .ascizz "," #prints comma

main : 

li $v0, 8 #syscall for user input
la $a0, input #stores the input in the argument register
li $a1, 1001  # maximum input of 1000 charactars

jal SubA

move $s0, $a0 #moves the input to a temp register. 

SubA:

lb $t0, ($a0)


charactars: 

beq 