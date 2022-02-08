// Mapa de registos
// argc:
// argv:
// fArr:
// i:
// p:

#define SIZE 10

int atoi(char *, int);
float mean(float *, int);
int main(int argc, char *argv[]) {
	static float fArr[SIZE];
	int i;
	float *p;

	if (argc < 1)
		return -1;
	
	for (i=0, p = fArr, (i < argc) && ( i < SIZE ); i++, p++) {
		*p = (float)atoi(argv[i], 10);
	}
	print_float(mean(fArr, argc));
	return 0;
}