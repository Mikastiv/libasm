NAME	= libasm.a
OBJ_DIR	= obj

SRC		= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BSRC	= ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s
OFILES	= $(SRC:.s=.o)
BOFILES	= $(BSRC:.s=.o)
OBJ		= $(addprefix $(OBJ_DIR)/, $(OFILES))
BOBJ	= $(addprefix $(OBJ_DIR)/, $(BOFILES))

OS		= $(shell uname -s)

ifeq ($(OS),Linux)
    FLAGS = -felf64
	SRC_FOLDER = linux
else ifeq ($(OS),Darwin)
    FLAGS = -fmacho64
	SRC_FOLDER = mac
else
    $(error Unsupported OS: $(OS))
endif

$(OBJ_DIR)/%.o: $(SRC_FOLDER)/%.s
		nasm $(FLAGS) -g -F dwarf -i /usr/include $< -o $@

all:	$(NAME)

build:	all
	clang -g main.c -L. -lasm

build_bonus:	bonus
	clang -DBONUS -g main.c -L. -lasm

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

.PHONY: all bonus clean fclean re build build_bonus
