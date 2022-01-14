#include <stdio.h>

double sqrt(double );

void main(void) {
	double x, result;

	printf("Square root of X\n");
	while (1) {
		printf("X: ");
		scanf("%lf", &x);
		result = sqrt(x);
		printf("sqrt(%.2lf) = %lf\n", x, result);
	}
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