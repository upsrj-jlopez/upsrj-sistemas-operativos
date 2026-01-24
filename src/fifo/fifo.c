/**
 * @file fifo.c
 * @brief Implementation of FIFO page replacement algorithm.
 *
 * The FIFO (First-In, First-Out) algorithm replaces the oldest
 * page in memory when a new page must be loaded and no empty
 * frame is available.
 */

#include "fifo.h"
#include <stdio.h>

/**
 * @brief Internal helper function to perform FIFO replacement.
 *
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 * @param page Page to insert.
 * @param fifo_index Pointer to the current FIFO index.
 *
 * @todo Students must implement the FIFO replacement logic:
 *       - Replace the frame at position *fifo_index with the new page.
 *       - Update fifo_index in circular fashion.
 */
static void fifo_replace(int frames[],
                         int frame_count,
                         int page,
                         int *fifo_index)
{
    /* TODO: Implement FIFO replacement logic */
    (void)frames;
    (void)frame_count;
    (void)page;
    (void)fifo_index;
}

/**
 * @brief Simulates FIFO page replacement for a sequence of references.
 *
 * @param refs Array of page references.
 * @param ref_count Number of page references.
 * @param frames Array of memory frames.
 * @param frame_count Number of frames available.
 *
 * @todo Students must complete the logic:
 *       - Iterate through refs.
 *       - If page not in frames:
 *         * Place in empty frame if available.
 *         * Otherwise call fifo_replace().
 *       - Print current state of frames after each reference.
 */
void fifo_schedule(const int refs[],
                   int ref_count,
                   int frames[],
                   int frame_count)
{
    int fifo_index = 0;

    // Centralized printing
    print_frames(frames, frame_count);
    
    for (int i = 0; i < ref_count; i++)
    {
        int page = refs[i];

        /* TODO: Implement FIFO scheduling logic */
        (void)page;
        (void)frames;
        (void)frame_count;
        (void)fifo_index;

        // Dummy call to avoid unused-function warning
        // NOTE: remove this line once fifo_replace is implemented
        fifo_replace(frames, frame_count, page, &fifo_index);

        // Centralized printing
        print_frames(frames, frame_count);
    }
}