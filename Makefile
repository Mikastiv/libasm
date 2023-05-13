NAME	= libasm.a
OBJ_DIR	= obj

SRC		= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BSRC	= ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s
OFILES	= $(SRC:.s=.o)
BOFILES	= $(BSRC:.s=.o)
OBJ		= $(addprefix $(OBJ_DIR)/, $(OFILES))
BOBJ	= $(addprefix $(OBJ_DIR)/, $(BOFILES))


$(OBJ_DIR)/%.o: %.s
		nasm -felf64 -g -F dwarf -i /usr/include $< -o $@

all:	$(NAME)

$(NAME): $(OBJ_DIR) $(OBJ)
		ar rcs $(NAME) $(OBJ)

bonus: $(OBJ_DIR) $(OBJ) $(BOBJ)
		ar rcs $(NAME) $(OBJ) $(BOBJ)

$(OBJ_DIR):
		mkdir -p $(OBJ_DIR)

clean:
		rm -rf $(OBJ) $(BOBJ)

fclean:	clean
		rm -rf $(NAME)

re:		fclean all
