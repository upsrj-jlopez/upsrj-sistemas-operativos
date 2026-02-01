#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "./utils/file_utils.h"

/**
 * @file main.c
 * @brief Main entry point for the file handling exercise.
 */

/**
 * @brief Program entry point.
 *
 * Default usage:
 * Uses DEFAULT_INPUT_FILE as input
 * Uses DEFAULT_OUTPUT_FILE as output
 */

#ifndef DEFAULT_INPUT_FILE
#define DEFAULT_INPUT_FILE "../src/input.txt"
#endif

#ifndef DEFAULT_OUTPUT_FILE
#define DEFAULT_OUTPUT_FILE "../build/output.txt"
#endif

#ifndef UNIT_TEST
int main(void)
{
    char *buffer = NULL;
    size_t size = 0;

    const char *input_path  = DEFAULT_INPUT_FILE;
    const char *output_path = DEFAULT_OUTPUT_FILE;

    /* TODO:
     * 1. Read the input file into memory using read_file_to_buffer()
     */

    /* TODO:
     * 2. Manipulate the buffer content in memory
     *    Example ideas:
     *    - Convert lowercase letters to uppercase
     *    - Count characters
     *    - Replace spaces with underscores
     */

    /* TODO:
     * 3. Write the modified buffer to the output file
     */

    /* TODO:
     * 4. Free dynamically allocated memory
     */

    (void)buffer;
    (void)size;
    (void)*input_path;
    (void)*output_path;

    return 0;
}
#endif /* UNIT_TEST */
