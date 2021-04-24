; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com
; How to select a color from an include file
; ==========================================================

.include "src/include/constants.asm"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

border = $d020

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

loop    lda #BLUE
        sta border
        jmp loop