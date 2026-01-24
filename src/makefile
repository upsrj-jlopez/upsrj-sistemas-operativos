# Makefile located inside src/
# Compiles main.c and all memory algorithm sources into object files and final binary
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
SRC_MAIN   := main.c
SRC_MEMORY := memory/memory.c
SRC_FIFO   := fifo/fifo.c
SRC_LRU    := lru/lru.c
SRC_ALL    := $(SRC_MAIN) $(SRC_MEMORY) $(SRC_FIFO) $(SRC_LRU)

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
	@mkdir -p $(OBJ_DIR)/memory
	@mkdir -p $(OBJ_DIR)/fifo
	@mkdir -p $(OBJ_DIR)/lru
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