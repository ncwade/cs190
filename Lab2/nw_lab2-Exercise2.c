#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

void exercise_two()
{
	int x, y, z = 0;
	const int MAX_ANIMALS = 100;
	const int MAX_DOLLARS = 100;

	// Let's use ducks as the outside loop.
	for (x = 0; x <= MAX_ANIMALS; x++) {
		for (y = 0; y <= MAX_ANIMALS; y++) {
			for (z = 0; z <= MAX_ANIMALS; z+=3) {
				int sum = (x * 5) + (y * 3) + (z/3);
				if (sum == MAX_DOLLARS && (x + y + z) == MAX_ANIMALS) {
					printf("A possible combination is; %d ducks, %d cats, and %d chickens. = %d \n", x, y, z, x+y+z);
				}
			}
		}
	}
}

int main(int argc, char **argv)
{
	exercise_two();
	return 0;
}