NAME = get_next_line.a

FLAGS = -c -Wall -Wextra -Werror

SRCS = get_next_line.c get_next_line_utils.c
SRCS_BONUS = get_next_line_bonus.c get_next_line_utils_bonus.c
ALL_SRCS = $(SRCS)
OBJ = $(ALL_SRCS:.c=.o)
OBJS = $(addprefix objs/, $(OBJ))
INC = ./get_next_line.h

ALL_SRCS_BONUS = $(SRCS) $(SRCS_BONUS)
OBJ_BONUS = $(ALL_SRCS_BONUS:.c=.o)
OBJS_BONUS = $(addprefix objs/, $(OBJ_BONUS))

all: $(NAME)

$(NAME): objs $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)
	echo "                 compilation de get_next_line.a OK"

objs:
	mkdir -p objs

objs/%.o: %.c
	echo "\n<------------------LIBFTPRINTF------------------>\n"
	cc $(FLAGS) -I $(INC) -o $@ -c $<
	echo "                 compilation des .c en .o OK"

bonus: objs $(OBJS_BONUS)
	ar rc $(NAME) $(OBJS_BONUS)
	ranlib $(NAME)
	echo "                 compilation de get_next_line.a (avec bonus) OK"

norme:
	echo "\n<------------------Norminette------------------>\n"
	norminette $(SRCS)
	norminette -R CheckDefine $(INC)
	echo "\n               NORMINETTE OK"

clean:
	rm -rf ./objs
	echo "\n<------------------Folder Clean------------------>\n"
	echo "                 Fichiers objets SUPPRIME"

fclean: clean
	rm -f $(NAME)
	echo "                 $(NAME) SUPPRIME"

re: fclean all

.PHONY: clean fclean re all bonus