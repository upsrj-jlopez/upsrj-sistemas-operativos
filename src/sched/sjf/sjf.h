#ifndef SJF_H
#define SJF_H

#include "../../process/process.h"

/**
 * @brief Implements the Shortest Job First (SJF) scheduling algorithm.
 *
 * SJF schedules processes based on the shortest burst time first.
 * Waiting time and turnaround time should be computed according to
 * the order of execution. Both non-preemptive and preemptive variants
 * exist; students must decide which version to implement.
 *
 * @param p Array of Process structures.
 * @param n Number of processes.
 *
 * @note This function is intentionally left incomplete.
 *       Students must implement the SJF scheduling logic here.
 */
void sjf_schedule(Process p[], int n);

#endif /* SJF_H */