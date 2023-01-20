; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print BCD Addition
;
; This example shows how to perform BCD addition in assembly language.
; In this example we perform BCD addition of two 16-bit numbers.
; The result is also stored in an 16-bit number.
; So the maximum number is 9999 (a total of 10000 values, 0-9999).
; Adding 1 to 9999 will wrap to zero.
;
; Remember:
; * Whenever the sum of two binary digits is greater than "9"
;   you must add "6" to the result to skip over the unused 6 codes
;
; Example in BASIC:
; PRINT 80+30
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

cls     lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen

; main loop

loop    jsr add
        jsr print

; perform BCD addition

add     clc             ; clear carry bit
        sed             ; set decimal mode
        lda op1         ; load operand 1 (lo-byte) in accumulator
        adc op2         ; add operand 2 (lo-byte) to operand 1 (lo-byte)
        sta res         ; store result at address res (lo-byte of result)
        lda op1+1       ; load operand 1 (hi-byte) in accumulator
        adc op2+1       ; add operand 2 (hi-byte) to operand 1 (hi-byte)
                        ; carry is also added if one
        sta res+1       ; store result at address res+1 (hi-byte of result)
        cld             ; clear decimal mode
        rts

; print result to screen

print   ldx #3          ; screen offset start from right-most value
        ldy #0          ; score byte index

loop1   lda res,y       ; lo-nibble
        pha
        and #$0f        
        jsr plotd

        pla             ; hi-nibble
        lsr a 
        lsr a
        lsr a
        lsr a
        jsr plotd

        iny
        cpy #2
        bne loop1

        rts

plotd   clc             ; plot digit 
        adc #48
        sta $0400,x
        dex
        rts

; data

op1     .byte $80,$00   ; 16-bit number
op2     .byte $30,$00   ; 16-bit number
res     .byte $00,$00   ; 16-bit number, 4 digits between 0 - 9