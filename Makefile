# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mbarbari <mbarbari@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/07 16:55:33 by mbarbari          #+#    #+#              #
#    Updated: 2017/02/20 16:13:58 by barbare          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC ?= clang
CX ?= clang++

NAME = corewar

CFLAGS += -g -Wall -Wextra -Werror

SOURCES_FILES = ./sources
HEADERS_FILES = ./includes
OBJECTS_FILES = ./objects

LIBS = -Llibs/libft/ -lft
LIBSDIR = ./libs/libft/
LIBSNAME = libft.a
LIBFT = $(LIBSDIR)$(LIBSNAME)

INC = -I./includes -Ilibs/libft/include

CLI_SRCS = 	$(SOURCES_FILES)/virtual_machine.c \

CLI_OBJS = $(patsubst $(SOURCES_FILES)/%.c,$(OBJECTS_FILES)/%.o,$(CLI_SRCS))

SRC_INCLUDE = $(HEADERS_FILES)/virtual_machine.h \

RM ?= rm -f
MKDIR ?= mkdir

all: $(NAME)

print-% : ; $(info $* is $(flavor $*) variable set to [$($*)]) @true

$(NAME): $(LIBFT) $(CLI_OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(INC) $(LIBS)

$(OBJECTS_FILES)/%.o: $(SOURCES_FILES)/%.c $(SRC_INCLUDE)
	$(MKDIR) -p $(dir $@)
	$(CC) -c $(CFLAGS) $(INC) $< -o $@

$(LIBFT):
	$(MAKE) -C $(LIBSDIR)

clean:
	$(RM) $(CLI_OBJS)

fclean: clean
	$(RM) cli
	$(RM) $(CLI_OBJS)
	$(MAKE) -C $(LIBSDIR) fclean

re: fclean all

.PHONY: clean fclean re all
