# Set the path of the current directory
currentDirectory = $(abspath .)

# Get all the *.asm files
asmFiles = $(wildcard $(currentDirectory)/src/**/*.asm)

# Set path of Turbo Macro Pro Cross Assembler (TMPx)
TMPX = $(currentDirectory)/vendors/tmpx/tmpx 

# Set path of C64 emulator (x64sc)
X64SC := /Applications/VICE/x64sc.app/Contents/MacOS/x64sc

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