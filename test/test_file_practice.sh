#!/bin/bash
###############################################################################
# File: test_file_practice.sh
# Purpose: Linear automated tester for File Management Practice
# Subject: Operating Systems
###############################################################################

###############################################################################
# Color definitions
###############################################################################
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
RESET="\e[0m"

###############################################################################
# Helper functions
###############################################################################
pass() {
    echo -e "${GREEN}[PASS]${RESET} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

fail() {
    echo -e "${RED}[FAIL]${RESET} $1"
    exit 1
}

get_section() {
    local section_title="$1"
    sed -n "/^=== ${section_title} ===/,/^=== /p" out/file_practice.log \
        | sed '1d;$d'
}

###############################################################################
# Initial checks
###############################################################################
echo "Running File Management Practice Tester (Linear Mode)"
echo "------------------------------------------------------------"

###############################################################################
# STEP 1: Project structure
###############################################################################
echo "STEP 1: Checking project structure..."

[ -d "src" ] || fail "Missing 'src/' directory"
pass "'src/' directory exists"

[ -d "out" ] || fail "Missing 'out/' directory"
pass "'out/' directory exists"

[ -f "src/file_practice.sh" ] || fail "Missing 'src/file_practice.sh'"
pass "'file_practice.sh' found"

###############################################################################
# STEP 2: Script execution
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 2: Executing file_practice.sh..."

bash src/file_practice.sh > /dev/null 2>&1
[ $? -eq 0 ] || fail "file_practice.sh failed to execute"

pass "Script executed successfully"

###############################################################################
# STEP 3: Log file generation
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 3: Validating log file creation..."

[ -f "out/file_practice.log" ] || fail "Log file was not generated"

pass "Log file generated"

###############################################################################
# STEP 4: Header and author
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 4: Validating header and author..."

grep -q "FILE MANAGEMENT PRACTICE" out/file_practice.log \
    || fail "Missing practice header"

grep -q "Author (GitHub):" out/file_practice.log \
    || fail "Missing GitHub author line"

grep -q "TODO_GITHUB_USERNAME" out/file_practice.log \
    && fail "GitHub username TODO was not replaced"

pass "Header and GitHub author correctly defined"

###############################################################################
# STEP 5: File Creation section
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 5: Checking file creation..."

[ -f "practice.txt" ] || fail "practice.txt was not created"
pass "practice.txt exists"

grep -q "SECTION A: FILE CREATION" out/file_practice.log \
    || fail "Missing Section A log entry"

pass "Section A logged correctly"

###############################################################################
# STEP 6: File Editing section
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 6: Checking file editing..."

grep -q "SECTION B: FILE EDITING" out/file_practice.log \
    || fail "Missing Section B log entry"

grep -q "ANALYSIS:" out/file_practice.log \
    || warn "No analysis recorded for Section B"

pass "Section B logged correctly"

###############################################################################
# STEP 7: File Descriptors section
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 7: Checking file descriptors..."

grep -q "SECTION C: FILE DESCRIPTORS" out/file_practice.log \
    || fail "Missing Section C log entry"

# Check evidence of stdout, stderr, stdin redirection
grep -q "Hello stdout" out/file_practice.log \
    || warn "No stdout evidence found"

grep -q "No such file or directory" out/file_practice.log \
    || warn "No stderr evidence found"

grep -q "lines" out/file_practice.log \
    || warn "No stdin evidence found"

pass "Section C logged correctly"

###############################################################################
# STEP 8: File Permissions section
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 8: Checking file permissions..."

grep -q "SECTION D: FILE PERMISSIONS" out/file_practice.log \
    || fail "Missing Section D log entry"

# Verify final permissions: owner rw, group r, others none (mask 640)
perm=$(stat -c "%a" practice.txt)
if [ "$perm" -eq 640 ]; then
    pass "practice.txt permissions correctly set to 640"
else
    fail "practice.txt permissions incorrect (expected 640, got $perm)"
fi

###############################################################################
echo "------------------------------------------------------------"
echo "All checks completed."