#!/bin/bash
###############################################################################
# File: test_mem_analysis.sh
# Purpose: Linear automated tester for Memory Management Analysis practice
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

    sed -n "/^=== ${section_title} ===/,/^=== /p" out/mem_analysis.log \
        | sed '1d;$d'
}

###############################################################################
# Initial checks
###############################################################################
echo "Running Memory Management Practice Tester (Linear Mode)"
echo "------------------------------------------------------------"

###############################################################################
# STEP 1: Project structure
###############################################################################
echo "STEP 1: Checking project structure..."

[ -d "src" ] || fail "Missing 'src/' directory"
pass "'src/' directory exists"

[ -d "out" ] || fail "Missing 'out/' directory"
pass "'out/' directory exists"

[ -f "src/mem_analysis.sh" ] || fail "Missing 'src/mem_analysis.sh'"
pass "'mem_analysis.sh' found"

###############################################################################
# STEP 2: Script execution
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 2: Executing mem_analysis.sh..."

bash src/mem_analysis.sh > /dev/null 2>&1
[ $? -eq 0 ] || fail "mem_analysis.sh failed to execute"

pass "Script executed successfully"

###############################################################################
# STEP 3: Log file generation
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 3: Validating log file creation..."

[ -f "out/mem_analysis.log" ] || fail "Log file was not generated"

pass "Log file generated"

###############################################################################
# STEP 4: Header and author (TODO 1)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 4: Validating header and author..."

grep -q "MEMORY MANAGEMENT ANALYSIS" out/mem_analysis.log \
    || fail "Missing analysis header"

grep -q "Author (GitHub):" out/mem_analysis.log \
    || fail "Missing GitHub author line"

grep -q "TODO_GITHUB_USERNAME" out/mem_analysis.log \
    && fail "GitHub username TODO was not replaced"

pass "Header and GitHub author correctly defined"

###############################################################################
# STEP 5: Section 1 – General Memory Status (TODO 2)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 5: Validating SECTION 1..."

grep -q "SECTION 1: GENERAL MEMORY STATUS" out/mem_analysis.log \
    || fail "Missing SECTION 1 header"

grep -Eq "Mem|Swap" out/mem_analysis.log \
    || fail "No memory or swap data detected in SECTION 1"

pass "SECTION 1 contains memory status data"

###############################################################################
# STEP 6: Section 2 – Memory Over Time (TODO 3)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 6: Validating SECTION 2..."

grep -q "SECTION 2: MEMORY STATUS OVER TIME" out/mem_analysis.log \
    || fail "Missing SECTION 2 header"

# Validate vmstat header (strong evidence of correct command usage)
grep -q "procs -----------memory----------" out/mem_analysis.log \
    || fail "vmstat output header not detected"

# Validate presence of si/so columns (not just words in text)
grep -Eq "^[[:space:]]*[r|b].*si[[:space:]]+so" out/mem_analysis.log \
    || warn "vmstat si/so columns not clearly detected (system may be idle)"

pass "SECTION 2 vmstat output detected and validated"

###############################################################################
# STEP 7: Section 3 – Kernel Memory Info (TODO 4)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 7: Validating SECTION 3..."

grep -q "SECTION 3: KERNEL MEMORY INFORMATION" out/mem_analysis.log \
    || fail "Missing SECTION 3 header"

# Strong evidence: /proc/meminfo kernel fields
KERNEL_FIELDS=(
    "MemTotal:"
    "MemFree:"
    "MemAvailable:"
    "Buffers:"
    "Cached:"
)

for field in "${KERNEL_FIELDS[@]}"; do
    grep -q "^${field}" out/mem_analysis.log \
        || fail "Kernel memory field not found: ${field}"
done

# Swap fields may not exist if swap is disabled
grep -q "^SwapTotal:" out/mem_analysis.log \
    && pass "SwapTotal field detected" \
    || warn "SwapTotal not detected (swap may be disabled)"

