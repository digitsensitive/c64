; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print Addition
;
; This example shows how to perform addition in assembly language.
; In this example we perform addition of two 8-bit numbers.
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
; PRINT 1+3
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

cls     lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen
        
; main loop

loop    jsr add
        jsr print

; perform addition (Info: 256 * high_byte + low_byte)

add     clc             ; clear carry bit
        cld             ; clear decimal bit
        lda op1         ; load operand 1 in accumulator
        adc op2         ; add operand 2 to operand 1
        sta res         ; store result at address res (lo-byte of result)
        lda res+1       ; load res+1 (hi-byte of result)
        adc #$00        ; add carry
        sta res+1       ; store result at address res+1 (hi-byte of result)
        rts

; print result to screen using LINPRT routine

print   ldx res
        lda res+1
        jsr $bdcd
        rts

; data

op1     .byte $01       ; 8-bit number
op2     .byte $03       ; 8-bit number
res     .byte $00,$00   ; 16-bit number