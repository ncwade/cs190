#include <stdio.h>

#define max(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a > _b ? _a : _b; })

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

int main(int argc, char **argv)
{
	int a, b;
	printf("Hello. Please enter your first integer: ");
	scanf("%d",&a);
	printf("Hello. Please enter your second integer: ");
	scanf("%d",&b);
	printf("Sum: %d\n", b + a);
	printf("Difference: %d\n", max(a,b) - min(a,b));
	printf("Product: %d\n", a * b);
	printf("Quotient: %d\n", max(a,b) / min(a,b));
	printf("Remainder: %d\n", max(a,b) % min(a,b));
	printf("Average: %f\n", (float)((a + b) / 2));
	return 0;
}