grep -q "^SwapFree:" out/mem_analysis.log \
    && pass "SwapFree field detected" \
    || warn "SwapFree not detected (swap may be disabled)"

pass "SECTION 3 kernel memory information validated"

###############################################################################
# STEP 8: Section 4 – Process Memory Usage (TODO 5)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 8: Validating SECTION 4..."

grep -q "SECTION 4: MEMORY USAGE BY PROCESSES" out/mem_analysis.log \
    || fail "Missing SECTION 4 header"

# Validate ps header in a tolerant way
grep -Eq "USER[[:space:]]+PID.*%MEM" out/mem_analysis.log \
    || fail "ps output header not detected"

# Validate presence of at least one real process entry (PID numeric)
grep -Eq "^[[:space:]]*(root|[a-zA-Z0-9_-]+)[[:space:]]+[0-9]+" out/mem_analysis.log \
    || fail "No valid process entries detected"

pass "SECTION 4 process memory usage validated"

###############################################################################
# STEP 9: Section 5 – Swap Analysis (TODO 6)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 9: Validating SECTION 5..."

section5="$(get_section "SECTION 5: SWAP MEMORY ANALYSIS")"

[ -z "$section5" ] && fail "SECTION 5 content is empty"

echo "$section5" | grep -q "^SwapTotal:" \
    || fail "SwapTotal not found in SECTION 5"

echo "$section5" | grep -q "^SwapFree:" \
    || fail "SwapFree not found in SECTION 5"

pass "Kernel swap information detected"

echo "$section5" | grep -q "^NAME[[:space:]]\+TYPE" \
    && pass "Active swap devices listed" \
    || warn "No active swap devices detected (swap may be disabled)"

pass "SECTION 5 validated correctly"

###############################################################################
# STEP 10: Section 6 – Swappiness (TODO 7)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 10: Validating SECTION 6..."

grep -q "SECTION 6: SWAPPINESS PARAMETER" out/mem_analysis.log \
    || fail "Missing SECTION 6 header"

grep -Eq "^[0-9]+$" out/mem_analysis.log \
    || fail "Swappiness value not detected"

pass "Swappiness value detected"

###############################################################################
# STEP 11: Section 7 – Theory (TODO 8)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 11: Validating SECTION 7 (theory)..."

section7="$(get_section "SECTION 7: THEORETICAL RELATION")"

# Section must exist
[ -z "$section7" ] && fail "SECTION 7 is empty"

# Must contain actual text
echo "$section7" | grep -q '[A-Za-z]' \
    || fail "SECTION 7 contains no theoretical explanation"

# Required theoretical concepts
KEYWORDS=(page frame mmu swap paging thrashing)

for kw in "${KEYWORDS[@]}"; do
    if ! echo "$section7" | grep -iq "$kw"; then
        warn "Missing theoretical concept: $kw"
        fail "SECTION 7 theory incomplete"
    fi
done

pass "SECTION 7 theory complete and valid"

###############################################################################
# STEP 12: Conclusions (TODO 9)
###############################################################################
echo "------------------------------------------------------------"
echo "STEP 12: Validating CONCLUSIONS..."

conclusions="$(get_section "CONCLUSIONS")"

# Section must exist
[ -z "$conclusions" ] && fail "CONCLUSIONS section is empty or missing"

# Must contain actual explanatory text
echo "$conclusions" | grep -q '[A-Za-z]' \
    || fail "CONCLUSIONS contains no explanatory text"

# Required reflection concepts
KEYWORDS=(memory RAM swap paging cache performance)

for kw in "${KEYWORDS[@]}"; do
    if ! echo "$conclusions" | grep -iq "$kw"; then
        warn "Missing concept in conclusions: $kw"
        fail "CONCLUSIONS incomplete"
    fi
done

pass "CONCLUSIONS complete and valid"

###############################################################################
# Final result
###############################################################################
echo "------------------------------------------------------------"
echo -e "${GREEN}All steps completed successfully.${RESET}"
echo "The practice is complete and progressively validated."
echo "------------------------------------------------------------"
