#include <stdio.h>

int main(int argc, char* argv[]) 
//arg[0]=./dice
{
	int N = strtol(arg[1],NULL,10); //number of throws
	int D = strtol(arg[2],NULL,10); //number of dice

	int prob = D*6; //max possible value of throwing D dice

	int sumOfDice[N]; //hold sums of dice per roll

	//array with length of throwing D dice = D*6
	int *array = malloc(D*6*sizeof(int)); 
	
	int i; //argument number
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

	for (i = 1; i <= prob; i++) //for every possible value
	{
		int j;
		for (j = 0; j < N; j++) //for each number in sumOfDice;
		{
			if (sumOfDice[j] == i) //if that number is one of possible values
			{
				array[i] += 1; //count that number
			}
		}
	}


	printf("Throwing %d dice %d times\n",
	for (i = 1; i <= prob; i++)
	{
		printf(

	
