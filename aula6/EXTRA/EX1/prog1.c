#include <stdio.h>

void main(int argc, char *argv[]) {
	int i, max=0;
	char *longest;
	for (i=1; i<argc; i++) {
		int c, n_chars=0, n_uppc=0, n_lowc=0;
		printf("Arg #%d:\n", i);

		while((c=argv[i][n_chars]) != '\0') {
			if (c >= 0x41 && c <= 0x5A)
				n_uppc++;
			
			else if (c >= 0x61 && c <= 0x7A)
				n_lowc++;

			n_chars++;
		}

		printf("Chars: ");
		printf("%7d\n", n_chars);
		printf("Upper Case: ");
		printf("%2d\n", n_uppc);
		printf("Lower Case: ");
		printf("%2d\n", n_lowc);

		if (max < n_chars) {
			max = n_chars;
			longest = argv[i];
		}
	}
	if (argc > 1)
		printf("\nLongest Arg: %s\n", longest);
	else
		printf("Main has no arguments.\n");
}