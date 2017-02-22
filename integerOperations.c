#include <stdio.h>
#include <stdlib.h>

int main()
{
	int a;
	int b;
	int c = 0;
	printf("Enter a: ");
	scanf("%d",&a); //receives int, set input to a
	printf("Enter b: ");
	scanf("%d",&b); //receives int, set input to b

	while (b >= a)
	{
		b -= a;
		c += 1;
	}

	printf("Value of c is %d and the value of b is %d\n",c,b);
}
