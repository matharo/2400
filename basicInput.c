/*Write a program that takes a single argument, converts it to an integer with 
 * the strtol() function, and casts that value to an unsigned char. Then, 
 * print out both the signed and unsigned values. The output should look 
 * something like: Signed representation: -1, unsigned representation: 255*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	int input = strtol(argv[1],NULL,10); //argv[0] is call of class
	unsigned char output = input;

	printf("Signed representation: %d, unsigned representation %u\n",input,(unsigned)output);
	return 0;
}
