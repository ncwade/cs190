# CS190 - Nick Wade - 2016
# Lab8

# Translate the following C code into MIPS assembly.

# Code:
#include <stdio.h>
# int function(int value)
# {
# 	int retval;
# 	retval = 2 * value + 2;
# 	return retval;
# }

# int sumOfFunction(int start, int end)
# {
# 	int i;
# 	int sum = 0;
# 	int temp;

# 	if (end < start) {
# 		temp = start;
# 		start = end;
# 		end = temp;
# 	}
# 	for (i = start; i <= end; i++) {
# 		sum = sum + function(i);
# 	}
# 	return sum;
# }

# This involves function calls (jal <functionname>) so apply all of the necessary
# instructions to follow the calling discipline demonstrated in class. Also note, 
# this involves a function calling another function so preserving argument and 
# return address registers is needed.

# Register usage:
# $s0 -> start
# $s1 -> end
# $s2 -> sum

# Define our entry points.
# This is sumOfFunction
.globl main
main:

## First get start & end values from the user.
# First we need to prompt the user for their start number.
li $v0, 4
la $a0, p_1
syscall
# Now read the number.
li $v0, 5
syscall
addi $s0, $v0, 0

# Now prompt for a end number.
li $v0, 4
la $a0, p_1
syscall
# Now read the number.
li $v0, 5
syscall
addi $s1, $v0, 0

## Now we perform the logical operations.
# Determine if $s1 < $s0. It is easiest to do if we invert the given condition.
bge $s1, $s0, ELSE
addi $t0, $s1, 0
addi $s1, $s0, 0
addi $s0, $t0, 0
ELSE:

# Zero out $t0 to use as our loop control.
addi $t0, $s0, 0

# Now loop from $s0 -> $s1.
LOOP:
	# Loop control.
	bgt $t0, $s1, EXIT

	# Prepare to pass "i"($t0) to the function.
	addi $a0, $t0, 0
	# Call function.
	jal FUNCTION

	# Increment "sum" by the return value of "function".
	add $s2, $s2, $v0
	# Swing back to the top.
	addi $t0, $t0, 1
	j LOOP
EXIT:

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

# Defintion of "function"
FUNCTION:
	# Save whatever was on $t0 to stack so we can use here.
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	# $t0 = retval
	# $a0 = value
	# This evaluates 2 * value
	sll $t0, $a0, 1
	# Add 2 to the result
	addi $t0, $t0, 2
	# Set the return value and return.
	addi $v0, $t0, 0
	# Reset $t0 based on the stack.
	lw $t0, 0($sp)
	addi $sp, $sp, 4 
	jr $ra

# Define the variables used in our program.
.data
p_1:      .asciiz "Enter a number: "
result:   .asciiz "\nThe sum is: "
