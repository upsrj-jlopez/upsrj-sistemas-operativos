/**
 * @file memory.h
 * @brief Interfaces for memory management simulation in operating systems.
 *
 * This module defines constants and functions to simulate memory usage
 * through page frames. It includes utilities to initialize frames,
 * check if a page is loaded, and print the current state of memory.
 *
 * Educational purpose:
 * - Understand how pages are managed in memory.
 * - Observe the behavior of page replacement algorithms.
 * - Practice with simple data structures to simulate memory.
 */

#ifndef MEMORY_H
#define MEMORY_H

#include <stdbool.h>

/** @def MAX_FRAMES
 *  @brief Maximum number of memory frames available.
 */
#define MAX_FRAMES 10

/** @def MAX_REF
 *  @brief Maximum number of page references in a simulation.
 */
#define MAX_REF    50

/** @def EMPTY_PAGE
 *  @brief Value indicating an empty frame (no page loaded).
 */
#define EMPTY_PAGE (-1)

/**
 * @brief Checks if a page is already loaded in memory frames.
 *
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 * @param page Page to search for.
 * @return true if the page is in memory, false otherwise.
 */
bool page_in_frames(const int frames[],
                    int frame_count,
                    int page);

/**
 * @brief Prints the current state of memory frames.
 *
 * Empty frames are displayed as '-'.
 *
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 */
void print_frames(const int frames[],
                  int frame_count);

/**
 * @brief Initializes frames and auxiliary array.
 *
 * The auxiliary array can be used for FIFO indices, timestamps,
 * counters, or other metadata depending on the replacement
 * algorithm being implemented.
 *
 * @param frames Array of memory frames.
 * @param aux Auxiliary array (e.g., for replacement metadata).
 * @param frame_count Number of frames available.
 */
void init_frames(int frames[],
                 int aux[],
                 int frame_count);

#endif /* MEMORY_H */