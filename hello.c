/*C Programming Exercise 1*/

#include <stdio.h>

int main(int argc, char* argv[])
{
	printf("Hello, World!\n");

	int i;
	for (i = 0; i < argc; i++)
	{
		printf("Argument %d is %s\n",i,argv[i]);
		//%d = an interger will be here
		//%s = a String will be here, input = String
		//\n = endline
	}

	return 0;
}
