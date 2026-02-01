#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

/* Include infrastructure from student code */
#include "../src/utils/file_utils.h"

/* ANSI escape codes for colors */
#define GREEN "\033[92m"
#define RED   "\033[91m"
#define BLUE  "\033[34m"
#define GRAY  "\033[90m"
#define RESET "\033[0m"

/* Test paths (fixed, deterministic) */
#define TEST_INPUT_FILE  "../src/input.txt"
#define TEST_OUTPUT_FILE "../build/output_test.txt"

/**
 * @brief Test reading a file into dynamically allocated memory.
 */
static void test_read_file_to_buffer(void)
{
    char *buffer = NULL;
    size_t size = 0;

    int ret = read_file_to_buffer(TEST_INPUT_FILE, &buffer, &size);

    assert(ret == 0);
    assert(buffer != NULL);
    assert(size > 0);

    /* Basic content sanity check */
    assert(strstr(buffer, "Operating Systems") != NULL);

    free(buffer);

    printf(GREEN "[PASS]" RESET " read_file_to_buffer()\n");
}

/**
 * @brief Test writing a buffer to a file.
 */
static void test_write_buffer_to_file(void)
{
    const char test_data[] = "UNIT TEST OUTPUT\n";
    size_t test_size = strlen(test_data);

    int ret = write_buffer_to_file(TEST_OUTPUT_FILE, test_data, test_size);

    assert(ret == 0);

    /* Re-open output file to verify content */
    FILE *fp = fopen(TEST_OUTPUT_FILE, "r");
    assert(fp != NULL);

    char readback[64] = {0};
    if (fgets(readback, sizeof(readback), fp) == NULL)
    {
        assert(0 && "fgets failed while reading output file");
    }

    fclose(fp);

    assert(strcmp(readback, test_data) == 0);

    printf(GREEN "[PASS]" RESET " write_buffer_to_file()\n");
}

int main(void)
{
    printf(GRAY "Running file_utils unit tests...\n" RESET);

    test_read_file_to_buffer();
    test_write_buffer_to_file();

    printf("\n" GREEN "All file_utils unit tests passed successfully." RESET "\n");
    return 0;
}