# Makefile for compiling NSGA-II source code
CC=gcc
LD=gcc
RM=rm -f
CFLAGS=-Wall -g
# CFLAGS=-Wall -ansi -pedantic -g
OBJS:=$(patsubst %.c,%.o,$(wildcard *.c))
MAIN=nsga2r
LIB=libNSGA2


$(LIB): CC=g++

all:$(MAIN)
$(MAIN):$(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o Build/$(MAIN) -lm
%.o: %.c nsga2.h rand.h
	$(CC) $(CFLAGS)  -c $<
clean:
	$(RM) $(OBJS)

$(LIB):	$(OBJS)
	ar rcs Build/$(LIB).a $(OBJS)
