; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 07.12.2020
; How to draw a character at a specific location on screen
; ==========================================================

.include "src/include/macros.s"

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

init    ldx #$00
        stx $d020               ; Border color register
        stx $d021               ; Background color

clear   lda #$20                ; spacebar screen code
        sta $0400,x             ; fill four areas of screen with 256 spacebar characters
        sta $0500,x
        sta $0600,x
        sta $06e8,x
        lda #$00                ; set foreground to black in Color Ram 
        sta $d800,x
        sta $d900,x
        sta $da00,x
        sta $dae8,x
        inx
        bne clear

draw    #drawCharacterAt $51,$D,$06,$F  ; draw first character
        #drawCharacterAt $58,$E,$06,$E  ; draw second character
        #drawCharacterAt $5A,$F,$06,$D  ; draw third character
        rts
