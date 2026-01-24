#include "../../process/process.h"

/**
 * @brief Implements the Round Robin (RR) scheduling algorithm.
 *
 * Round Robin scheduling executes processes in a cyclic order,
 * allocating each process a fixed time slice (quantum).
 * If a process is not finished within its quantum, it is placed
 * back in the ready queue until completion.
 *
 * @param p Array of Process structures.
 * @param n Number of processes.
 * @param quantum Time slice allocated to each process.
 *
 * @note This function is intentionally left incomplete.
 *       Students must implement the Round Robin scheduling logic here.
 */
void rr_schedule(Process p[], int n, int quantum)
{
    (void)p;      /**< Suppress unused parameter warning */
    (void)n;      /**< Suppress unused parameter warning */
    (void)quantum;/**< Suppress unused parameter warning */

    /* ============================================================
     * TODO: Implement Round Robin scheduling algorithm here
     * - Use a queue to cycle through processes
     * - Deduct quantum from remaining_time
     * - Update waiting_time and turnaround_time
     * - Mark process as completed when remaining_time == 0
     * ============================================================ */
}