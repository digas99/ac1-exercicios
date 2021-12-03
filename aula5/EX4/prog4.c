#include <stdio.h>

#define SIZE 10
#define TRUE 1
#define FALSE 0

void main(void) {
	static int lista[SIZE];
	int houveTroca, aux;
	int *p, *pLast;

	pLast = lista + (SIZE - 1);
	
	// leitura de valores e preenchimento do array
	for (p=lista; p <= pLast; p++) {
		printf("Value: ");
		scanf("%d", p);
	}

	// bubble-sort
	do {
		houveTroca = FALSE;
		for (p=lista; p < pLast; p++) {
			if (*p > *(p+1)) {
				aux = *p;
				*p = *(p+1);
				*(p+1) = aux;
				houveTroca = TRUE;
			}
		}
	} while (houveTroca==TRUE);

	// impressão do conteúdo do array
	printf("Values from sorted array: ");
	for (p=lista; p <= pLast; p++) {
		printf("%d ", *p);
	}
}