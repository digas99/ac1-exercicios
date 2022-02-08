// Mapa de registos
// x:
// tol:
// fact:
// i:
// tmp:
// sum:

float pow(float ,int );

float func2(float x, float tol) {
	unsigned int fact = 1, i = 1;
	float tmp, sum = 0.0;
	do {
		fact = fact * i;
		tmp = pow(x, i) / (float)fact;
		sum = sum + tmp;
		i++
	} while (tmp > tol);
	return (sum + 1.0);
}