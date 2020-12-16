#include <stdio.h>

int main(int argc, char *argv[]) {
	int i, curr_arg_len, largest_arg_len, uppercase_counter, lowercase_counter;
	char *curr_arg;
	char *largest_arg = "";
	char curr_char;
	printf("Argumentos de entrada do programa:\n\n");
	for (i=0; i < argc; i++) {
		curr_arg = argv[i];
		curr_arg_len = 0;
		uppercase_counter = 0;
		lowercase_counter = 0;
		while (curr_arg[curr_arg_len] != 0) {
			curr_char = curr_arg[curr_arg_len];
			// é uppercase
			if (curr_char >= 65 && curr_char <= 90)
				uppercase_counter++;
			// é lowercase
			else if (curr_char >= 97 && curr_char <= 122)
				lowercase_counter++;
			curr_arg_len++;
		}
		printf("\tArgumento #%d: %s\n", i, curr_arg);
		printf("\tNr. caracteres: %d\n", curr_arg_len);
		printf("\tNr. letras M, m: %d, %d\n\n", uppercase_counter, lowercase_counter);
		largest_arg_len = 0;
		// size of string
		while (largest_arg[largest_arg_len] != 0) largest_arg_len++;
		if (curr_arg_len > largest_arg_len)
			largest_arg = curr_arg;
	}
	printf("Argumento com o maior nr. caracteres: %s\n", largest_arg);
}