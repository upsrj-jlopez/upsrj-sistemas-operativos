#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <time.h>
#include "process.h"

/**
 * @brief Reads process data and assigns random arrival and burst times.
 *
 * This function initializes the process array with random values for
 * arrival time (0–9) and burst time (1–10). Each process is also
 * assigned a unique identifier.
 *
 * @param p Array of Process structures to be filled.
 * @param n Number of processes to generate.
 */
void read_processes(Process p[], int n) {
    srand(time(NULL)); /**< Seed for random number generation */
    for (int i = 0; i < n; i++) {
        p[i].id = i + 1;
        p[i].arrival_time = rand() % 10;       /**< Random arrival time between 0 and 9 */
        p[i].burst_time = (rand() % 10) + 1;   /**< Random burst time between 1 and 10 */
    }
}

/**
 * @brief Initializes common fields of processes before scheduling.
 *
 * This function resets the remaining time, waiting time, turnaround time,
 * and completion flag for each process. It prepares the process array
 * for use in scheduling algorithms.
 *
 * @param p Array of Process structures to initialize.
 * @param n Number of processes.
 */
void init_processes(Process p[], int n) {
    for (int i = 0; i < n; i++) {
        p[i].remaining_time = p[i].burst_time;
        p[i].waiting_time = 0;
        p[i].turnaround_time = 0;
        p[i].completed = 0;
    }
}

/**
 * @brief Prints the results of scheduling in a tabular format.
 *
 * This function outputs the process statistics including ID, arrival time,
 * burst time, waiting time, and turnaround time. A custom title is printed
 * before the table for clarity.
 *
 * @param p Array of Process structures containing results.
 * @param n Number of processes.
 * @param title Title to display before printing results.
 */
void print_results(Process p[], int n, const char *title) {
    printf("\n%s\n", title);
    printf("ID\tAT\tBT\tWT\tTAT\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t%d\n",
               p[i].id,
               p[i].arrival_time,
               p[i].burst_time,
               p[i].waiting_time,
               p[i].turnaround_time);
    }
}

/**
 * @brief Verify that all processes have completed successfully.
 *
 * @param p Array of Process structures.
 * @param n Number of processes.
 * @return int Returns EX_OK if all processes are completed,
 *             otherwise EX_SOFTWARE to indicate an error.
 */
int verify_completion(Process p[], int n) {
    for (int i = 0; i < n; i++) {
        if (!p[i].completed) {
            fprintf(stderr, "Error: Process %d did not complete.\n", p[i].id);
            return EX_SOFTWARE;  // standardized error code
        }
    }
    return EX_OK;
}