; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 13.12.2020
; How to move a sprite
; ==========================================================

.include "src/include/constants.s"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

; each sprite is 3 bytes wide with 21 lines = 63 bytes required for shape
; but it actually uses 64 bytes
; the value @ the pointer times 64 equals
; the starting location of the sprite shape data table
spr0ShapeData = $0340                           ; = 13 * 64 = 832

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
                jmp build

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
                jmp loop

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

                ; use of the kernal jump table
loop            jsr SCNKEY                      ; jump to scan keyboard
                jsr GETIN                       ; jump to get a character

; ----------------------------------------------------------
; Evaluate Input
; ----------------------------------------------------------

input           cmp #87                         ; W - up
                beq up
                cmp #83                         ; S - down
                beq down
                cmp #65                         ; A - left
                beq left
                cmp #68                         ; D - right
                beq right
                jmp loop

up              ldy SP0Y
                dey
                sty SP0Y
                jmp loop

down            ldy SP0Y
                iny
                sty SP0Y
                jmp loop

left            ldx SP0X
                dex
                stx SP0X
                jmp loop

right           ldx SP0X
                inx
                stx SP0X
                jmp loop

; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

spr0            .byte $00, $7F, $00
                .byte $01, $FF, $C0
                .byte $03, $FF, $E0
                .byte $03, $E3, $E0
                .byte $07, $D9, $F0
                .byte $07, $DF, $F0
                .byte $07, $D9, $F0
                .byte $03, $E7, $E0
                .byte $03, $FF, $E0
                .byte $03, $FF, $E0
                .byte $02, $FF, $A0
                .byte $01, $7F, $40
                .byte $01, $3E, $40
                .byte $00, $9C, $80
                .byte $00, $9C, $80
                .byte $00, $49, $00
                .byte $00, $49, $00
                .byte $00, $3E, $00
                .byte $00, $3E, $00
                .byte $00, $3E, $00
                .byte $00, $1C, $00
