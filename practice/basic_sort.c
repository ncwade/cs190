#include <stdio.h>
#include <stdlib.h>

int compare(const void *first, const void *second)
{
    const int a = *(int*)first;
    const int b = *(int*)second;
    return (a < b) ? -1 : (a > b);
}

int main(int argc, char **argv)
{
	int nums[4];
	int i = 0;
	int size = sizeof(nums) / sizeof(nums[i]);

	while (i < size) {
		char term;
		int result = 0;
		do {
			printf("Please enter integer %d: ", i);
			fseek(stdin,0,SEEK_END);
			result = scanf("%d", &nums[i], &term);
		} while(result != 2 || term != '\n');
		i++;
	}

	i = 0;
	printf("Unsorted Output\n");
	while (i < sizeof(nums) / sizeof(nums[i])) {
		printf("%d ", nums[i]);
		i++;
	}

	qsort(nums, size, sizeof(nums[0]), compare);

	i = 0;
	printf("\nSorted Output\n");
	while (i < sizeof(nums) / sizeof(nums[i])) {
		printf("%d ", nums[i]);
		i++;
	}
	printf("\n");
	
	return 0;
}