; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print BCD Addition
;
; This example shows how to perform BCD addition in assembly language.
; In this example we perform BCD addition of two 8-bit numbers.
; The result is also stored in an 8-bit number.
; So the maximum number is 99 (a total of 100 values, 0-99).
; Adding 1 to 99 will wrap to zero.
;
; Remember:
; * Whenever the sum of two binary digits is greater than "9"
;   you must add "6" to the result to skip over the unused 6 codes
;
; Example in BASIC:
; PRINT 50+1
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
        lda op1         ; load operand 1 in accumulator
        adc op2         ; add operand 2 to operand 1
        sta res         ; store result at address res
        cld             ; clear decimal mode
        rts

; print result to screen

print   ldx #1          ; screen offset start from right-most value
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

        rts

plotd   clc             ; plot digit 
        adc #48
        sta $0400,x
        dex
        rts

; data

op1     .byte $50       ; 8-bit number
op2     .byte $01       ; 8-bit number
res     .byte $00       ; 8-bit number, 2 digits between 0 - 9