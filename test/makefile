# Makefile located inside tests/
# Compiles and runs unit tests using objects built in ../build/obj
# Generates ../build/bin/tests

CC      := gcc
CFLAGS  := -Wall -O2 -DUNIT_TEST

OBJ_DIR := ../build/obj
BIN_DIR := ../build/bin
TEST_BIN_DIR := $(BIN_DIR)/test

# Object files from src build
FIFO_OBJ    := $(OBJ_DIR)/fifo/fifo.o
LRU_OBJ     := $(OBJ_DIR)/lru/lru.o
MEMORY_OBJ  := $(OBJ_DIR)/memory/memory.o

# Default rule: run all unit tests
all: unit-tests

fifo-test: test_fifo.c $(MEMORY_OBJ) $(FIFO_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/fifo_test
	@echo "Running FIFO test..."
	@$(TEST_BIN_DIR)/fifo_test

lru-test: test_lru.c $(MEMORY_OBJ) $(LRU_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/lru_test
	@echo "Running LRU test..."
	@$(TEST_BIN_DIR)/lru_test

unit-tests: fifo-test lru-test
	@echo "All unit tests executed successfully."

clean:
	@rm -rf $(TEST_BIN_DIR)
	@echo "Test binaries removed"