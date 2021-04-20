; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 05.12.2020
; Macros
; ==========================================================

; ----------------------------------------------------------
; Set the border color using a hexadecimal value between $00 - $FF
; The X-register is a 8-bit-register with a value between 0 - 255
; ----------------------------------------------------------
setBorderColor          .macro 
                        ldx #\1
                        stx $D020           ; BORDER_COLOR_REGISTER: 53280
                        .endm

setColorOnMemoryMap     .macro
                        ldx #\1
                        stx \2
                        .endm

; ----------------------------------------------------------
; Draw a character on the screen
; ----------------------------------------------------------
drawCharacterAt         .macro
                        ldx #\3*40+\2       ; calculate position from x and y
                        lda #\1             ; load the character
                        sta $0400,x         ; set the character at location
                        lda #\4             ; set color
                        sta $d800,x         ; set foreground color at location
                        .endm