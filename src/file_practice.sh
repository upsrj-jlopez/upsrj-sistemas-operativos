#!/bin/bash
###############################################################################
# File: file_practice.sh
# Subject: Operating Systems
# Topic: File Management Practice in Linux (Ubuntu 22.04)
#
# Description:
# This script sets controlled tasks for practicing file management in Linux.
# Students must:
# - Create and inspect files
# - Explore editors (vi, vim, nano)
# - Experiment with stdin, stdout, stderr
# - Configure permissions based on a textual requirement
#
# IMPORTANT:
# - Students must complete the missing commands.
# - Do NOT require user interaction in the script itself.
# - All analysis must be written using echo statements.
###############################################################################

OUT_DIR="../out"
OUT_FILE="${OUT_DIR}/practice.txt"
LOG_FILE="${OUT_DIR}/file_practice.log"

mkdir -p "${OUT_DIR}"
: > "${LOG_FILE}"

###############################################################################
# Student identification
###############################################################################
GITHUB_USER="TODO_GITHUB_USERNAME"

echo "================ FILE MANAGEMENT PRACTICE =================" >> "${LOG_FILE}"
echo "Author (GitHub): ${GITHUB_USER}" >> "${LOG_FILE}"
echo "System: Ubuntu 22.04" >> "${LOG_FILE}"
echo "Date: $(date)" >> "${LOG_FILE}"
echo "===========================================================" >> "${LOG_FILE}"
echo "" >> "${LOG_FILE}"

###############################################################################
# SECTION A: File Creation
###############################################################################
echo "=== SECTION A: FILE CREATION ===" >> "${LOG_FILE}"

# TODO:
# - Create file practice.txt with variable $OUT_FILE
# - Record its metadata in the log
# - Observe how timestamps change if you repeat the operation after a minute

# Describe what you observed about file creation and metadata fields.
echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo """

""" >> "${LOG_FILE}"

###############################################################################
# SECTION B: File Editing
###############################################################################
echo "=== SECTION B: FILE EDITING ===" >> "${LOG_FILE}"

# TODO:
# - Open practice.txt with at least one editor (vi, vim, nano).
# - Add a short line of text.
# - Save and exit.
# - Record in the log which editor was used and how you saved the file.

# Compare editors in terms of usability and commands required to save/exit.
echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo """

""" >> "${LOG_FILE}"

###############################################################################
# SECTION C: File Descriptors (stdin=0, stdout=1, stderr=2)
###############################################################################
echo "=== SECTION C: FILE DESCRIPTORS ===" >> "${LOG_FILE}"

# TODO:
# - Redirect normal output to the log (stdout).
# - Redirect an error message to the log (stderr).
# - Use stdin redirection to count lines in practice.txt.
# - Record the outputs.

# Explain what each descriptor represents and how redirection works.
echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo """

""" >> "${LOG_FILE}"

###############################################################################
# SECTION D: File Permissions
###############################################################################
echo "=== SECTION D: FILE PERMISSIONS ===" >> "${LOG_FILE}"

# TODO:
# The file practice.txt must have the following access rules:
# - The owner can read and write the file.
# - The group can only read the file.
# - Others should have no access at all.
#
# Students must:
# - Inspect current permissions of practice.txt.
# - Modify them to match the description above.
# - Record before/after states in the log.

# Deduce the correct permission mask from the description.
# Explain why each category (user/group/others) has those rights.
echo "" >> "${LOG_FILE}"
echo "ANALYSIS:" >> "${LOG_FILE}"
echo """

""" >> "${LOG_FILE}"

###############################################################################
echo "================ END OF PRACTICE =================" >> "${LOG_FILE}"