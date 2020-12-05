; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 05.12.2020
; Macros
; ==========================================================

.include "src/include/constants.s"

; ----------------------------------------------------------
; Set the border color using a hexadecimal value between $00 - $FF
; The X-register is a 8-bit-register with a value between 0 - 255
; ----------------------------------------------------------
setBorderColor          .macro 
                        ldx #\1
                        stx BORDER_COLOR_REGISTER
                        .endm

setColorOnMemoryMap     .macro
                        ldx #\1
                        stx \2
                        .endm