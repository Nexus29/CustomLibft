# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: glancell <glancell@student.42firenze.it    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/24 19:55:21 by glancell          #+#    #+#              #
#    Updated: 2025/11/26 23:29:58 by glancell         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror
ARCHIVE	=	ar rc $(NAME)
RM		=	rm -f

SRCDIR	=	src/
SRC		=	$(SRCDIR)file_I_O/ft_putchar_fd.c $(SRCDIR)file_I_O/ft_putendl_fd.c $(SRCDIR)file_I_O/ft_putnbr_fd.c $(SRCDIR)file_I_O/ft_putstr_fd.c \
			$(SRCDIR)ft_printf/ft_applier_bonus.c $(SRCDIR)ft_printf/ft_init.c $(SRCDIR)ft_printf/ft_parse_bonus.c \
			$(SRCDIR)ft_printf/ft_print_hex_bonus.c $(SRCDIR)ft_printf/ft_print_int_bonus.c $(SRCDIR)ft_printf/ft_print_pointer_bonus.c \
			$(SRCDIR)ft_printf/ft_print_str_bonus.c $(SRCDIR)ft_printf/ft_print_unsigned_bonus.c $(SRCDIR)ft_printf/ft_put_utils.c \
			$(SRCDIR)ft_printf/ft_support.c $(SRCDIR)get_next_line/get_next_line.c \
			$(SRCDIR)linked_list/ft_lstadd_back.c $(SRCDIR)linked_list/ft_lstadd_front.c $(SRCDIR)linked_list/ft_lstclear.c $(SRCDIR)linked_list/ft_lstdelone.c \
			$(SRCDIR)linked_list/ft_lstiter.c $(SRCDIR)linked_list/ft_lstlast.c $(SRCDIR)linked_list/ft_lstmap.c $(SRCDIR)linked_list/ft_lstnew.c $(SRCDIR)linked_list/ft_lstsize.c \
			$(SRCDIR)memory_management/ft_bzero.c $(SRCDIR)memory_management/ft_calloc.c $(SRCDIR)memory_management/ft_memchr.c $(SRCDIR)memory_management/ft_memcmp.c \
			$(SRCDIR)memory_management/ft_memcpy.c $(SRCDIR)memory_management/ft_memmove.c $(SRCDIR)memory_management/ft_memset.c \
			$(SRCDIR)string_manipulation/ft_atoi.c $(SRCDIR)string_manipulation/ft_isalnum.c $(SRCDIR)string_manipulation/ft_isalpha.c $(SRCDIR)string_manipulation/ft_isascii.c \
			$(SRCDIR)string_manipulation/ft_isdigit.c $(SRCDIR)string_manipulation/ft_isprint.c $(SRCDIR)string_manipulation/ft_itoa.c $(SRCDIR)string_manipulation/ft_split.c \
			$(SRCDIR)string_manipulation/ft_strchr.c $(SRCDIR)string_manipulation/ft_strdup.c $(SRCDIR)string_manipulation/ft_striteri.c $(SRCDIR)string_manipulation/ft_strjoin.c \
			$(SRCDIR)string_manipulation/ft_strlcat.c $(SRCDIR)string_manipulation/ft_strlcpy.c $(SRCDIR)string_manipulation/ft_strlen.c $(SRCDIR)string_manipulation/ft_strmapi.c \
			$(SRCDIR)string_manipulation/ft_strncmp.c $(SRCDIR)string_manipulation/ft_strnstr.c $(SRCDIR)string_manipulation/ft_strrchr.c $(SRCDIR)string_manipulation/ft_strtrim.c \
			$(SRCDIR)string_manipulation/ft_substr.c $(SRCDIR)string_manipulation/ft_tolower.c $(SRCDIR)string_manipulation/ft_toupper.c $(SRCDIR)string_manipulation/ft_isavalidint.c \
			$(SRCDIR)string_manipulation/ft_strcmp.c \

OBJ		=	${SRC:.c=.o}

# Loading Bar declaration
TOTAL_FILES := $(words $(SRC))
COMPLETED_FILES = 0
BAR_WIDTH = 20
BLOCK_CHAR = █
EMPTY_CHAR = ░

GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
BLUE = \033[0;34m
RESET = \033[0m

all: $(NAME)

$(NAME): $(OBJ)
	@printf "\n${GREEN}⛏️  Crafting library...${RESET}\n"
	@$(ARCHIVE) $(OBJ)
	@printf "${GREEN}✅ Library created: $(NAME)${RESET}\n"

clean:
	@printf "${YELLOW}🗑️  Cleaning objects...${RESET}\n"
	@$(RM) $(OBJ)
	@printf "${GREEN}✅ Objects deleted${RESET}\n"

fclean: clean
	@printf "${YELLOW}🗑️  Removing library...${RESET}\n"
	@$(RM) $(NAME)
	@printf "${GREEN}✅ Library deleted${RESET}\n"

re: fclean all

# Function to calculate progress
define progress_bar
	$(eval COMPLETED_FILES=$(shell echo $$(($(COMPLETED_FILES)+1))))
	$(eval PERCENTAGE=$(shell echo $$(($(COMPLETED_FILES) * 100 / $(TOTAL_FILES)))))
	$(eval FILLED=$(shell echo $$(($(PERCENTAGE) * $(BAR_WIDTH) / 100))))
	$(eval EMPTY=$(shell echo $$(($(BAR_WIDTH) - $(FILLED)))))
	@printf "\r${BLUE}⛏️  Mining... [${GREEN}"
	@for i in `seq 1 $(FILLED)`; do printf "$(BLOCK_CHAR)"; done
	@printf "${BLUE}"
	@for i in `seq 1 $(EMPTY)`; do printf "$(EMPTY_CHAR)"; done
	@printf "${BLUE}] %3d%% (%d/%d)${RESET}" $(PERCENTAGE) $(COMPLETED_FILES) $(TOTAL_FILES)
endef

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@
	$(call progress_bar)

.PHONY: all clean fclean re
