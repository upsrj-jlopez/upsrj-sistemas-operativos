/**
 * @file memory.c
 * @brief Implementation of memory management simulation functions.
 *
 * Provides basic utilities for simulating memory frames:
 * - Checking if a page is already loaded.
 * - Printing the current state of frames.
 * - Initializing frames and auxiliary arrays.
 *
 * These functions serve as building blocks for page replacement
 * algorithms such as FIFO, LRU, or Optimal.
 */

#include "memory.h"
#include <stdio.h>

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
                    int page)
{
    for (int i = 0; i < frame_count; i++)
    {
        if (frames[i] != EMPTY_PAGE)
        {
            if (frames[i] == page)
            {
                return true;
            }
        }
    }
    return false;
}

/**
 * @brief Prints the current state of memory frames.
 *
 * Empty frames are displayed as '-'.
 *
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 */
void print_frames(const int frames[],
                  int frame_count)
{
    printf("[ ");
    for (int i = 0; i < frame_count; i++)
    {
        if (frames[i] == EMPTY_PAGE)
        {
            printf("- ");
        }
        else
        {
            printf("%d ", frames[i]);
        }
    }
    printf("]\n");
}

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
                 int frame_count)
{
    for (int i = 0; i < frame_count; i++)
    {
        frames[i] = EMPTY_PAGE;
        aux[i]    = -1;
    }
}