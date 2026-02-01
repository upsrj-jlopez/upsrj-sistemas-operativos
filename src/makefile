# Makefile located inside src/
# Compiles main.c and file handling utilities into object files and final binary
# Generates ../build/bin, ../build/obj, and ../build/log

CC      := gcc
CFLAGS  := -Wall -Wextra -O2

OBJ_DIR := ../build/obj
BIN_DIR := ../build/bin
LOG_DIR := ../build/log

FILENAME := main
TARGET   := $(BIN_DIR)/$(FILENAME)
LOGS     := $(LOG_DIR)/$(FILENAME).log

# Source files
SRC_MAIN  := main.c
SRC_UTILS := utils/file_utils.c
SRC_ALL   := $(SRC_MAIN) $(SRC_UTILS)

# Object files
OBJS := $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRC_ALL))

# Default rule
all: $(TARGET)

# Link object files into final binary
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@
	@echo "Executable generated at $(TARGET)"

# Compile source files into object files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)/utils
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Object file generated at $@"

# Run the program
run: $(TARGET)
	@$(TARGET)

# Run the program and save output to build/log
run-save: $(TARGET)
	@mkdir -p $(LOG_DIR)
	@$(TARGET) | tee $(LOGS)
	@echo "Output saved to $(LOGS)"

# Clean build artifacts
clean:
	@rm -rf ../build
	@echo "Build directory removed"
