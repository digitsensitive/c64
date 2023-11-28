# Set the path of the current directory
currentDirectory = $(abspath .)

# Get all the *.asm files
asmFiles = $(wildcard $(currentDirectory)/src/**/*.asm)

# Set path of Turbo Macro Pro Cross Assembler (TMPx) and C64 emulator (x64sc)
# depending on the current OS
ifeq ($(OS),Windows_NT)
	TMPX = $(currentDirectory)/vendors/tmpx/TMPx.exe
    X64SC := C:\VICE\x64sc.exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
		TMPX = $(currentDirectory)/vendors/tmpx/tmpx 
        X64SC := /Applications/VICE/x64sc.app/Contents/MacOS/x64sc
    endif
    ifeq ($(UNAME_S),Darwin)
		TMPX = $(currentDirectory)/vendors/tmpx/tmpx 
        X64SC := /Applications/VICE/x64sc.app/Contents/MacOS/x64sc
    endif
endif

# Convert all *.asm files to *.prg files
convert: $(asmFiles:.asm=.prg)

%.prg : %.asm
	$(TMPX) -i $< -o $@

# Load specific program into C64 emulator (x64sc)
load:
	$(X64SC) $(currentDirectory)/src/${name}

# Remove all *.prg files in the src directory
clean:
	rm -f $(currentDirectory)/src/**/*.prg