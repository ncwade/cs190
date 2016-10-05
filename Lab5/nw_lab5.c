#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <assert.h>


// Retrieve user input. No requirements for bad input handling, just fail.
void fetchInput(double *principal, double *annual_input, int *num_payments)
{
    printf("Enter the principal of the loan: ");
    int value = scanf("%lf", principal);
    if (value == EOF || value == 0) {
        assert(false);
    }

    printf("Enter the annual interest rate: ");
    value = scanf("%lf", annual_input);
    if (value == EOF || value == 0) {
        assert(false);
    }

    printf("Enter the total number of payments: ");
    value = scanf("%d", num_payments);
    if (value == EOF || value == 0) {
        assert(false);
    }
}

// Compute and return the payment.
double computePayment()
{
    double principal = 0;
    double rate = 0;
    int periods = 0;
    fetchInput(&principal, &rate, &periods);
    printf("%.2f, %.2f, %d\n", principal, rate, periods);
    rate = (rate / 100) / 12;
    return principal * (rate * pow((1 + rate), periods)) / ((pow((1 + rate),periods)) - 1);
}

// Call computePayment
int main(int argc, char **argv)
{
    printf("Monthly payment: $%.2f\n", computePayment());

    return 0;
}