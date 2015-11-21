/** C program to generate Fibonacci Series. Fibonacci Series* is 0 1 1 2 3 5 8 13 21 ...*/
#include <stdio.h>
void main(){
int  fib1 = 0, fib2 = 1, fib3, limit, count = 0;
printf("Enter the limit to generate the Fibonacci Series n");
scanf("%d", &limit);
printf("Fibonacci Series is ...n");
printf("%dn", fib1);
printf("%dn", fib2);
count = 2;
while (count < limit)
{

fib3 = fib1 + fib2;

count++;

printf("%dn", fib3);

fib1 = fib2;

fib2 = fib3;
}}

