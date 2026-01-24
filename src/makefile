# Makefile located inside src/
# Compiles main.c and all sched/process sources into object files and final binary
# Generates ../build/bin, ../build/obj, and ../build/log

CC      := gcc
CFLAGS  := -Wall -O2
OBJ_DIR := ../build/obj
BIN_DIR := ../build/bin
LOG_DIR := ../build/log

FILENAME := main
TARGET   := $(BIN_DIR)/$(FILENAME)
LOGS     := $(LOG_DIR)/$(FILENAME).log

# Source files
SRC_MAIN     := main.c
SRC_PROCESS  := process/process.c
SRC_SCHED    := sched/fcfs/fcfs.c sched/sjf/sjf.c sched/rr/rr.c
SRC_ALL      := $(SRC_MAIN) $(SRC_PROCESS) $(SRC_SCHED)

# Object files
OBJS := $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRC_ALL))

# Default rule: build the executable
all: $(TARGET)

# Link object files into final binary
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@
	@echo "Executable generated at $(TARGET)"

# Compile source into object files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)/process
	@mkdir -p $(OBJ_DIR)/sched/fcfs
	@mkdir -p $(OBJ_DIR)/sched/sjf
	@mkdir -p $(OBJ_DIR)/sched/rr
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Object file generated at $@"

# Run the program
run: $(TARGET)
	@$(TARGET)

# Run the program and save output to a .log file in build/log
run-save: $(TARGET)
	@mkdir -p $(LOG_DIR)
	@$(TARGET) | tee $(LOGS)
	@echo "Output saved to $(LOGS)"

# Clean up build directories
clean:
	@rm -rf ../build
	@echo "Build directory removed"