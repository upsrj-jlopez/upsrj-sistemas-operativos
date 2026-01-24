#ifndef PROCESS_H
#define PROCESS_H

/**
 * @file process.h
 * @brief Unified definition of the Process structure and helper functions.
 *
 * This header defines the Process structure used in scheduling algorithms
 * (e.g., FCFS, SJF, RR) and provides helper functions for initialization,
 * input, and result printing.
 */

/**
 * @struct Process
 * @brief Represents a single process in scheduling simulations.
 *
 * Each process contains information about its arrival time, burst time,
 * waiting time, turnaround time, and completion status. This structure
 * is designed to support multiple scheduling algorithms such as
 * Shortest Job First (SJF) and Round Robin (RR).
 */
typedef struct {
    int id;               /**< Unique identifier of the process */
    int arrival_time;     /**< Arrival time of the process */
    int burst_time;       /**< Total burst time (execution time required) */
    int remaining_time;   /**< Remaining burst time (used in RR scheduling) */
    int waiting_time;     /**< Accumulated waiting time */
    int turnaround_time;  /**< Turnaround time (waiting + burst) */
    int completed;        /**< Flag indicating if the process has finished (used in SJF/RR) */
} Process;

/**
 * @brief Reads process data from input.
 *
 * @param p Array of Process structures to be filled.
 * @param n Number of processes to read.
 *
 * This function typically reads process attributes such as arrival time
 * and burst time from standard input or another source.
 */
void read_processes(Process p[], int n);

/**
 * @brief Initializes process attributes.
 *
 * @param p Array of Process structures to initialize.
 * @param n Number of processes to initialize.
 *
 * This function resets fields like waiting time, turnaround time,
 * remaining time, and completion flags to their default values.
 */
void init_processes(Process p[], int n);

/**
 * @brief Prints the results of scheduling simulation.
 *
 * @param p Array of Process structures containing results.
 * @param n Number of processes.
 * @param title Title to display before printing results.
 *
 * This function outputs the final statistics of each process,
 * including waiting time and turnaround time, along with a custom title.
 */
void print_results(Process p[], int n, const char *title);

/**
 * @brief Verify that all processes have completed successfully.
 *
 * @param p Array of Process structures.
 * @param n Number of processes.
 * @return EX_OK if all processes are completed,
 *         EX_SOFTWARE if any process failed.
 */
int verify_completion(Process p[], int n);

#endif /* PROCESS_H */