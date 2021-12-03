#include <stdio.h>

#define SIZE 10
#define TRUE 1
#define FALSE 0

void main(void) {
	static int lista[SIZE];
	int houveTroca, i, aux;

	// leitura de valores e preenchimento do array
	for (i=0; i <= SIZE-1; i++) {
		printf("Value[%d]: ", i);
		scanf("%d", &lista[i]);
	}

	// bubble-sort
	do {
		houveTroca = FALSE;
		for (i=0; i < SIZE-1; i++) {
			if (lista[i] > lista[i+1]) {
				aux = lista[i];
				lista[i] = lista[i+1];
				lista[i+1] = aux;
				houveTroca = TRUE;
			}
		}
	} while (houveTroca==TRUE);

	// impressão do conteúdo do array
	printf("Values from sorted array:\n");
	for (i=0; i <= SIZE-1; i++) {
		printf("%d; ", lista[i]);
	}
}