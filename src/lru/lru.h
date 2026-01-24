/**
 * @file lru.h
 * @brief Interface for LRU page replacement algorithm.
 *
 * This module provides the function prototypes for simulating
 * the LRU (Least Recently Used) page replacement algorithm.
 */

#ifndef LRU_H
#define LRU_H

#include "../memory/memory.h"

/**
 * @brief Executes the LRU page replacement algorithm.
 *
 * Given a sequence of page references, this function simulates
 * the LRU replacement strategy using the provided memory frames.
 *
 * @param refs Array of page references.
 * @param ref_count Number of page references.
 * @param frames Array of memory frames.
 * @param last_used Array storing the last usage time of each frame.
 * @param frame_count Number of frames available.
 */
void lru_schedule(const int refs[],
                  int ref_count,
                  int frames[],
                  int last_used[],
                  int frame_count);

#endif /* LRU_H */