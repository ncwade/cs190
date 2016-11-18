# CS190 - Nick Wade - 2016
# Lab7

# Translate the following C code into MIPS assembly.

# Code:
# int a1;
# int b1;
# int c1;
# char *p1 = “Enter a number: “;
# char *result = “The positive difference is : “;
# // Use syscall to handle these printf and scanf calls
# printf(p1);
# scanf (“%d”, &a1);
# printf(p1);
# scanf(“%d”, &b1);
# if  (a1 < b1)
# {
#    c1 = b1 – a1;
# }
# else
# {
#    c1 = a1 – b1;
# }
# printf (result);
# printf (“%d\n”, c1);


 
# When translating the above code, after reading the two integers, you may keep the two values read in registers (of your choice). 
# You need not store them.

 
# The code should:
# Prompt the user and read each integer (a1 and b1 although they will only be in registers and not in any named memory).
# Translate the ‘if’ statement to MIPS assembler (as per the lecture and exercise from last week).
# Print the string: ‘The positive difference is :’
# Print the computed difference (c1) as determined by the code from the if statement.
# Comment your code

# We will match the following registers to their variables above.
# a1 = $s0
# b1 = $s1
# c1 = $s2

# Define our entry points.
.globl main
main:

## First get inputs.
# First we need to prompt the user for their first number.
li $v0, 4
la $a0, p_1
syscall
# Now read the number.
li $v0, 5
syscall
addi $s0, $v0, 0

# Now prompt for a second number.
li $v0, 4
la $a0, p_1
syscall
# Now read the number.
li $v0, 5
syscall
addi $s1, $v0, 0


## Now we perform the logical operations.
# Determine if $s0 < $s1. It is easiest to do if we invert the given condition.
bge $s0, $s1, ELSE
sub $s2, $s1, $s0
# Note: We need to jump to finish here so we don't hit the else.
j FINISH
ELSE: sub $s2, $s0, $s1


## Now we do all output operations.
# Now print the result string.
FINISH: li $v0, 4
la $a0, result
syscall
# Now print our final integer.
li  $v0, 1
add $a0, $s2, $zero
syscall

# Needed to cleanly exit QtSpim.
li $v0, 10
syscall

# Define the variables used in our program.
.data
p_1:      .asciiz "Enter a number: "
result:   .asciiz "\nThe positive difference is: "
