# Makefile for compiling NSGA-II source code
CC=gcc
LD=gcc
RM=rm -f
CFLAGS=-Wall -g
# CFLAGS=-Wall -ansi -pedantic -g
OBJS:=$(patsubst %.c,%.o,$(wildcard *.c))
EXE=nsga2r
LIB=libNSGA2


$(LIB): CC=g++

all: $(EXE)

$(EXE): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o build/$(EXE) -lm
%.o: %.c nsga2.h rand.h
	$(CC) $(CFLAGS)  -c $<
$(LIB):	$(OBJS)
	ar rcs build/$(LIB).a $(OBJS)
clean:
	$(RM) $(OBJS)
rebuild: clean all
