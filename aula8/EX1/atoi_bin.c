#include <stdio.h>

int atoi_bin(char *);
char *strrev(char *);
void exchange(char *, char *);
int pow(int , int );

int main(void) {
	static char binary[] = "101101";
	printf("%d\n", atoi_bin(binary));
	return 0;
}

int atoi_bin(char *s) {
	int count = 0, res = 0;
	s = strrev(s);
	while (*s == '0' || *s == '1') {
		if (*s++ == '1') 
			res += pow(2, count);
		count++;
	}
	return res;
}

char *strrev(char *s) {
	char *p1 = s;
	char *p2 = s;

	while(*p2++ != '\0');
	p2-=2;

	while (p1 < p2) {
		exchange(p1, p2);
		p1++;
		p2--;
	}

	return s;
}

void exchange(char *c1, char *c2) {
	char aux = *c1;
	*c1 = *c2;
	*c2 = aux;
}

int pow(int n, int e) {
	int i, res = 1;
	for (i=0; i<e; i++)
		res *= n;
	return res;
}