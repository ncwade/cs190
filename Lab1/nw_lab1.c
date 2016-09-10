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
		printf("Please enter integer %d: ", i+1);
		scanf("%d", &nums[i]);
		i++;
	}

	i = 0;
	printf("Unsorted Output\n");
	while (i < sizeof(nums) / sizeof(nums[i])) {
		printf("%d ", nums[i]);
		i++;
	}

	qsort(nums, size, sizeof(nums[0]), compare);

	i = sizeof(nums) / sizeof(nums[i]) - 1;
	printf("\nSorted Output\n");
	while (i >= 0) {
		printf("%d ", nums[i]);
		i--;
	}
	printf("\n");
	
	return 0;
}