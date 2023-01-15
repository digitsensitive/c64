; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print Subtraction
;
; This example shows how to perform subtraction in assembly language.
; In this example we perform subtraction of two 16-bit numbers.
; The result is stored in an 16-bit number.
; So the maximum number is 65535 (a total of 65536 values, 0-65535).
; Subtracting 1 to 0 will wrap to 65535.
;
; Remember:
; * SEC means "set carry to 1", which indicates a "no-borrow" condition
; * There is no way to subtract without the carry which works as an inverse
;   borrow. i.e, to subtract you set the carry before the operation.
;   If the carry is cleared by the operation, it indicates a borrow occurred.
; * Decide if binary or decimal mode: In this example we use
;   the binary mode, so you should clear the decimal mode bit/flag with
;   the instruction 'cld' before doing any subtraction
;
; Example in BASIC:
; PRINT 10-2
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

cls     lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen

; main loop

loop    jsr sub
        jsr print


; perform subtraction

sub     sec             ; set carry bit to 1
        cld             ; clear decimal bit
        lda op1         ; load operand 1 (lo-byte) in accumulator
        sbc op2         ; sub lo-byte of operand 2 from lo-byte of operand 1
        sta res         ; store result at address res (lo-byte of result)
        lda op1+1       ; load operand 1 (hi-byte) in accumulator
        sbc op2+1       ; sub hi-byte of operand 2 from hi-byte of operand 1
        sta res+1       ; store result at address res+1 (hi-byte of result)
        rts

; print result to screen using LINPRT routine

print   ldx res
        lda res+1
        jsr $bdcd
        rts

; data

op1     .byte $0a,$00   ; 16-bit number
op2     .byte $02,$00   ; 16-bit number
res     .byte $00,$00   ; 16-bit number