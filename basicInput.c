#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	int input = strtol(argv[1],NULL,10); //argv[0] is call of class
	unsigned char output = input;

	printf("Signed representation: %d, unsigned representation %u\n",input,(unsigned)output);
	return 0;
}
