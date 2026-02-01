#ifndef FILE_UTILS_H
#define FILE_UTILS_H

#include <stddef.h>

/**
 * @file file_utils.h
 * @brief File handling utility functions using POSIX system calls.
 */

/**
 * @brief Reads the complete content of a file into dynamically allocated memory.
 *
 * This function must:
 * - Open the file using open()
 * - Determine its size
 * - Allocate memory using malloc()
 * - Read the full content into memory
 *
 * @param path Path to the file.
 * @param buffer Pointer to the allocated buffer (output).
 * @param size Size of the allocated buffer (output).
 *
 * @return 0 on success, -1 on error.
 */
int read_file_to_buffer(const char *path, char **buffer, size_t *size);

/**
 * @brief Writes a buffer to a file using POSIX write().
 *
 * @param path Path to the output file.
 * @param buffer Data to write.
 * @param size Number of bytes to write.
 *
 * @return 0 on success, -1 on error.
 */
int write_buffer_to_file(const char *path, const char *buffer, size_t size);

#endif /* FILE_UTILS_H */
