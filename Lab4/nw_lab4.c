#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

// Rotate a string.
char *rot13(char *plain_or_cipher)
{
    // Get the size of the data being given to us.
    size_t length = strlen(plain_or_cipher);
    // Allocate an output string. The user will need to free this pointer.
    char * output = malloc(length);
    // Loop through each character.
    for (int i = 0; i < length; i++) {
        // If it's a character, we can handle it.
        if (isalpha(plain_or_cipher[i])) {
            // Determine if our base need to be uppercase or lowercase.
            char char_base = islower(plain_or_cipher[i]) ? 'a' : 'A';
            // Subtract our base from the value, move up by 13.
            // Mod by 26 to wrap back around, and then re-add the base.
            output[i] = (plain_or_cipher[i] - char_base + 13) % 26 + char_base;
        } else {
            // Not in the alphabet, just give it back.
            output[i] = plain_or_cipher[i];
        }
    }

    return output;
}

int main(int argc, char **argv)
{
    while(true) {
        // Variables needed for user input.
        char *line = NULL;
        size_t len = 0;
        ssize_t read;

        printf ("Enter your string: ");
        read = getline(&line, &len, stdin);

        // Exit if they enter 0 or if there is an error.
        if (read == -1 || strcmp(line, "0\n") == 0) {
            break;
        }

        // Move the null terminator down to the EOL character..
        line[strcspn(line, "\r\n")] = 0;

        // Rotate our string and provide output.
        const char* rotated = rot13(line);
        printf("%s=%s\n", line, rotated);

        // Free both allocated character arrays.
        free((void*)rotated);
        free(line);
    }

    return 0;
}