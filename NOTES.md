# NOTES

## Instruction Types

- Data Transfer Instructions: LDA, STA, ...
- Arithmetic Instructions: ADC, SBC, ...
- Status Manipulation or Control Instructions: CLC, SEC, ...

## Addressing

13 paths to success - the 6510 addressing modes
https://dustlayer.com/cpu-6510-articles/2013/5/23/whatever-you-like-coming-to-addressing-modes

### Immediate Addressing

Used to work with a value rather than a memory location, e.g. if you want to
load the decimal value 15 into the accumulator you would use LDA #$0F.
Immediate Addressing can be identified by the Hashpount (#).
Whenever you use this Prefix you always deal with the actual value but not
with a Memory Location.

```assembly
lda #$40  ; load Accumulator with the Value #$40 (Decimal 64)
```

### Relative Addressing

Is a mode used by Branch instructions like BNE, BEQ etc.
They work with a signed 8-Bit long offset, that means that Bit#7
is used to indiciate whether the offset value is negative or positive.
When Bit#7 is set, the value is considered to be negative.
In your day-to-day programming you often use Branch instructions with labels so
the assembler takes care of calculating the offset to the target label of your
branch instruction.

Just keep in mind that the maximum range you can branch in your code is 127
instructions forward or 128 backwards. Branch instructions are faster than the
JMP instruction so avoid using JMP in favor of Branching if possible.

```assembly
; Example 1

            ldx #$00        ; load X Register via immediate addressing
move_ship   dec $d000       ; decrease x-Coordinate of Sprite#0 via absolute addressing
            inx             ; increase X Register via implied addressing
            bne move_ship   ; branch to move_ship via relative addressing if X is not zero

; Example 2
lda #$f9       ; specify a Raster Line (249) via immediate Addressing
cmp $d012      ; check $d012 if Raster Line has been reached yet
bne *-3        ; branch back 3 bytes until Raster Line matches via relative addressing
```

### Absolute Addressing
Use a full 16-Bit address to reference to a target memory location.

```assembly
lda $d020   ; load current border color via absolute addressing
sta $d021   ; store color information in background color register via absolute addressing
```

## Binary system

The binary numeral system uses the number 2 as its base (radix).
As a base-2 numeral system, it consists of only two numbers: 0 and 1.

## Hexadecimal system

The hexadecimal system (shortly hex), uses the number 16 as its base (radix).
As a base-16 numeral system, it uses 16 symbols.
These are the 10 decimal digits (0, 1, 2, 3, 4, 5, 6, 7, 8, 9) and the first
six letters of the English alphabet (A, B, C, D, E, F).
The letters are used because of the need to represent the values
10, 11, 12, 13, 14 and 15 each in one single symbol.

## How many possible states can be saved in a bit

1 Bit = 2^1 = 2 possibilities

| Hex Value | Binary Value |
| --------- | ------------ |
| 0         | 0            |
| 1         | 1            |

4 Bit = 2^4 = 2 x 2 x 2 x 2 = 16

| Hex Value | Binary Value |
| --------- | ------------ |
| 0         | 0000         |
| 1         | 0001         |
| 2         | 0010         |
| 3         | 0011         |
| 4         | 0100         |
| 5         | 0101         |
| 6         | 0110         |
| 7         | 0111         |
| 8         | 1000         |
| 9         | 1001         |
| A         | 1010         |
| B         | 1011         |
| C         | 1100         |
| D         | 1101         |
| E         | 1110         |
| F         | 1111         |

1 Byte = 8 Bit = 2^8 = 2 x 2 x 2 x 2 x 2 x 2 x 2 x 2 = 256

## Memory locations

Every memory location can have a value between 0-255, so 256 possibilites.
Every memory location is one byte.
