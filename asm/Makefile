SRC_NAME = main.c \
			buffer.c \
			lexical_analyser.c \
			struct_lex.c \
			lex_cmd.c \
			lex_label.c \
			lex_opcode.c \
			syntax_analyser.c \
			syntax_error.c \
			syntax_argument.c \
			djb2.c \
			opcode.c \
			header.c \
			cmd.c \
			label0.c \
			label1.c \
			bytecode0.c \
			bytecode1.c \
			bytecode2.c \
			compilateur.c \
			error.c

OBJ_NAME = $(SRC_NAME:.c=.o)

NAME = asm

SRC_PATH = ./sources/
OBJ_PATH = ./objects/
INC_PATH = ./includes/ ../libs/libft/include/ ../core/

CC = gcc
CFLAGS = -Wall -Werror -Wextra
CLIBS = -L../libs/libft/ -lft

LIBSDIR = ../libs/libft/
LIBFT = $(LIBSDIR)libft.a

CHECK_PATH=./unitest/
CHECK=check.sh

DEBUG_BASIC = -g -fsanitize=address
DEBUG_PROF = -pg

ifeq ($(DEBUG), basic)
	CFLAGS += $(DEBUG_BASIC)
endif
ifeq ($(DEBUG), prof)
	CFLAGS += $(DEBUG_PROF)
endif

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
INC = $(addprefix -I,$(INC_PATH))

$(NAME): $(LIBFT) $(OBJ)
	$(CC) $(CFLAGS) $(INC) -o $(NAME) $(OBJ) $(CLIBS)

all: $(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir -p $(OBJ_PATH) 2> /dev/null || echo "" > /dev/null
	$(CC) $(CFLAGS) $(INC) -o $@ -c $<

$(LIBFT):
	make -C $(LIBSDIR)

check:
	@./$(CHECK_PATH)$(CHECK)

clean:
	rm -f $(OBJ)
ifneq ($(OBJ_PATH), ./)
	rm -rf $(OBJ_PATH)
endif

fclean: clean
	rm -f $(NAME)
ifeq ($(LIB), true)
	make -C $(LIBSDIR) fclean
endif

mrproper: fclean
	rm -f check.log
	rm -f compilation.log

re: fclean all

.PHONY: all clean fclean mrproper re
