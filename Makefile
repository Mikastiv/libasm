NAME	= libasm.a
OBJ_DIR	= obj

SRC		= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s ft_atoi_base.s ft_list_push_front.s ft_list_size.s
BSRC	= ft_atoi_base.s ft_list_push_front.s
OFILES	= $(SRC:.s=.o)
OBJ		= $(addprefix $(OBJ_DIR)/, $(OFILES))


$(OBJ_DIR)/%.o: %.s
		nasm -felf64 -g -F dwarf -i /usr/include $< -o $@

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
