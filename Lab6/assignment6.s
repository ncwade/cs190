# CS190 - Nick Wade - 2016
# Lab6

# Translate the following C code into MIPS assembly.
# int a = 5;
# int b = 10;
# int c, d, e;

# c = a + b;
# d = c + 8 + a – 6;
# e = d – c;

# Load the variables into the registers listed below and write MIPS assembler
# to perform the shown mathematical expressions. Store c, d, and e into memory
# after the computations are complete. Using the SPIM simulator, assure the 
# memory locations assigned to c, d, and e contain the correct final values.

# Notes
# Use the following registers when you evaluate the above expressions:
# a: $s0
# b: $s1
# c: $s2
# d: $s3
# e: $s4

# Define our entry points.
.globl main
main:

# Load all needed values. We do not load c/d/e since they are just 0;
lw $s0, a_var
lw $s1, b_var

# Now perform transform each line of C code into our MIPs.
# c = a + b;
add $s2, $s0, $s1 # 15

# d = c + 8 + a – 6;
addi $t0, $s2, 8  # Expected Result: 23
add $t1, $t0, $s0 # Expected Result: 28
addi $s3, $t1, -6 # Expected Result: 22

# e = d – c;
sub $s4, $s3, $s2 # Expected Result: 7

# Save values back to variables. Per the assignment we only save back c/d/e to memory.
sw $s2, c_var
sw $s3, d_var
sw $s4, e_var

# Print values. Not in original request, added later.
# We basically print the prefix string, the register value, and the newline char for each.
li $v0, 4
la $a0, a_str
syscall
li  $v0, 1
add $a0, $s0, $zero
syscall
li $v0, 4
la $a0, new_line
syscall

li $v0, 4
la $a0, b_str
syscall
li  $v0, 1
add $a0, $s1, $zero
syscall
li $v0, 4
la $a0, new_line
syscall

li $v0, 4
la $a0, c_str
syscall
li  $v0, 1
add $a0, $s2, $zero
syscall
li $v0, 4
la $a0, new_line
syscall

li $v0, 4
la $a0, d_str
syscall
li  $v0, 1
add $a0, $s3, $zero
syscall
li $v0, 4
la $a0, new_line
syscall

li $v0, 4
la $a0, e_str
syscall
li  $v0, 1
add $a0, $s4, $zero
syscall
li $v0, 4
la $a0, new_line
syscall
# Stop printing values.

# Syscalls to exit cleanly.
li $v0, 10
syscall

# Define the variables used in our program.
.data
a_str:      .asciiz  "a: "
b_str:      .asciiz  "b: "
c_str:      .asciiz  "c: "
d_str:      .asciiz  "d: "
e_str:      .asciiz  "e: "
new_line:   .asciiz  "\n"
a_var:   .word 5
b_var:   .word 10
c_var:   .word 0
d_var:   .word 0
e_var:   .word 0
