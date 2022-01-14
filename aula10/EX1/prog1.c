#include <stdio.h>

float xtoy(float, int );
int abs(int );

void main(void) {
	float x, result;
	int y;

	printf("X to the power of Y\n");
	while (1) {
		printf("X: ");
		scanf("%f", &x);
		printf("Y: ");
		scanf("%d", &y);
		result = xtoy(x, y);
		printf("%.2f^%d = %f\n", x, y, result);
	}
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