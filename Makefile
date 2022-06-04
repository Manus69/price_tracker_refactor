TARGET = tracker
SRC = $(wildcard *.d)
SUFFIX = .obj
NAME := $(shell uname -s)
CC = dmd
FLAGS = -wi -O -c

ifeq ($(NAME), Linux)
	SUFFIX = .o
endif

OBJ = $(SRC:.d=$(SUFFIX))

%$(SUFFIX) : %.d
	$(CC) $(FLAGS) $^

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -of=$(TARGET)

all: $(TARGET)

clean:
	rm -f $(OBJ)

re: clean all