#ifndef FCFS_H
#define FCFS_H

#include "../../process/process.h"

/**
 * @brief Implements the First-Come, First-Served (FCFS) scheduling algorithm.
 *
 * FCFS schedules processes in the order of their arrival time.
 * Waiting time and turnaround time should be computed sequentially.
 *
 * @param p Array of Process structures.
 * @param n Number of processes.
 *
 * @note This function is intentionally left incomplete.
 *       Students must implement the FCFS scheduling logic here.
 */
void fcfs_schedule(Process p[], int n);

#endif /* FCFS_H */