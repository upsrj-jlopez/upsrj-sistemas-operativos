#!/bin/bash
###############################################################################
# File: mem_analysis.sh
# Subject: Operating Systems
# Topic: Memory Management Analysis in Linux (Ubuntu 22.04)
#
# Description:
# This script must collect memory-related information from a Linux system
# and store both command outputs and student analysis in a log file.
#
# IMPORTANT:
# - Students must complete the missing commands.
# - Do NOT modify system parameters.
# - Do NOT require user interaction.
# - All analysis must be written using echo statements.
###############################################################################

# -----------------------------------------------------------------------------
# Output configuration
# -----------------------------------------------------------------------------
OUT_DIR="../out"
LOG_FILE="${OUT_DIR}/mem_analysis.log"

mkdir -p "${OUT_DIR}"
: > "${LOG_FILE}"

###############################################################################
# Student identification
###############################################################################

# TODO:
# Define your GitHub username in the variable below.
# This value will be used to identify the author of this analysis.

GITHUB_USER="TODO_GITHUB_USERNAME"

###############################################################################
echo "================ MEMORY MANAGEMENT ANALYSIS =================" >> "${LOG_FILE}"
echo "Author (GitHub): ${GITHUB_USER}" >> "${LOG_FILE}"
echo "System: Ubuntu 22.04" >> "${LOG_FILE}"
echo "Date: $(date)" >> "${LOG_FILE}"
echo "=============================================================" >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 1: General Memory Status
###############################################################################
echo "=== SECTION 1: GENERAL MEMORY STATUS ===" >> "${LOG_FILE}"

# TODO:
# Execute a command that displays:
# - Total physical memory (RAM)
# - Used memory
# - Available memory
# - Swap usage
# The output must be written to the log file.

# NOTE:
# - This information is typically obtained using a standard Linux memory
#   reporting utility.
# - Human-readable output is strongly recommended.
#
# Useful references:
# - man free
# - https://man7.org/linux/man-pages/man1/free.1.html
#
# Helpful flags:
# - -h : display values in human-readable format (MB/GB)

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Describe the total RAM installed in the system.
# TODO: Explain the difference between used, free, and available memory.
# TODO: Explain why swap memory may be in use even if free RAM exists.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 2: Memory Status Over Time
###############################################################################
echo "=== SECTION 2: MEMORY STATUS OVER TIME ===" >> "${LOG_FILE}"

# TODO:
# Execute a command that reports virtual memory statistics periodically.
# The command must show paging activity and memory behavior over time.

# NOTE:
# - This command is used to monitor virtual memory, processes, and swap activity.
# - It can show swap-in and swap-out operations.
#
# Useful references:
# - man vmstat
# - https://man7.org/linux/man-pages/man8/vmstat.8.html
#
# Helpful flags:
# - delay : time between updates (in seconds)
# - count : number of reports to display
#
# Relevant fields:
# - si : swap in
# - so : swap out

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Explain the meaning of swap-in and swap-out.
# TODO: Indicate whether paging activity was observed.
# TODO: Describe the impact of excessive paging on performance.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 3: Kernel Memory Information
###############################################################################
echo "=== SECTION 3: KERNEL MEMORY INFORMATION ===" >> "${LOG_FILE}"

# TODO:
# Retrieve detailed memory information directly from the kernel.

# NOTE:
# - The Linux kernel exposes memory statistics through a virtual filesystem.
# - This data reflects real-time kernel memory management.
#
# Useful references:
# - https://docs.kernel.org/filesystems/proc.html
# - man proc
#
# Important fields to observe:
# - MemTotal
# - MemFree
# - MemAvailable
# - Buffers
# - Cached
# - SwapTotal
# - SwapFree

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Explain the difference between MemFree and MemAvailable.
# TODO: Describe the purpose of buffers and cache.
# TODO: Explain why Linux aggressively uses memory for caching.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 4: Memory Usage by Processes
###############################################################################
echo "=== SECTION 4: MEMORY USAGE BY PROCESSES ===" >> "${LOG_FILE}"

# TODO:
# List running processes sorted by memory usage in descending order.
# Limit the output to the top memory-consuming processes.

# NOTE:
# - This command lists all running processes along with resource usage.
#
# Useful references:
# - man ps
# - https://man7.org/linux/man-pages/man1/ps.1.html
#
# Helpful flags:
# - aux : show processes for all users with detailed format
# - --sort=-%mem : sort by memory usage (descending)
# - head : limit output size

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Identify the process consuming the most memory.
# TODO: Classify it as a system or user process.
# TODO: Explain the risks of uncontrolled memory usage.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 5: Swap Memory Analysis
###############################################################################
echo "=== SECTION 5: SWAP MEMORY ANALYSIS ===" >> "${LOG_FILE}"

# TODO:
# Display currently active swap devices and their usage.

# NOTE:
# - Swap devices are used as an extension of physical memory.
#
# Useful references:
# - man swapon
# - https://man7.org/linux/man-pages/man8/swapon.8.html
#
# Helpful flags:
# - --show : display active swap areas

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

# TODO:
# Retrieve detailed swap information from the kernel.

# NOTE:
# - Swap details are exposed via the /proc virtual filesystem.
#
# Useful references:
# - https://docs.kernel.org/filesystems/proc.html

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Indicate whether swap is enabled.
# TODO: State the total swap size.
# TODO: Explain the role of swap in virtual memory systems.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 6: Swappiness Parameter
###############################################################################
echo "=== SECTION 6: SWAPPINESS PARAMETER ===" >> "${LOG_FILE}"

# TODO:
# Read the kernel parameter that controls swap aggressiveness.

# NOTE:
# - Swappiness controls how often the kernel prefers swap over RAM.
# - Values range from 0 (avoid swap) to 100 (prefer swap).
#
# Useful references:
# - https://docs.kernel.org/admin-guide/sysctl/vm.html
# - man sysctl

# TODO: Write the appropriate command here
# >> "${LOG_FILE}"

echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
# TODO: Interpret the swappiness value.
# TODO: Describe system behavior with high swappiness.
# TODO: Describe system behavior with low swappiness.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 7: Theoretical Relation
###############################################################################
echo "=== SECTION 7: THEORETICAL RELATION ===" >> "${LOG_FILE}"

# TODO: Relate physical memory to frames.
# TODO: Relate virtual memory to pages.
# TODO: Explain the role of the MMU.
# TODO: Explain paging and swap interaction.
# TODO: Describe what thrashing is and how it could be detected.
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION 8: Conclusions
###############################################################################
echo "=== CONCLUSIONS ===" >> "${LOG_FILE}"

# TODO: Answer whether Linux wastes memory.
# TODO: Explain why low free memory is not necessarily a problem.
# TODO: Summarize key lessons learned about memory management.
echo "" >> "${LOG_FILE}"

###############################################################################
echo "================ END OF ANALYSIS =================" >> "${LOG_FILE}"
