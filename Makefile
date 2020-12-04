sourceDir := src
prgDir := bin
TMPX := usr/local/bin/tmpx

build:
	TMPX -i $(sourceDir)/setBorderColor.s -o $(prgDir)/setBorderColor.prg

clean:
	rm -f $(prgDir)/*.prg