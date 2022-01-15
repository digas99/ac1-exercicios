#include <stdio.h>

#define SIZE 10

double var(double* ,int );
double stdev(double* , int );
float xtoy(float, int );
int abs(int );
double sqrt(double );
double average(double* , int );

int main(void) {
	static double a[SIZE];
	double var_r, stdev_r;
	int i;
	for(i = 0; i < SIZE; i++)
		scanf("%lf", a+i);
	
	var_r = var(a, SIZE);
	stdev_r = stdev(a, SIZE);
	printf("var: %.2lf\nstdev: %.2lf\n", var_r, stdev_r);
	return 0;
}

double var(double *array, int nval) {
	int i;
	float media, soma;
	media = (float)average(array, nval);
	for(i=0, soma=0.0; i < nval; i++)
		soma += xtoy((float)array[i] - media, 2);
	return (double)soma / nval;
}

double stdev(double *array, int nval) {
	return sqrt( var(array, nval) );
}

float xtoy(float x, int y) {
	int i;
	float result;
	for(i=0, result=1.0; i < abs(y); i++) {
		if(y > 0)
			result *= x;
		else
			result /= x;
	}
	return result;
}

int abs(int val) {
	if(val < 0)
		val = -val;
	return val;
}

double sqrt(double val) {
	double aux, xn = 1.0;
	int i = 0;
	if(val > 0.0) {
		do {
			aux = xn;
			xn = 0.5 * (xn + val/xn);
		} while((aux != xn) && (++i < 25));
	} else
		xn = 0.0;
	return xn;
}

double average(double *array, int n) {
	int i = n;
	double sum = 0.0;
	for(; i > 0; i--) {
		sum += array[i-1];
	}
	return sum / (double)n;
}