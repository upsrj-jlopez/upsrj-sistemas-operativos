# Makefile located inside tests/
# Compiles and runs unit tests using objects built in ../build/obj
# Generates ../build/bin/tests

CC      := gcc
CFLAGS  := -Wall -O2 -DUNIT_TEST

OBJ_DIR := ../build/obj
BIN_DIR := ../build/bin
TEST_BIN_DIR := $(BIN_DIR)/test

# Object files from src build
PROCESS_OBJ := $(OBJ_DIR)/process/process.o
FCFS_OBJ    := $(OBJ_DIR)/sched/fcfs/fcfs.o
SJF_OBJ     := $(OBJ_DIR)/sched/sjf/sjf.o
RR_OBJ      := $(OBJ_DIR)/sched/rr/rr.o

# Default rule: run all unit tests
all: unit-tests

fcfs-test: test_fcfs.c $(PROCESS_OBJ) $(FCFS_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/fcfs_test
	@echo "Running FCFS test..."
	@$(TEST_BIN_DIR)/fcfs_test

sjf-test: test_sjf.c $(PROCESS_OBJ) $(SJF_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/sjf_test
	@echo "Running SJF test..."
	@$(TEST_BIN_DIR)/sjf_test

rr-test: test_rr.c $(PROCESS_OBJ) $(RR_OBJ)
	@mkdir -p $(TEST_BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $(TEST_BIN_DIR)/rr_test
	@echo "Running RR test..."
	@$(TEST_BIN_DIR)/rr_test

unit-tests: fcfs-test sjf-test rr-test
	@echo "All unit tests executed successfully."

clean:
	@rm -rf $(TEST_BIN_DIR)
	@echo "Test binaries removed"