/** C program to Convert Decimal to Hexadecimal*/
#include <stdio.h>
int main(){
long decimalnum, remainder, quotient;
int i = 1, j, temp;
char hexadecimalnum[100];
printf("Enter decimal number: ");
scanf("%ld", &decimalnum);
quotient = decimalnum;
while (quotient != 0)
{

temp = quotient % 16;

// To convert integer into character

if (temp  0; j--)


printf("%c", hexadecimalnum[j]);
return 0;}

