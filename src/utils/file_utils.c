#include "file_utils.h"

#include <fcntl.h>      /* open */
#include <unistd.h>     /* read, write, close, lseek */
#include <stdlib.h>     /* malloc, free */
#include <sys/types.h>
#include <sys/stat.h>

/**
 * @brief Reads a file into a dynamically allocated buffer.
 */
int read_file_to_buffer(const char *path, char **buffer, size_t *size)
{
    int fd = -1;
    off_t file_size;

    /* TODO:
     * 1. Open the file in read-only mode using open()
     * 2. Handle error cases properly
     */

    /* TODO:
     * 3. Determine file size using lseek()
     *    Hint: lseek(fd, 0, SEEK_END)
     */

    /* TODO:
     * 4. Return to the beginning of the file
     */

    /* TODO:
     * 5. Allocate memory using malloc()
     *    The allocated size must match the file size
     */

    /* TODO:
     * 6. Read the file content into the allocated buffer
     */

    /* TODO:
     * 7. Close the file descriptor
     */

    /* Suppress unused variable warnings for now */
    (void)fd;
    (void)file_size;
    (void)path;
    (void)buffer;
    (void)size;

    return -1;
}

/**
 * @brief Writes a buffer to a file.
 */
int write_buffer_to_file(const char *path, const char *buffer, size_t size)
{
    int fd = -1;

    /* TODO:
     * 1. Open (or create) the file using open()
     *    Use appropriate flags and permissions
     */

    /* TODO:
     * 2. Write the complete buffer using write()
     */

    /* TODO:
     * 3. Close the file descriptor
     */

    (void)fd;
    (void)path;
    (void)buffer;
    (void)size;

    return -1;
}
