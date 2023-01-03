; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com;
; C64 User's Guide - Getting Started: Print Addition
;
; This example shows how to perform addition in assembly language.
; In this example we perform addition of two 8-bit numbers.
; The result is  stored in an 16-bit number.
; So the maximum number is 65535 (a total of 65536 values, 0-65535).
; Adding 1 to 65535 will wrap to zero.
;
; Here is the example in BASIC:
; PRINT 2+2
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

clhome  lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen
        
; main loop

loop    jsr add
        jsr print

; perform addition (Info: 256 * high_byte + low_byte)

add     clc             ; always clear carry before addition
        lda num1        ; load number 1
        adc num2        ; add number 2 to number 1
        sta result      ; store low-byte
        lda result+1    ; load high-byte
        adc #$00        ; add carry
        sta result+1    ; store high-byte
        rts

; print result to screen using LINPRT routine

print   ldx result
        lda result+1
        jsr $bdcd
        rts

; data

num1    .byte $01         ; 8-bit number
num2    .byte $03         ; 8-bit number
result  .byte $00,$00     ; 16-bit number