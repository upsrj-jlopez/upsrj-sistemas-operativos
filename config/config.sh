#!/bin/bash
###############################################################################
# File: config.sh
# Purpose: Configuration for File Management Practice tester
###############################################################################

# Project structure
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"

SRC_DIR="${ROOT_DIR}/src"
SRC_DATA="${SRC_DIR}/syslog"
SRC_SCRIPT="${SRC_DIR}/practice.sh"

OUT_DIR="${ROOT_DIR}/out"
OUT_LOG="${OUT_DIR}/practice.log"

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