TARGET = tracker.exe
SRC = $(wildcard *.d)
SUFFIX = .obj
NAME = $(shell uname -s)
CC = dmd
FLAGS = -wi -O -c
# FLAGS = -g -c

ifeq ($(NAME), Linux)
	SUFFIX = .o
	TARGET = tracker
endif

OBJ = $(SRC:.d=$(SUFFIX))

%$(SUFFIX) : %.d
	$(CC) $(FLAGS) $^

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -O -of=$(TARGET)

all: $(TARGET)

clean:
	rm -f $(OBJ)

re: clean all