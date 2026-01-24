#include <stdio.h>
#include <assert.h>

/* Include infrastructure from student code */
#include "../src/memory/memory.h"
#include "../src/lru/lru.h"

/* ANSI escape codes for colors */
#define GREEN "\033[92m"
#define RED   "\033[91m"
#define BLUE  "\033[34m"
#define GRAY  "\033[90m"
#define RESET "\033[0m"

/* Prototype of student implementation */
void lru_schedule(const int refs[], int ref_count, int frames[], int last_used[], int frame_count);

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

/* Test LRU replacement sequence */
static void test_lru_sequence(void)
{
    int refs[MAX_REF];
    int ref_count, frame_count;
    int frames[MAX_FRAMES];
    int last_used[MAX_FRAMES];

    load_test_reference_string(refs, &ref_count, &frame_count);

    init_frames(frames, last_used, frame_count);
    lru_schedule(refs, ref_count, frames, last_used, frame_count);

    /* Expected final state after LRU with 3 frames and given reference string */
    assert(frames[0] == 3);
    assert(frames[1] == 4);
    assert(frames[2] == 5);

    printf(GREEN "[PASS]" RESET " LRU final frame state validation\n");
}

int main(void)
{
    printf(GRAY "Running LRU unit tests...\n" RESET);

    test_lru_sequence();

    printf("\n" GREEN "All LRU tests passed successfully." RESET "\n");
    return 0;
}