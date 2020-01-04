# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: mjiam <mjiam@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2019/12/02 12:36:30 by mjiam          #+#    #+#                 #
#    Updated: 2020/01/04 13:52:48 by mjiam         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME 	= libftprintf.a

SRC 	= ft_printf.c conv_char.c conv_hex.c conv_num.c conv_string.c \
			parser.c printer.c setter.c \
			$(UTILS)/ftp_utils.c $(UTILS)/p_itoa.c $(UTILS)/u_itoa.c

# BONUS	= ft_printf_bonus.c conv_char_bonus.c conv_hex_bonus.c \
# 			conv_num_bonus.c conv_string_bonus.c \
# 			parser_bonus.c printer_bonus.c setter_bonus.c \

UTILS	= ./utils

SOBJ 	= $(SRC:.c=.o)

BOBJ	= $(BONUS:.c=.o)

HEADER	= libftprintf.h

CFLAGS 	= -Wall -Wextra -Werror

ifdef WITH_BONUS
OBJ 	= $(SOBJ) $(BOBJ)
else
OBJ 	= $(SOBJ)
endif

# COLORS
BLUE	= \x1b[34;01m
CYAN	= \x1b[36;01m
PINK	= \x1b[35;01m
GREEN	= \x1b[32;01m
WHITE	= \x1b[37;01m

# SYMBOLS
SPONGE 	= 🧽
BATH	= 🛁
TOILET	= 🚽
BOOKS	= 📚
BOOK1	= 📙
BOOK2	= 📓
FOLDER	= 📂

all: $(NAME)

$(NAME): $(OBJ)
	@echo "$(BOOKS) $(GREEN)Linking library $(BOOKS)"
	@ar rc $@ $^
	@ranlib $(NAME)

%.o: %.c $(HEADER)
	@echo "$(FOLDER) $(BLUE)Compiling: $<"
	@gcc $(CFLAGS) -o $@ -c $< -I$(HEADER)

# bonus:
# 	@echo "$(BOOK1) $(YELLOW)Linking bonus into library $(BOOK1)"
# 	@$(MAKE) WITH_BONUS=1 all

bonus:
	@echo "$(BOOK1) $(YELLOW)Linking bonus into library $(BOOK1)"
	@$(MAKE)

clean:
	@echo "$(SPONGE)  $(WHITE)Cleaning $(SPONGE)"
	@rm -f $(OBJ) $(BOBJ)

fclean: clean
	@echo "$(BATH) $(CYAN)Clean af $(BATH)"
	@rm -f $(NAME)

re:
	@echo "$(TOILET) $(PINK)Once more from the top $(TOILET)"
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
