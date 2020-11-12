#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

//Complie using -lm extension as math.h is used
int insertionSort(int* array, int N)
{
   int comp=0;
   for (int i = 1; i < N; ++i)
   {
		int temp = array[i];
		int j = i - 1;
		if(j>=0)
	    comp++;
	    int r=0;
		while (j >=0 && array[j] > temp)
		{
			array[j+1] = array[j];
			j--;
			r++;
		}
		if(r>0&&j<0)
		comp=comp+r-1;
		if((r>0&&array[j]<temp)&&j>=0)
		comp=comp+r;
        array[j+1] = temp;
	}
	return comp;
}
void printArray(int* array, int N){
	for (int i = 0 ; i < N; ++i)
		printf ("%d ", array[i]);
	
}

void swap(int* array, int i, int j) {
	int temp = array[i];
	array[i] = array[j];
	array[j] = temp;
}
void shuffle(int* array, int N)
{
	for (int i = N - 1; i >= 1; i--)
	{
		int j = rand() % (i + 1);
        swap(array, i, j);
	}
}

int main()
{
	
	int a;
	int r;
	int N_E;
	printf("Enter the number of elements:");
	scanf("%d",&N_E);
	if(N_E<0||N_E>10)
	{
		printf("Exceeded the range of elements allowed\n");
		exit(1);
	}	
	printf("Enter the scale factor:");
	scanf("%d",&a);
	if(a<0||a>5)
	{
		printf("Exceeded the range allowed\n");
		exit(1);
	}	
	printf("Enter the common ratio:");
	scanf("%d",&r);
	if(r<0||r>5)
	{
		printf("Exceeded the range allowed\n");
		exit(1);
	}
	int array1[N_E];
	int array2[N_E];
	
	
	int i;
	
	for(i=0;i<N_E;i++)
	{
		array1[i]=a*pow(r,i);
		array2[N_E-i-1]=a*pow(r,i);
	}	
	int comp;
	
	printf("Ascending:");
	printArray(array1,N_E);
	comp=insertionSort(array1,N_E);
	
	printf(", Comparisions:  %d",comp);
	printf("\n");
	printf("Descending:");
	printArray(array2,N_E);
	comp=insertionSort(array2,N_E);
	printf(", Comparisions: %d",comp);
	printf("\n");
	srand(time(NULL));
	shuffle(array1,N_E);
	printf("Random:");
	printArray(array1,N_E);
	comp=insertionSort(array1,N_E);
	
	printf(", Comparisions: %d",comp);
	printf("\n");
	
	return 0;
}	
