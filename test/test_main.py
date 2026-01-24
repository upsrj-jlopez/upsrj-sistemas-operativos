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

def run_cmd(cmd, cwd=None, input_data=None):
    """Run a shell command with optional stdin and return (exit_code, stdout, stderr)."""
    try:
        result = subprocess.run(
            cmd,
            cwd=cwd,
            shell=True,
            input=input_data,
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

def test_code_functionality(input_data: str):
    """Black-box test: run the program with sample input and check output."""
    print(">>> Testing program functionality (black-box)...")

    code, out, err = run_cmd(BIN_PATH, input_data=input_data)
    if err:
        print("stderr:", err)

    # Check exit code
    assert code == 0, f"{RED}Program execution failed with code {code}{RESET}"

    # Check that output contains expected algorithm titles
    assert "FCFS Scheduling" in out, f"{RED}Missing FCFS output{RESET}"
    assert "SJF Scheduling" in out, f"{RED}Missing SJF output{RESET}"
    assert "Round Robin Scheduling" in out, f"{RED}Missing RR output{RESET}"

    print(f"{BLUE}Program output:\n{out}{RESET}")
    print(f"{GREEN}Program execution OK{RESET}")

if __name__ == "__main__":
    try:
        # Provide input for scanf: number of processes and quantum
        testcase = "\n".join([str(3), str(2)]) + "\n"
        
        test_make()
        test_binary_exists()
        test_code_functionality(testcase)

        print(f"\n{GREEN}All tests passed{RESET}")
    except AssertionError as e:
        print(f"{RED}Test failed: {e}{RESET}")
        sys.exit(1)