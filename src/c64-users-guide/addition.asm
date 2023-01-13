; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print Addition
;
; This example shows how to perform addition in assembly language.
; In this example we perform addition of two 8-bit numbers.
; The result is also stored in an 8-bit number.
; So the maximum number is 255 (a total of 256 values, 0-255).
; Adding 1 to 255 will wrap to zero.
;
; Remember:
; * There is no way to add without carry
; * Decide if binary or decimal mode: In this example we use
;   the binary mode, so you should clear the decimal mode bit/flag with
;   the instruction 'cld' before doing any addition
;
; Example in BASIC:
; PRINT 2+2
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
        lda op1         ; load operand 1 in accumulator
        adc op2         ; add operand 2 to operand 1
        sta res         ; store result at address res
        rts

; print result to screen using LINPRT routine

print   ldx res
        lda #$00
        jsr $bdcd
        rts

; data

op1     .byte $FD       ; 8-bit number
op2     .byte $02       ; 8-bit number
res     .byte $00       ; 8-bit number