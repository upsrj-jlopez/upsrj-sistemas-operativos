/**
 * @file fifo.h
 * @brief Interface for FIFO page replacement algorithm.
 *
 * This module provides the function prototypes for simulating
 * the FIFO (First-In, First-Out) page replacement algorithm.
 */

#ifndef FIFO_H
#define FIFO_H

#include "../memory/memory.h"

/**
 * @brief Executes the FIFO page replacement algorithm.
 *
 * Given a sequence of page references, this function simulates
 * the FIFO replacement strategy using the provided memory frames.
 *
 * @param refs Array of page references.
 * @param ref_count Number of page references.
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 */
void fifo_schedule(const int refs[],
                   int ref_count,
                   int frames[],
                   int frame_count);

#endif /* FIFO_H */