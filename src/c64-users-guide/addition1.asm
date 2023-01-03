; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com;
; C64 User's Guide - Getting Started: Print Addition
;
; This example shows how to perform addition in assembly language.
;
; Here is the example in BASIC:
; PRINT 2+2
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

        lda #147
        jsr $ffd2
        
; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

loop    jsr add
        jsr print

; ----------------------------------------------------------
; Addition
; Remember: 256 * high_byte + low_byte
; ----------------------------------------------------------

add     clc             ; always clear carry before addition
        lda num1        ; load number 1 (decimal 8)
        adc num2        ; add number 2 (decimal 2)
        sta result      ; store low-byte
        lda result+1    ; load high-byte
        adc #$00        ; add carry
        sta result+1    ; store high-byte
        rts

; ----------------------------------------------------------
; Print
; ----------------------------------------------------------

print   ldx result
        lda result+1
        jsr $bdcd
        rts

num1    .byte $02         ; 8-bit number
num2    .byte $02         ; 8-bit number
result  .byte 0,0         ; 16-bit number