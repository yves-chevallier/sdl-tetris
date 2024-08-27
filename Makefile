CC=gcc
CFLAGS=-std=c17 -O3 -Wall -Werror -pedantic `sdl2-config --cflags` -O3 --std=c99
LDFLAGS=`sdl2-config --libs` -lm -lSDL2_ttf
EXEC=main
SRCS=$(wildcard src/*.c)
OBJS=$(SRCS:.c=.o)

all: $(EXEC)

-include $(OBJS:.o=.d)

$(EXEC): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS) -MMD -MP

clean:
	$(RM) -f $(OBJS) $(EXEC) $(OBJS:.o=.d)

.PHONY: all clean
