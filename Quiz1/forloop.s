# CS190 - Nick Wade - 2016

# Translate the following C code into MIPS assembly.
# int a = 10; // 0x800
# int b; // 0x804
# int product = 1; //0x808
# for (b = a; b < 25; b+=2) {
#     product = product * b
# }

# Define our entry points.
.globl main

main:

# Load all needed values.
lw $t0, a_var
move $t1, $t0 # First part of our for loop where we set b = a.
lw $t2, product
lw $t3, loop_constant

loop: # Mark the beginning of our for loop.
slt $t4, $t3, $t1 # checks if b < 25
beq $t4, 1, end # if b < 25, drop out of loop.
mult $t2, $t1 # Perform multiplication
mflo $t2 # Save multiplication back into the product register.
addi $t1, $t1, 2 # b = b + 2
j loop # Jump back to top of loop.
end:

# Save values back to variables.
sw $t1, b_var
sw $t2, product

# Syscalls to exit cleanly.
li $v0, 10
syscall

# Define the variables used in our C program.
.data
a_var:			.word 10
b_var:			.word 0
loop_constant:	.word 25
product:		.word 1
