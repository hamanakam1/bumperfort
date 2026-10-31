#ifndef BUMPERFORT_MESH_H
#define BUMPERFORT_MESH_H
#include <stdint.h>
typedef struct {
    uint64_t seq;
    uint32_t dirty;
    double coord[3];
} mesh_ticket_t;
#endif
