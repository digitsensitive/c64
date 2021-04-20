sourceDir := src
SRCS = $(wildcard $(sourceDir)/**/*.asm)

TMPX := usr/local/bin/tmpx

all: $(SRCS:.asm=.prg)

%.prg : %.asm
	TMPX -i $< -o $@

clean:
	rm -f $(sourceDir)/**/*.prg