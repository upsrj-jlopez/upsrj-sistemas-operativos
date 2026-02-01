# Makefile located inside tests/
# Compiles and runs unit tests using objects built in ../build/obj
# Generates ../build/bin/tests

CC      := gcc
CFLAGS  := -Wall -O2 -DUNIT_TEST

OBJ_DIR := ../build/obj
BIN_DIR := ../build/bin
TEST_BIN_DIR := $(BIN_DIR)/test

# Object files from src build
FILE_UTILS_OBJ := $(OBJ_DIR)/utils/file_utils.o

# Default rule: run all unit tests
all: unit-tests

test-file-utils: test_file_utils.c $(MEMORY_OBJ) $(FILE_UTILS_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/test-file-utils
	@echo "Running file utils tests..."
	@$(TEST_BIN_DIR)/test-file-utils

unit-tests: test-file-utils
	@echo "All unit tests executed successfully."

clean:
	@rm -rf $(TEST_BIN_DIR)
	@echo "Test binaries removed"