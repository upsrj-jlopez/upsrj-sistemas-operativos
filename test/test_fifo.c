#include <stdio.h>
#include <assert.h>

/* Include infrastructure from student code */
#include "../src/memory/memory.h"
#include "../src/fifo/fifo.h"

/* ANSI escape codes for colors */
#define GREEN "\033[92m"
#define RED   "\033[91m"
#define BLUE  "\033[34m"
#define GRAY  "\033[90m"
#define RESET "\033[0m"

/* Prototype of student implementation */
void fifo_schedule(const int refs[], int ref_count, int frames[], int frame_count);

/* Load deterministic test data */
static void load_test_reference_string(int refs[], int *ref_count, int *frame_count)
{
    *ref_count = 12;
    *frame_count = 3;

    int tmp[12] = {1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5};
    for (int i = 0; i < *ref_count; i++) {
        refs[i] = tmp[i];
    }
}

/* Test FIFO replacement sequence */
static void test_fifo_sequence(void)
{
    int refs[MAX_REF];
    int ref_count, frame_count;
    int frames[MAX_FRAMES];
    int aux[MAX_FRAMES];

    load_test_reference_string(refs, &ref_count, &frame_count);

    init_frames(frames, aux, frame_count);
    fifo_schedule(refs, ref_count, frames, frame_count);

    /* Expected final state after FIFO with 3 frames and given reference string */
    assert(frames[0] == 5);
    assert(frames[1] == 3);
    assert(frames[2] == 4);

    printf(GREEN "[PASS]" RESET " FIFO final frame state validation\n");
}

int main(void)
{
    printf(GRAY "Running FIFO unit tests...\n" RESET);

    test_fifo_sequence();

    printf("\n" GREEN "All FIFO tests passed successfully." RESET "\n");
    return 0;
}