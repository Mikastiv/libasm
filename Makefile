NAME	= libasm.a
OBJ_DIR	= obj

SRC		= ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_write.asm ft_read.asm ft_strdup.asm ft_atoi_base.asm ft_list_push_front.asm
BSRC	= ft_atoi_base.asm ft_list_push_front.asm
OFILES	= $(SRC:.asm=.o)
OBJ		= $(addprefix $(OBJ_DIR)/, $(OFILES))


$(OBJ_DIR)/%.o: %.asm
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
