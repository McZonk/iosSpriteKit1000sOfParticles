#pragma once

// taken from the Doom 3 sources

typedef struct idRandom2 {
	int seed;
} idRandom2;

#define idRandom2Max 0x7fff

static const unsigned long	IEEE_ONE = 0x3f800000;
static const unsigned long	IEEE_MASK = 0x007fffff;

static inline void idRandom2Init(idRandom2* random, int seed) {
	random->seed = seed;
}

static inline int idRandom2Integer(idRandom2* random) {
	int seed = random->seed;
	seed = 1664525L * seed + 1013904223L;
	random->seed = seed;
	return seed & idRandom2Max;
}

static inline float idRandom2Float(idRandom2* random) {
	int seed = random->seed;
	seed = 1664525L * seed + 1013904223L;
	random->seed = seed;
	unsigned int i = IEEE_ONE | (seed & IEEE_MASK);
	return (*(float *)&i) - 1.0f;
}
