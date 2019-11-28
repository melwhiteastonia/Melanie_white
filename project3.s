
input: .space 1032
newline: .asciiz "\n" #prints it on a new line
error: .asciiz "NaN" #prints this for invalid outputs
comma: .ascizz "," #prints comma

#------------------------------------------------------------------------------------

main : 

li $v0, 8 #syscall for user input
la $a0, input #stores the input in the argument register
li $a1, 1001  # maximum input of 1000 charactars

move $s0, $a0					#saving string to the $t0 register
move $t0, $s0

la $s1, 0   #starting index for the charactar
la $s2, 0   #starting index for the string 

jal SubA

#-------------------------------------------------------------------------------------------------------

move $s0, $a0 #moves the input to a temp register. 

SubA:

lb $t1, ($t0)  #gets the first charactar

la $s5, 0
la $s6, 0 

beq $t3, 10, end   # if the charactar is a new line then it ends
beqz $t3, end       # if null then it is the end

addu $s2, $s2, 1 #incrementor for the first charactar
addu $t0, $t0, 1 #incrementor for the next charactar 


charactars: 

beq 