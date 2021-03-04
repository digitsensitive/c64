; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 05.12.2020
; How to set the color on the memory map
; ==========================================================

.include "src/include/constants.s"
.include "src/include/macros.s"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

border = $d020

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

init    #setBorderColor CYAN
        #setColorOnMemoryMap GREEN,COLOR_MEMORY_MAP
        #setColorOnMemoryMap YELLOW,COLOR_MEMORY_MAP+1
        lda #$04                ; D
        sta SCREEN_MEMORY
        lda #$05                ; E
        sta SCREEN_MEMORY+1
        jmp loop

loop    jmp loop