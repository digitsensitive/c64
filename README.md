# COMMODORE 64 - Examples in 6502 Assembly language

<img width=100% src="images/c64Logo.png">

## Installation

1. Allow `tmpx` to be executed as program: `sudo chmod +x PATH/tmpx`
2. Compile all `*.asm` files to `*.prg` files in `src` with `make convert`
3. Load specific `*.prg` into C64 Emulator with `make load name={PATH_TO_PROGRAM_NAME}` (f.e. PATH_TO_PROGRAM_NAME = examples/printString.prg)
4. Delete all `*.prg` files in `src` with `make clean`

## Tools

### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com) is a streamlined code editor with support for development operations like debugging, task running, and version control.
It aims to provide just the tools a developer needs for a quick code-build-debug
cycle and leaves more complex workflows to fuller featured IDEs, such as Visual Studio IDE.

#### Extensions

- [Retro Assembler](https://marketplace.visualstudio.com/items?itemName=EngineDesigns.retroassembler)

### Turbo Macro Pro Cross Assembler (TMPx)

[TMPx](http://turbo.style64.org) (pronounced "T-M-P cross") is the multiplatform cross assembler version of Turbo Macro Pro, itself derived from the famous Turbo Assembler series for the
native C64. TMPx was the first cross assembler released with full support for the
syntax of Turbo Macro Pro (i.e. same as the original Turbo Assembler Macro).

### C1541

[C1541](https://vice-emu.sourceforge.io/vice_14.html) is a stand-alone disk image maintenance utility.
This tool is installed together with VICE.

#### Documentation

- [Syntax Documentation](http://turbo.style64.org/docs/turbo-macro-pro-tmpx-syntax)

### VICE

[VICE](https://vice-emu.sourceforge.io) is a program that runs on a Unix,
MS-DOS, Win32, OS/2, BeOS, QNX 4.x, QNX 6.x, Amiga, Syllable or Mac OS X machine
and executes programs intended for the old 8-bit computers.
The current version emulates the C64, the C64DTV, the C128, the VIC20,
practically all PET models, the PLUS4 and the CBM-II (aka C610/C510).
An extra emulator is provided for C64 expanded with the CMD SuperCPU.

## Interesting readings

- [6502 opcodes](http://www.6502.org/tutorials/6502opcodes.html)
- [C64 Memory Map](http://sta.c64.org/cbm64mem.html)
- [C64 User's Guide Examples in Machine Language](https://github.com/lacerto/c64_users_guide_examples)
- [Codebase 64](https://codebase64.org/doku.php?id=start)
- [Commodore 64 Architecture by Jim Butterfield](https://www.atarimagazines.com/compute/issue32/112_1_COMMODORE_64_ARCHITECTURE.php)
- [Compute! Magazine Archive](https://archive.org/details/compute-magazine)
- [Dustlayer Tutorials](https://dustlayer.com/tutorials)
- [Guide to the 6502 Assembly language](https://en.wikibooks.org/wiki/6502_Assembly)
- [The almost completely commented C64 ROM disassembly, Lee Davison](https://skoolkid.github.io/sk6502/c64rom/index.html)

## Tools

- [Spritemate](https://www.spritemate.com)
- [PETSCII Editor](http://petscii.krissz.hu)

## Buy me a coffee

Whether you use this project, have learned something from it, or just like it, please consider supporting it by [buying me a coffee](https://www.buymeacoffee.com/JZDVjsT26).

## License

[MIT License](https://opensource.org/licenses/mit-license.php)

Copyright (c) 2020 - 2023 digitsensitive <digit.sensitivee@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
