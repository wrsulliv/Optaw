/** C Program to Find the Sum of H.P Series*/
#include <stdio.h>
void main(){
int n;
float i, sum, term;
printf("1 + 1 / 2 + 1 / 3 +......+1 / n n");
printf("Enter the value of n n");
scanf("%d", &n);
sum = 0;
for (i = 1; i <= n; i++)
{

term = 1 / i;

sum = sum + term;
}
printf("the Sum of H.P Series is = %f", sum);}

