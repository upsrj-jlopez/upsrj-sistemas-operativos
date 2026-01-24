#!/usr/bin/env python3
import subprocess
import os
import sys

# ANSI escape codes for colors
GREEN = "\033[92m"
RED   = "\033[91m"
BLUE  = "\033[34m"
RESET = "\033[0m"

# Paths
SRC_DIR = "src"
FILENAME = "main"
BIN_PATH = os.path.join("build", "bin", FILENAME)
LOG_PATH = os.path.join("build", "log", f"{FILENAME}.log")

EXPECTED_OUTPUT = """=== Memory Management Simulation ===

FIFO Page Replacement:
[ - - - ]
[ 1 - - ]
[ 1 2 - ]
[ 1 2 3 ]
[ 4 2 3 ]
[ 4 1 3 ]
[ 4 1 2 ]
[ 5 1 2 ]
[ 5 1 2 ]
[ 5 1 2 ]
[ 5 3 2 ]
[ 5 3 4 ]
[ 5 3 4 ]

LRU Page Replacement:
[ - - - ]
[ 1 - - ]
[ 1 2 - ]
[ 1 2 3 ]
[ 4 2 3 ]
[ 4 1 3 ]
[ 4 1 2 ]
[ 5 1 2 ]
[ 5 1 2 ]
[ 5 1 2 ]
[ 3 1 2 ]
[ 3 4 2 ]
[ 3 4 5 ]
"""

def run_cmd(cmd, cwd=None):
    """Run a shell command and return (exit_code, stdout, stderr)."""
    try:
        result = subprocess.run(
            cmd,
            cwd=cwd,
            shell=True,
            capture_output=True,
            text=True
        )
        return result.returncode, result.stdout.strip(), result.stderr.strip()
    except Exception as e:
        return 1, "", str(e)

def test_make():
    print(">>> Testing compilation with make clean all...")
    code, out, err = run_cmd("make clean all", cwd=SRC_DIR)
    if err:
        print("stderr:", err)
    assert code == 0, f"{RED}Compilation failed{RESET}"
    print(f"{GREEN}Compilation OK{RESET}")

def test_binary_exists():
    print(">>> Checking if binary exists...")
    assert os.path.isfile(BIN_PATH), f"{RED}Binary not found at {BIN_PATH}{RESET}"
    print(f"{GREEN}Binary found: {BIN_PATH}{RESET}")

def test_code_functionality():
    print(">>> Testing program functionality (black-box)...")

    code, out, err = run_cmd(BIN_PATH)
    if err:
        print("stderr:", err)

    assert code == 0, f"{RED}Program execution failed with code {code}{RESET}"

    print(f"{BLUE}Program output:\n{out}{RESET}")
    
    # Compare exact output
    assert out.strip() == EXPECTED_OUTPUT.strip(), f"{RED}Output does not match expected{RESET}"

    print(f"{GREEN}Program execution OK{RESET}")

if __name__ == "__main__":
    try:
        
        test_make()
        test_binary_exists()
        test_code_functionality()

        print(f"\n{GREEN}All tests passed{RESET}")
    except AssertionError as e:
        print(f"{RED}Test failed: {e}{RESET}")
        sys.exit(1)