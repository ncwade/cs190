#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int month_to_days[12] = {31 ,29, 31 ,30 ,31 ,30 ,31 ,31 ,30 ,31 ,30 ,31};

int days_so_far(int current_month, int year)
{
	int month = 0;
	int return_val = 0;
	for (month = 0; month < current_month; ++month) {
		// Handle leap year.
		if (month != 1) {
			return_val += month_to_days[month];
		} else {
			// If leap year.
			if (year % 4 == 0) {
				if(year % 100 == 0) {
					if(year % 400 == 0) {
						return_val += month_to_days[month];
						continue;
					}
				} else {
					return_val += month_to_days[month];
					continue;
				}
			} 
			return_val += month_to_days[month] - 1;
		}
		
	}
	return return_val;
}

void exercise_one()
{
	int month, year, day;
	int numbered_day = 0;

	printf("Please enter a year: ");
	scanf("%d", &year);
	printf("Please enter a month: ");
	scanf("%d", &month);
	printf("Please enter a day: ");
	scanf("%d", &day);
	assert( day <=  month_to_days[month - 1]);

	numbered_day = day + days_so_far(month - 1, year);

	printf("The %dth of the year %d\n", numbered_day, year);
}

int main(int argc, char **argv)
{
	exercise_one();
	return 0;
}