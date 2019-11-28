
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

jal suba

#-------------------------------------------------------------------------------------------------------
suba:

sub $sp, $sp,4   #creating space in the stack
sw $a0, 0($sp) #puts input in the stack
lw $t0, 0($sp)  #loading the input into $t0
addi $sp,$sp,4   #moving the stack pointer to the space
move $t6, $t0    #storing the input into $t6


#-----------------------------------------------------------------------------
move $s0, $a0 #moves the input to a temp register. 

loop:

lb $t1, ($t0)  #gets the first charactar

la $s5, 0
la $s6, 0 

beq $t3, 10, end   # if the charactar is a new line then it ends
beqz $t3, end       # if null then it is the end
addu $s2, $s2, 1 #incrementor for index
addu $t0, $t0, 1 #incrementor for the next charactar 
bne $t3, 44, main    #will go backwards on the string to check the next charactar if a comma
subu $s2, $s2, 1    #
beq $s1, $s2, empty

#----------------------------------------------------------------------------------------
charactars: 

beq 

check: 

bgt $t2,0,invalidloop #checks to see if there were any spaces or tabs in between valid characters
beq $s0, 9,  gap #checks to see if there is a tab characters
beq $s0, 32, gap #checks to see if there is a space character
blt $s0, 48, invalidloop # checks to see if the ascii less than 48
blt $s0, 58, vaild # checks to see if the ascii less than 57(integers)
blt $s0, 65, invalidloop # checks to see if the ascii less than 64
blt $s0, 85, vaild	# checks to see if the ascii less than 84(capital letters)
blt $s0, 97, invalidloop # checks to see if the ascii less than 96
blt $s0, 117, vaild 	# checks to see if the ascii less than 116(lowercase letters)
bge $s0, 117, invalidloop # checks to see if the ascii greater than 116