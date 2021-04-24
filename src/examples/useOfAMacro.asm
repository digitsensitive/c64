; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com
; How to use a macro
; ==========================================================

.include "src/include/constants.asm"
.include "src/include/macros-general.asm"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

border = $d020

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

loop    #poke BORDER_COLOR_REGISTER,RED
        jmp loop