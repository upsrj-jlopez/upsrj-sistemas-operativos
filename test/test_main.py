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
INPUT_FILE = os.path.join("src", "input.txt")
OUTPUT_FILE = os.path.join("build", "output.txt")

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

    # Execute binary (no arguments expected)
    code, out, err = run_cmd(os.path.join("..", BIN_PATH), cwd=SRC_DIR)
    if err:
        print("stderr:", err)

    assert code == 0, f"{RED}Program execution failed with code {code}{RESET}"

    # Check input file exists
    assert os.path.isfile(INPUT_FILE), f"{RED}Input file not found: {INPUT_FILE}{RESET}"

    # Check output file generated
    assert os.path.isfile(OUTPUT_FILE), f"{RED}Output file not generated: {OUTPUT_FILE}{RESET}"
    print(f"{GREEN}Output file generated{RESET}")

    # Read files
    with open(INPUT_FILE, "r", encoding="utf-8") as f:
        input_data = f.read()

    with open(OUTPUT_FILE, "r", encoding="utf-8") as f:
        output_data = f.read()

    # Output must not be empty
    assert len(output_data) > 0, f"{RED}Output file is empty{RESET}"

    # Output should differ from input (enforces memory manipulation)
    assert output_data != input_data, (
        f"{RED}Output content is identical to input. "
        f"Expected in-memory manipulation.{RESET}"
    )

    print(f"{BLUE}Input size : {len(input_data)} bytes{RESET}")
    print(f"{BLUE}Output size: {len(output_data)} bytes{RESET}")
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