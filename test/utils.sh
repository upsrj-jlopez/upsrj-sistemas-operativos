#!/bin/bash
###############################################################################
# File: utils.sh
# Purpose: Shared variables and helper functions for testers
###############################################################################

# Color definitions
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
RESET="\e[0m"

# Helper functions
pass() {
    echo -e "${GREEN}[PASS]${RESET} $1"
}

WARNINGS=0
warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
    WARNINGS=$((WARNINGS+1))
}

fail() {
    echo -e "${RED}[FAIL]${RESET} $1"
    exit 1
}

get_section() {
    local section_title="$1"
    sed -n "/^=== ${section_title} ===/,/^=== /p" $OUT_LOG \
        | sed '1d;$d'
}

check_section_exists() {
    local section="$1"
    local log="$2"

    if grep -q "=== ${section} ===" "$log"; then
        pass "Section '${section}' found in log"
    else
        fail "Missing section '${section}' in log"
    fi
}

check_analysis_not_empty() {
    local section="$1"
    local log="$2"

    analysis=$(sed -n "/^=== ${section} ===/,/^=== /p" "$log" | grep -A100 "ANALYSIS:" | tail -n +2 | grep -v "^===")

    if [ -z "$(echo "$analysis" | tr -d '[:space:]')" ]; then
        warn "Analysis block in section '${section}' is empty"
    else
        pass "Analysis block in section '${section}' has content"
    fi
}

check_project_structure() {
    echo "------------------------------------------------------------"
    echo "Checking project structure..."

    for item in "${STRUCTURE[@]}"; do
        type="${item%%:*}"   # extrae antes de ':'
        path="${item#*:}"    # extrae después de ':'

        if [ "$type" = "dir" ]; then
            if [ -d "$path" ]; then
                pass "'$path/' directory exists"
            else
                fail "Missing '$path/' directory"
            fi
        elif [ "$type" = "file" ]; then
            if [ -f "$path" ]; then
                pass "'$path' found"
            else
                fail "Missing '$path'"
            fi
        fi
    done
}

check_header_and_author() {
    local log="$1"
    local hdr="$2"

    echo "------------------------------------------------------------"
    echo "Validating header and author..."

    grep -q "$hdr" "$log" \
        || fail "Missing practice header"

    grep -q "Author (GitHub):" "$log" \
        || fail "Missing GitHub author line"

    grep -q "TODO_GITHUB_USERNAME" "$log" \
        && fail "GitHub username TODO was not replaced"

    pass "Header and GitHub author correctly defined"
}

check_script_execution() {
    local src_dir="$1"
    local src_file="$2"

    echo "------------------------------------------------------------"
    echo "Executing $(basename "$src_file")..."

    (
        cd "$src_dir" || fail "Cannot cd into $src_dir"
        bash "$(basename "$src_file")" > /dev/null 2>&1
        [ $? -eq 0 ] || fail "$(basename "$src_file") failed to execute"
    )

    pass "Script executed successfully"
}

check_log_and_sections() {
    local log="$1"
    local sections=("${!2}")

    echo "------------------------------------------------------------"
    echo "Validating log file creation..."

    [ -f "$log" ] || fail "Log file was not generated"
    pass "Log file generated"

    for section in "${sections[@]}"; do
        echo "------------------------------------------------------------"
        echo "Checking $section..."
        check_section_exists "$section" "$log"
        check_analysis_not_empty "$section" "$log"
    done
}

finalize_checks() {
    echo "------------------------------------------------------------"
    if [ "$WARNINGS" -gt 0 ]; then
        fail "Practice completed with $WARNINGS warnings (analysis blocks missing content)"
    else
        pass "All analysis blocks contain content"
    fi
}

test_case_header() {
    local num="$1"
    local description="$2"

    echo "------------------------------------------------------------"
    echo "TEST CASE $num: Checking $description..."
}

test_case_pass() {
    local num="$1"
    local description="$2"

    echo "TEST CASE $num: $description ALL PASSED"
}