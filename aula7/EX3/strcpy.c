#include <stdio.h>
#define STR_MAX_SIZE 30

char *strcpy(char *dst, char *src);

int main(void) {
	static char str[] = "String to copy";
	static char cpy[STR_MAX_SIZE + 1];
	
	strcpy(cpy, str);
	printf("%s\n", cpy);	
}

char *strcpy(char *dst, char *src) {
	char *p = dst;
	do {
		*p++ = *src;
	} while(*src++ != '\0');
	return dst;
}