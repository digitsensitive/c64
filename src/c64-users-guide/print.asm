; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com;
; C64 User's Guide - Getting Started: Print
;
; This example shows how text can be printed in assembly language.
;
; Here is the example in BASIC:
; PRINT "COMMODORE 64"
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; ----------------------------------------------------------
; Load string
; ----------------------------------------------------------

        ldx #$00        ; set x to zero
ldstr   lda str,x       ; take byte by byteee
        cmp #$00        ; check for delimeter
        beq main        ; branch to main if delimeter reached
        and #$3f        ; convert to uppercase
        sta $400,x      ; store byte to screen area
        inx             ; increase x
        jmp ldstr       ; redo loop

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

main    rts

; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

str     .text "COMMODORE 64"    ; our string
        .byte $00               ; set our delimeter to zero
