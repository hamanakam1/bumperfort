#ifndef BUMPERFORT_SHM_H
#define BUMPERFORT_SHM_H
#include <stdint.h>
typedef struct { uint64_t seq; uint32_t dirty; double coord[3]; } shm_ticket_t;
#endif
