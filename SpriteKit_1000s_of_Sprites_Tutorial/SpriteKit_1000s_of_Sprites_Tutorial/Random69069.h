#pragma once

typedef struct Random69069 {
	int seed;
} Random69069;

#define Random69069Max 0x7fff


static inline void Random69069Init(Random69069* random, int seed) {
	random->seed = seed;
}

static inline int Random69069Integer(Random69069* random) {
	int seed = random->seed * 69069 + 1;
	random->seed = seed;
	return seed & Random69069Max;
}

static inline float Random69069Float(Random69069* random) {
	return Random69069Integer(random) / (float)(Random69069Max + 1);
}
