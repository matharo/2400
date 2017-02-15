/*Write a program that sums up the first N places of this expression, 
 *where N is given as a command line input. Use strtol()
 *to convert the input to an integer as in the previous exercise.*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	//argc holds length of array argv, which holds strings

	double pi;

	//N is given number
	int N = strtol(argv[1],NULL,10); //converts input to int

	double partsum = 0.0;

	int i; //counts each partial sum
	for (i = 1; i <= N; i++)
	{
		double denom = (double)((i*2)-1);
		if (i % 2 != 0) //if odd
		{
			partsum += 1.0/denom; 
		}
		else//if even
		{
			partsum -= 1.0/denom;
		}
	}

	pi = 4.0 * partsum;

	printf("Pi with the partial sum of %d places is: %0.5f\n",N,pi);
		//print string format for double N
		//print a float with 5 places after decimal, pi

	return 0;
}
