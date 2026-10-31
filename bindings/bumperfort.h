#ifndef BUMPERFORT_H
#define BUMPERFORT_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

float bumper_cosine(const float *a, const float *b, size_t n);
void bumper_batch_cosine(const float *query, const float *docs, size_t dim, size_t n_docs, float *scores);
void bumper_version(int *major, int *minor, int *patch);

#ifdef __cplusplus
}
#endif

#endif
