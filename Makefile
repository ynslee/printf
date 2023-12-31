# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yoonslee <yoonslee@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/12 13:39:08 by yoonslee          #+#    #+#              #
#    Updated: 2023/07/07 15:54:10 by yoonslee         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
SRCS = ft_printf.c ft_printf_utils.c ft_printf_ptr.c ft_printf_hex.c
OBJS = $(SRCS:.c=.o)
INCLUDE = libft/libft.h
CFLAGS = -c -Wall -Wextra -Werror

all: $(NAME)

$(NAME):
	make -C ./libft all
	make -C ./libft bonus
	mv ./libft/libft.a ./$(NAME)
	cc $(CFLAGS) $(SRCS) -I $(INCLUDE) main.c
	ar -rus $(NAME) $(OBJS)

clean:
	make -C ./libft clean
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	make -C ./libft fclean
	rm -f $(NAME)
	rm -f libft.a

re: fclean all

.PHONY: all clean fclean re libft