#include <stdio.h>
#include <stdlib.h>
int main(int argc, char* argv[]) //arg[0]=./dice
{
	int N = strtol(argv[1],NULL,10); //number of throws
	int D = strtol(argv[2],NULL,10); //number of dice

	int maxval = D*6; //max possible value of throwing D dice

	int *sumOfDice = malloc(N*sizeof(int)); //hold combos of die per roll, holds N numbers

	//array with length of maxval
	int *array = malloc(D*6*sizeof(int)); 
	
	int i; 
	for (i = 0; i < N; i++) //for each throw
	{
		int one_dice = 0; //a dice
		int j;
		for (j = 0; j < D; j++) //for each dice
		{
			one_dice += rand()%6 +1; //get random num for a dice
				//sum up the values of dice
		}

		sumOfDice[i] = one_dice; //holds sum of each throw 
	}

	for (i = 0; i < maxval; i++) //for every possible max value
	{
		int j;
		for (j = 0; j < N; j++) //for each number in sumOfDice, should have N numbers
		{
			if (sumOfDice[j] == (i+1)) //if that number is one of possible values
			{				//increment i because impossible to get sum of 0
				array[i] += 1; //count that number and increment
			}
		}
	}

	printf("Throwing %d dice %d times\n",D,N);
	printf("The probability of getting a combination of \n");
	for (i = 0; i < maxval; i++) //for every possible value
	{
		printf("%d is: %d/%d\n",i+1,array[i],maxval);
	}				//increment i, because no possible value of 0
}
