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

# Define main entry point.
.globl main
main:

# Load values into arguement registers.
addi $a0, $0, 5
addi $a1, $0, 10
# Call the function.
jal SUMOFFUNCTION
# Retrieve return value.
addi $s2, $v0, 0

## Now we do all output operations.
li $v0, 4
la $a0, result
syscall
# Now print our final integer.
li  $v0, 1
add $a0, $s2, $zero
syscall

# Needed to cleanly exit QtSpim.
li $v0, 10
syscall

# Definition of "sumOfFunction"
# Register usage:
# $s0 -> start
# $s1 -> end
# $s2 -> sum
SUMOFFUNCTION:
	# Load arguements into registers.
	addi $s0, $a0, 0
	addi $s1, $a1, 0

	# Store the return address for use later.
	addi $sp, $sp, -4
	sw $ra, 0($sp)

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

	# Set return value.
	addi $v0, $s2, 0
	# Reset the return address.
	lw $ra, 0($sp)
	addi $sp, $sp, 4 
	jr $ra


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
result:   .asciiz "\nsum="
