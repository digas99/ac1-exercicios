#include <stdio.h>

#define SIZE 10

void main(void) {
	static int lista[SIZE];
	int i, j, aux;
	
	// leitura de valores e preenchimento do array
	for (i=0; i < SIZE; i++) {
		printf("Value: ");
		scanf("%d", &(lista[i]));
	}

	// sequential-sort
	for (i=0; i < SIZE-1; i++) {
		for (j = i+1; j < SIZE; j++) {
			if (lista[i] > lista[j]) {	
				aux = lista[i];
				lista[i] = lista[j];
				lista[j] = aux;
			}
		}
	}

	// impressão do conteúdo do array
	printf("Values from sorted array: ");
	for (i=0; i < SIZE; i++) {
		printf("%d ", lista[i]);
	}
}