#include <stdio.h>

#define SIZE 8
#define TRUE 1
#define FALSE 0

double median(double *, int );

void main(void) {
	double array[] = {1,2,3,4,5,6,7,8};
	double result;

	result = median(array, SIZE);
	printf("Median: %lf\n", result);
}

double median(double *array, int nval)
{
	int houveTroca, i;
	double aux;
	do
	{
		houveTroca = FALSE;
		for( i = 0; i < nval-1; i++ )
		{
			if( array[i] > array[i+1] )
			{
				aux = array[i];
				array[i] = array[i+1];
				array[i+1] = aux;
				houveTroca = TRUE;
			}
		}
	} while( houveTroca == TRUE );
	return array[nval / 2];
}