#include <stdio.h>

double f2c(double );

void main(void) {
	double fahrenheit, celcius;

	while (true) {
		printf("Value (ºF): ");
		scanf("%lf", &fahrenheit);
		celcius = f2c(fahrenheit);
		printf("%lf ºC\n", celcius);
	}
}

double f2c(double ft) {
	return (5.0 / 9.0 * (ft - 32.0));
}