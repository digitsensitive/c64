; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com
; Macros
; ==========================================================

poke                    .macro    
                        lda #\2
                        sta \1
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