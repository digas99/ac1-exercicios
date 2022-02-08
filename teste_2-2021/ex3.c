// Mapa de registos
// pts:
// maxIndex:
// i:
// j:
// sum:
// acc:

// typedef struct 
// {						Align	Dim		Offset
// 		char id;
//		int sum;
//		char sample[29];
//		unsigned char ns;
//		float average;
// } pressure

float reCalc(pressure *pts, int maxIndex) {
	int i, j, sum = 0;
	float acc = 0.0;
	for (i = 0; i < maxIndex; i++, pts++) {
		for (j = 0; j < pts->ns; j++) {
			sum += pts->sample[j];
		}
		pts->sum = sum;
		pts->average = (float)sum / (float)pts->ns;
		acc += pts->average;
	}
	return (acc / (float)maxIndex);
}