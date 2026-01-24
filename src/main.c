/**
 * @file main.c
 * @brief Entry point for process scheduling simulations.
 *
 * This file provides the main function to run different scheduling algorithms
 * (FCFS, SJF, RR). It can also be compiled in unit testing mode by defining
 * the macro UNIT_TEST, in which case the main function is excluded.
 *
 * Usage:
 * - Normal execution: compile without UNIT_TEST defined.
 * - Unit testing: compile with -DUNIT_TEST to exclude main().
 */

#include <stdio.h>
#include <sysexits.h>
#include "process/process.h"
#include "sched/fcfs/fcfs.h"
#include "sched/sjf/sjf.h"
#include "sched/rr/rr.h"

#ifndef UNIT_TEST
/**
 * @brief Main function to run scheduling algorithms.
 *
 * Reads process data, initializes structures, and executes FCFS, SJF,
 * and Round Robin scheduling algorithms. Results are printed in tabular
 * format for comparison.
 *
 * @return EX_OK Standard exit code indicating successful execution.
 */
int main(void)
{
    int n, quantum;

    printf("Number of processes: ");
    fflush(stdout);
    if (scanf("%d", &n) != 1) {
        fprintf(stderr, "Error: invalid input for number of processes.\n");
        return EX_DATAERR;  // código estándar de error de entrada
    }

    printf("Quantum for Round Robin: ");
    fflush(stdout);
    if (scanf("%d", &quantum) != 1) {
        fprintf(stderr, "Error: invalid input for quantum.\n");
        return EX_DATAERR;
    }

    // Original process list
    Process p[n];
    read_processes(p, n);

    // ============================
    // FCFS Scheduling
    // ============================
    Process fcfs_p[n];
    for (int i = 0; i < n; i++) fcfs_p[i] = p[i];
    init_processes(fcfs_p, n);

    fcfs_schedule(fcfs_p, n);
    print_results(fcfs_p, n, "FCFS Scheduling");

    if (verify_completion(fcfs_p, n) != EX_OK) 
        return EX_SOFTWARE;


    // ============================
    // SJF Scheduling
    // ============================
    Process sjf_p[n];
    for (int i = 0; i < n; i++) sjf_p[i] = p[i];
    init_processes(sjf_p, n);

    sjf_schedule(sjf_p, n);
    print_results(sjf_p, n, "SJF Scheduling");

    if (verify_completion(sjf_p, n) != EX_OK) 
        return EX_SOFTWARE;

    // ============================
    // RR Scheduling
    // ============================
    Process rr_p[n];
    for (int i = 0; i < n; i++) rr_p[i] = p[i];
    init_processes(rr_p, n);

    rr_schedule(rr_p, n, quantum);
    print_results(rr_p, n, "Round Robin Scheduling");
    
    if (verify_completion(rr_p, n) != EX_OK) 
        return EX_SOFTWARE;

    return EX_OK;
}
#endif /* UNIT_TEST */