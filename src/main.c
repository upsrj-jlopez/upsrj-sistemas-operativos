/**
 * @file main.c
 * @brief Entry point for memory management simulations.
 *
 * This file provides the main function to run different
 * page replacement algorithms (FIFO, LRU). It can also be
 * compiled in unit testing mode by defining the macro UNIT_TEST,
 * in which case the main function is excluded.
 *
 * Usage:
 * - Normal execution: compile without UNIT_TEST defined.
 * - Unit testing: compile with -DUNIT_TEST to exclude main().
 */

#include <stdio.h>
#include <sysexits.h>
#include "memory/memory.h"
#include "fifo/fifo.h"
#include "lru/lru.h"

#ifndef UNIT_TEST
/**
 * @brief Main function to run page replacement algorithms.
 *
 * Initializes memory frames and executes FIFO and LRU
 * page replacement simulations. Results are printed
 * using functions from memory.c.
 *
 * @return EX_OK Standard exit code indicating successful execution.
 */
int main(void)
{
    /* Example reference string for simulation */
    int reference_string[MAX_REF] = {1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5};
    int ref_length = 12;

    /* Memory structures */
    int frames[MAX_FRAMES];
    int aux[MAX_FRAMES];       /* Auxiliary array for FIFO */
    int last_used[MAX_FRAMES]; /* Auxiliary array for LRU */
    int frame_count = 3;
    
    printf("=== Memory Management Simulation ===\n\n");

    /* ============================
     * FIFO Page Replacement
     * ============================ */
    printf("FIFO Page Replacement:\n");
    init_frames(frames, aux, frame_count);
    fifo_schedule(reference_string, ref_length, frames, frame_count);

    /* ============================
     * LRU Page Replacement
     * ============================ */
    printf("\nLRU Page Replacement:\n");
    init_frames(frames, last_used, frame_count);
    lru_schedule(reference_string, ref_length, frames, last_used, frame_count);
    
    return EX_OK;
}
#endif /* UNIT_TEST */