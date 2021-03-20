CC      = gcc

#CFLAGS  = -Wall -Wextra -Werror -ansi -pedantic -std=c99 -O3 -D_XOPEN_SOURCE=700 -g
CFLAGS  = -Wall -Wextra -ansi -pedantic -std=c99 -O3 -D_XOPEN_SOURCE=700 -g
LDFLAGS = -lm -lpthread -O3 
TARGETS = rtgen rtcrack

all: $(TARGETS)

rt%: rt%.o sm3.o md5.o sha1.o sha256.o rtable.o hashselect.h
	@mkdir -p $(@D)
	$(CC) $(HASH)=1 $^ -o $@ $(LDFLAGS)

%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(HASH)=1 $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o

destroy: clean
	rm -f $(TARGETS) *.rt

rebuild: destroy all
