NAME = ft_irc

CC = c++
CFLAGS = -I./include -I./include/cmds -I./include/server -I./include/utils -Wall -Wextra -Werror -g3 -std=c++98

RM = rm -rf

SRC_DIR = .
OBJ_DIR = obj

SRCS =	srcs/main.cpp \
		srcs/server/Channel.cpp \
		srcs/server/Client.cpp \
		srcs/server/Exception.cpp \
		srcs/server/Operation.cpp \
		srcs/server/Parsing.cpp \
		srcs/server/Server.cpp \
		srcs/cmds/ACommand.cpp \
		srcs/utils/utils.cpp \
		# srcs/cmds/Bot.cpp \
		# srcs/cmds/Join.cpp \
		# srcs/cmds/Kick.cpp \
		# srcs/cmds/Nick.cpp \
		# srcs/cmds/Notice.cpp \
		# srcs/cmds/Part.cpp \
		# srcs/cmds/Pass.cpp \
		# srcs/cmds/Ping.cpp \
		# srcs/cmds/Prvmsg.cpp \
		# srcs/cmds/Quit.cpp \
		# srcs/cmds/User.cpp \


OBJS = $(SRCS:%.c=$(OBJ_DIR)/%.o)

GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
RESET = \033[0m
CHECKMARK = ✔

SRCS_DIR = ./srcs
DIR_CMDS = $(SRCS_DIR)/cmds
DIR_SERVER = $(SRCS_DIR)/server

all: $(NAME)

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJS)
	@echo "$(GREEN)$(CHECKMARK) $(NAME) created.$(RESET)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) -r $(OBJ_DIR)
	@echo "$(YELLOW)$(CHECKMARK) $(NAME) cleaned.$(RESET)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(RED)$(CHECKMARK) $(NAME) removed.$(RESET)"

re: fclean all

.PHONY: all clean fclean re