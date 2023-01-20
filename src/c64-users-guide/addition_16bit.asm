; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print Addition
;
; This example shows how to perform addition in assembly language.
; In this example we perform addition of two 16-bit numbers.
; The result is stored in an 16-bit number.
; So the maximum number is 65535 (a total of 65536 values, 0-65535).
; Adding 1 to 65535 will wrap to zero.
;
; Remember:
; * There is no way to add without carry
; * Decide if binary or decimal mode: In this example we use
;   the binary mode, so you should clear the decimal mode bit/flag with
;   the instruction 'cld' before doing any addition
;
; Example in BASIC:
; PRINT 255+5
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

cls     lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen
        
; main loop

loop    jsr add
        jsr print

; perform addition

add     clc             ; clear carry bit
        cld             ; clear decimal bit
        lda op1         ; load operand 1 (lo-byte) in accumulator
        adc op2         ; add lo-byte of operand 2 to lo-byte of operand 1
        sta res         ; store result at address res (lo-byte of result)
        lda op1+1       ; load operand 1 (hi-byte) in accumulator
        adc op2+1       ; add operand 2 (hi-byte) to operand 1 (hi-byte)
                        ; carry is also added if one
        sta res+1       ; store result at address res+1 (hi-byte of result)
        rts

; print result to screen using LINPRT routine

print   ldx res
        lda res+1
        jsr $bdcd
        rts

; data

op1     .byte $FF,$00   ; 16-bit number
op2     .byte $05,$00   ; 16-bit number
res     .byte $00,$00   ; 16-bit number