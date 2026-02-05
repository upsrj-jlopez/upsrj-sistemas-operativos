#!/bin/bash
###############################################################################
# File: config.sh
# Purpose: Configuration for File Management Practice tester
###############################################################################

# Project structure
SRC_DIR="../src"
SRC_FILE="${SRC_DIR}/file_practice.sh"

OUT_DIR="../out"
OUT_FILE="${OUT_DIR}/practice.txt"
OUT_LOG="${OUT_DIR}/file_practice.log"

STRUCTURE=(
    "dir:$SRC_DIR"
    "dir:$OUT_DIR"
    "file:$SRC_FILE"
    "file:$OUT_FILE"
    "file:$OUT_LOG"
)

# Script structure
HEADER="FILE MANAGEMENT PRACTICE"

SECTIONS=(
    "SECTION A: FILE CREATION"
    "SECTION B: FILE EDITING"
    "SECTION C: FILE DESCRIPTORS"
    "SECTION D: FILE PERMISSIONS"
)