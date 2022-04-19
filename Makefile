NAME	= libasm.a
OBJ_DIR	= obj

SRC		= ft_strlen.s
OFILES	= $(SRC:.s=.o)
OBJ		= $(addprefix $(OBJ_DIR)/, $(OFILES))


$(OBJ_DIR)/%.o: %.s
		nasm -felf64 $< -o $@

all:	$(NAME)

$(NAME): $(OBJ_DIR) $(OBJ)
		ar rcs $(NAME) $(OBJ)

$(OBJ_DIR):
		mkdir -p $(OBJ_DIR)

clean:
		rm -rf $(OBJ)

fclean:	clean
		rm -rf $(NAME)

re:		fclean all
