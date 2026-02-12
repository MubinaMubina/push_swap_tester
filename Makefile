################################################################################
# Makefile for Push_Swap Project
################################################################################

NAME			= push_swap
CC				= gcc
CFLAGS			= -Wall -Wextra -Werror -std=c99
OPTFLAGS		?= -O2
DEBUG_FLAGS		= -g3 -fsanitize=address

# Directories
SRC_DIR			= src
OBJ_DIR			= obj
INC_DIR			= include

# Source files
SRCS			= $(SRC_DIR)/main.c \
				  $(SRC_DIR)/stack_init.c \
				  $(SRC_DIR)/input_special.c \
				  $(SRC_DIR)/input_validation.c \
				  $(SRC_DIR)/operations_stack_a.c \
				  $(SRC_DIR)/operations_stack_b.c \
				  $(SRC_DIR)/sort_small.c \
				  $(SRC_DIR)/sort_radix.c \
				  $(SRC_DIR)/utils.c

# Object files
OBJS			= $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Include paths
INCLUDES		= -I$(INC_DIR)

# Color output
RED				= \033[0;31m
GREEN			= \033[0;32m
YELLOW			= \033[0;33m
BLUE			= \033[0;34m
NC				= \033[0m

################################################################################
# Rules
################################################################################

all: $(NAME)

$(NAME): $(OBJS)
	@echo "$(BLUE)[Linking]$(NC) $@"
	@$(CC) $(CFLAGS) $(OPTFLAGS) $(INCLUDES) -o $@ $(OBJS)
	@echo "$(GREEN)[✓] Build complete: $(NAME)$(NC)"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "$(BLUE)[Compiling]$(NC) $<"
	@$(CC) $(CFLAGS) $(OPTFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@echo "$(YELLOW)[Cleaning]$(NC) object files"
	@rm -rf $(OBJ_DIR)

fclean: clean
	@echo "$(YELLOW)[Cleaning]$(NC) executable"
	@rm -f $(NAME)

re: fclean all

debug: CFLAGS = -Wall -Wextra -Werror -std=c99 $(DEBUG_FLAGS)
debug: OPTFLAGS = -O0
debug: fclean all
	@echo "$(BLUE)[Debug build complete]$(NC)"

test: all
	@echo "$(BLUE)[Running tests]$(NC)"
	@bash tests/test_enhanced.sh

test-verbose: all
	@echo "$(BLUE)[Running tests (verbose)]$(NC)"
	@bash tests/test_enhanced.sh -v

test-quick: all
	@bash tests/test.sh

valgrind: all
	@echo "$(BLUE)[Running with Valgrind]$(NC)"
	@valgrind --leak-check=full --show-leak-kinds=all ./$(NAME) 5 4 3 2 1

leak: all
	@echo "$(BLUE)[Checking for leaks]$(NC)"
	@leaks -atExit -- ./$(NAME) 5 4 3 2 1

norm:
	@echo "$(BLUE)[Checking Norm]$(NC)"
	@norminette $(SRC_DIR)/ $(INC_DIR)/ || true

lint:
	@echo "$(BLUE)[Running clang-tidy]$(NC)"
	@clang-tidy $(SRCS) -- $(INCLUDES) || true

help:
	@echo "$(BLUE)Available targets:$(NC)"
	@echo "  $(GREEN)all$(NC)         - Build the project"
	@echo "  $(GREEN)clean$(NC)       - Remove object files"
	@echo "  $(GREEN)fclean$(NC)      - Remove all generated files"
	@echo "  $(GREEN)re$(NC)          - Rebuild from scratch"
	@echo "  $(GREEN)debug$(NC)       - Build with debug symbols and ASAN"
	@echo "  $(GREEN)test$(NC)        - Run full test suite"
	@echo "  $(GREEN)test-verbose$(NC) - Run tests with detailed output"
	@echo "  $(GREEN)test-quick$(NC)  - Run quick tests only"
	@echo "  $(GREEN)valgrind$(NC)    - Run with Valgrind"
	@echo "  $(GREEN)leak$(NC)        - Check for memory leaks (macOS)"
	@echo "  $(GREEN)norm$(NC)        - Check code style (42 Norm)"
	@echo "  $(GREEN)lint$(NC)        - Run clang-tidy"
	@echo "  $(GREEN)help$(NC)        - Show this help"

.PHONY: all clean fclean re debug test test-verbose test-quick valgrind leak norm lint help

