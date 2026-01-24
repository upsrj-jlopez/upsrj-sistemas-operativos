/**
 * @file lru.c
 * @brief Implementation of LRU page replacement algorithm.
 *
 * The LRU (Least Recently Used) algorithm replaces the page
 * that has not been used for the longest time when a new page
 * must be loaded and no empty frame is available.
 */

#include "lru.h"

/**
 * @brief Internal helper function to perform LRU replacement.
 *
 * @param frames Array of memory frames.
 * @param last_used Array storing the last usage time of each frame.
 * @param frame_count Number of frames available.
 * @param page Page to insert.
 * @param current_time Current simulation time (used to update usage).
 *
 * @todo Students must implement the LRU replacement logic:
 *       - Find the frame with the smallest last_used value.
 *       - Replace that frame with the new page.
 *       - Update last_used for the replaced frame with current_time.
 */
static void lru_replace(int frames[],
                        int last_used[],
                        int frame_count,
                        int page,
                        int current_time)
{
    /* TODO: Implement LRU replacement logic */
    (void)frames;
    (void)last_used;
    (void)frame_count;
    (void)page;
    (void)current_time;
}

/**
 * @brief Simulates LRU page replacement for a sequence of references.
 *
 * @param refs Array of page references.
 * @param ref_count Number of page references.
 * @param frames Array of memory frames.
 * @param last_used Array storing the last usage time of each frame.
 * @param frame_count Number of frames available.
 *
 * @todo Students must complete the logic:
 *       - Iterate through refs.
 *       - If page not in frames:
 *         * Place in empty frame if available.
 *         * Otherwise call lru_replace().
 *       - Update last_used for the accessed frame with current_time.
 *       - Do not print here; printing is handled in memory.c.
 */
void lru_schedule(const int refs[],
                  int ref_count,
                  int frames[],
                  int last_used[],
                  int frame_count)
{
    int time = 0;

    // Centralized printing
    print_frames(frames, frame_count);
    
    for (int i = 0; i < ref_count; i++)
    {
        int page = refs[i];

        /* TODO: Implement LRU scheduling logic */
        (void)page;
        (void)frames;
        (void)last_used;
        (void)frame_count;
        (void)time;

        // Dummy call to avoid unused-function warning
        // NOTE: remove this line once lru_replace is implemented
        lru_replace(frames, last_used, frame_count, page, time);

        // Centralized printing
        print_frames(frames, frame_count);

        time++;
    }
}