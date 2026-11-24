CC=gcc
CFLAGS=-Wall -Wextra -Wshadow -g -std=c99 $(shell sdl2-config --cflags)

TARGET=./build/bin

SRCS=$(shell find . -name "*.c")
OBJS=$(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
	find . -name "*.o" -delete

%.c: %.o
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	find . -name "*.o" -delete
	rm -f $(TARGET)


