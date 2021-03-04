sourceDir := src
SRCS = $(wildcard $(sourceDir)/**/*.s)

TMPX := usr/local/bin/tmpx

all: $(SRCS:.s=.prg)

%.prg : %.s
	TMPX -i $< -o $@

clean:
	rm -f $(sourceDir)/**/*.prg