#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Is the string a palindrome?
void question_one()
{
    char *line = NULL;  /* forces getline to allocate with malloc */
    size_t len = 0;     /* ignored when line = NULL */
    ssize_t read;
    bool is_palindrome = true;

    printf ("Enter your string: ");
    read = getline(&line, &len, stdin);
    if (read != -1) {
        size_t start = 0;
        size_t end = read-2;
        while(start < read - 2) {
            if (line[start] != line[end]) {
                is_palindrome = false;
                break;
            }
            start++;
            end--;
        }

        if (is_palindrome) {
            printf("yes it is a palindrome.\n");
        } else {
            printf("no it is not a palindrome.\n");
        }
    }

    free(line);
}

long factor_recursion(long n)
{
    if (n == 1) {
        return 1;
    } else {
        return n * factor_recursion(n - 1);
    }
}

long factor_iteration(long n)
{
    long final_value = 1;
    for (int i = 1; i <= n; ++i) {
        final_value *= i;
    }
    return final_value;
}

// Recursive & iterative factorial calculations.
void question_two()
{
    printf("The factorial(recursive) of %d is %lu\n", 10, factor_recursion(10));
    printf("The factorial(iteration) of %d is %lu\n", 10, factor_iteration(10));
}

int main(int argc, char **argv)
{
    question_one();
    question_two();
    return 0;
}