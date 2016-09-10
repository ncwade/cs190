#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int i,j,k,n;
	printf("water flower number (100<=n<1000) are :\n");
	for (n = 100; n < 1000; ++n)
	{
		i = n % 10;
		j = (n / 10) % 10;
		k = ((n / 10) / 10) % 10;
		
		if ((i * i * i) + (j * j * j) + (k * k * k) == n)
		{
			printf("%d ", n);
		}
	}
	printf("\n");
	return 0;
}