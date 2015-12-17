/*C programming source code to add and display the sum of two integers entered by user */

#include <stdio.h>
int main( )
{
    int num1, num2, sum;
    printf("Enter two integers: ");
    scanf("%d %d",&num1,&num2); /* Stores the two integer entered by user in variable num1 and num2 */

    sum=num1+num2;      /* Performs addition and stores it in variable sum */
    printf("Sum: %d",sum);  /* Displays sum */
    return 0;
}