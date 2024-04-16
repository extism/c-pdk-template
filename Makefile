SRC=src/plugin.c
OBJ=$(SRC:.c=.o)
CC?=clang
CFLAGS=-target wasm32-unknown-unknown -nostdlib
LDFLAGS=-Wl,--no-entry -mexec-model=reactor

plugin: $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,--export=hello $(OBJ) -o plugin.wasm

test:
	extism call plugin.wasm hello

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
