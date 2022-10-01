/* 18001149_quickf_omp.c -Quicksort Algorithm Code code using OpenMP Code */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<omp.h> 
#define MAX 3000

int partition (int arr[], int low, int high)
{
    int i,j,pivot = arr[low],temp; 
    i = high + 1; 
 
    for (j = high; j > 0; j--)
    {
        if (arr[j] > pivot)
        {
            i--;    
	    temp = arr[i];
	    arr[i] = arr[j];
	    arr[j] = temp;
        }
    }
    temp = arr[low];
    arr[low] = arr[i-1];
    arr[i-1] = temp;
    return (i-1);
}
void quickSort(int arr[], int low, int high)
{
    if (low < high)
    {
        /* pi is partitioning index, arr[p] is now
           at right place */
        int pi = partition(arr, low, high);
 
        // Separately sort elements before
        // partition and after partition
	#pragma omp parallel sections num_threads(2)
	{
		#pragma omp section 
        	quickSort(arr, low, pi - 1);
		#pragma omp section
        	quickSort(arr, pi + 1, high);
	}
    }
}
/* Function to print an array */
void printArray(int arr[], int size)
{
    int i;
    for (i=0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

// Driver program to test above functions
int main()
{
    int arr[MAX],i;
    srand(time(NULL));
    printf("UnSorted Array :-");
    for(i=0;i<MAX;i++){
     arr[i] = rand() % MAX;
     /*printf("%d ",arr[i]);*/
    }
    printf("\n");
    clock_t t1,t2;
    t1 = clock();
    quickSort(arr, 0, MAX-1);
    t2 = clock();
    double t_time = (double)(t2-t1)/CLOCKS_PER_SEC;
    
    printf("Sorted array: n");
    /*printArray(arr, MAX);*/
    printf("\t\tTime Elapsed: %.5f\n",t_time);
    return 0;
}


