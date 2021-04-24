; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com
; Snake
; ==========================================================

.include "src/include/constants.asm"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

; each sprite is 3 bytes wide with 21 lines = 63 bytes required for shape
; but it actually uses 64 bytes
; the value @ the pointer times 64 equals
; the starting location of the sprite shape data table
spr0ShapeData       = $0340                           ; = 13 * 64 = 832

; snake properties

; current direction (up = 1, down = 3, left = 5, right = 7)
currentDir          = 7


; up (1+2 byte), down (3+4 byte), left (5+6 byte), right (7+8 byte)
dirs                .byte $00,$02,$00,$01,$02,$00,$01,$00

; input keys
ENTER               = 13
KEY_W               = 87
KEY_A               = 65
KEY_S               = 83
KEY_D               = 68

; ----------------------------------------------------------
; Init and create sprite
; ----------------------------------------------------------

                *=$4000                         ; sys 16384

init            jsr $e544                       ; clear the screen
                            
                lda #%00001101                  ; use block 13 for sprite 0
                sta SPRITE_POINTERS
                lda #%00000001                  ; load accumulator with value 1
                sta SPRITE_ENABLE_REGISTER      ; enable sprite 0
                lda #CYAN                       ; use cyan for sprite 0
                sta SPRITE_0_COLOR_REGISTER     ; load cyan to color register 0

                ldx #0
                lda #0

build           lda spr0,x                      ; get byte from sprite0+x
                sta spr0ShapeData,x             ; store byte at spr0ShapeData+x
                inx
                cpx #63
                bne build

                ; set position
                lda #%00000000                  ; restrict horizontal position to 0-255
                sta MSIGX

                ; starting sprite location
                ldx #100
                ldy #70
                stx SP0X
                sty SP0Y

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

                
loop            jsr input
                jmp loop

            

; ----------------------------------------------------------
; Evaluate Input
; ----------------------------------------------------------

input           ; TODO: Is "lda $ff" a better alternative?
                jsr SCNKEY                      ; jump to scan keyboard
                jsr GETIN                       ; jump to get a character
                
                ; cmp (short for "CoMPare")
                ; compares contents of accumulator against the specified operand 
                cmp #KEY_W
                beq upKey
                cmp #KEY_S
                beq downKey
                cmp #KEY_A
                beq leftKey
                cmp #KEY_D
                beq rightKey
                cmp #ENTER
                beq end
                rts

upKey           ldy SP0Y
                dey 
                sty SP0Y
                rts

downKey         ldy SP0Y
                iny
                sty SP0Y
                rts

leftKey         ldx SP0X
                dex
                stx SP0X
                cpx #255
                rts
                lda #0
                sta MSIGX
                rts

rightKey        ldx SP0X
                inx
                stx SP0X
                rts

; ----------------------------------------------------------
; Clean up at the end
; ----------------------------------------------------------

end             jsr CLEAR
                lda #0
                sta SPRITE_ENABLE_REGISTER
                rts

; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

; snake sprite

spr0            .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
                .byte $FF, $FF, $FF
