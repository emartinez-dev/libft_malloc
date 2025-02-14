# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: franmart <franmart@student.42malaga.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/05 15:15:27 by franmart          #+#    #+#              #
#    Updated: 2025/01/24 18:32:38 by franmart         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifeq ($(HOSTTYPE),)
	HOSTTYPE := $(shell uname -m)_$(shell uname -s)
endif

NAME = libft_malloc_$(HOSTTYPE).so
LINK_NAME = libft_malloc.so

CC = gcc
FLAGS = -Wall -Wextra -Werror
RM = rm -rf

SRC_DIR =	src/
SRCS 	=	malloc.c

SRC = ${addprefix ${SRC_DIR}, ${SRCS}}
OBJ = ${SRC:.c=.o}

LIBFT = libs/libft/libft.a
LIBFT_DIR = libs/libft

INCLUDES = -I ./include -I ${LIBFT_DIR}/include

${NAME}: ${OBJ}
	@echo "Compiling $(NAME)..."
	@echo "Compiling dependencies..."
	@$(MAKE) -s all bonus -C $(LIBFT_DIR)
	@$(CC) $(FLAGS) $(INCLUDES) $(OBJ) -L$(LIBFT_DIR) -lft -shared -o $(NAME)
	@echo "$(NAME) compiled!"
	@echo "Linking libft_malloc.so -> $(NAME)"
	@rm -f $(LINK_NAME)
	@ln -s $(NAME) $(LINK_NAME)

%.o: %.c
	@git submodule update --init --recursive
	@${CC} ${FLAGS} -fPIC $(INCLUDES) -c $^ -o $@

all: ${NAME} ${LIBFT}

clean:
	@echo "Removing files..."
	@echo "Removing dependencies..."
	@$(MAKE) -s clean -C $(LIBFT_DIR)
	@${RM} ${OBJ} ${BONUS_OBJ}

fclean: clean
	@${RM} ${NAME}
	@${RM} ${BONUS_NAME}
	@${RM} ${LINK_NAME}
	@$(MAKE) -s fclean -C  $(LIBFT_DIR)
	@rm -f $(LINK_NAME)

test: all
	gcc $(NAME) test_main.c $(INCLUDES)
	@echo "Running test main:" && echo
	LD_LIBRARY_PATH="." ./a.out

re:	fclean all

.PHONY:	all clean fclean re test
