; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 08.12.2020
; Decimal, Hexadecimal and Binary numbers
; ==========================================================

; ----------------------------------------------------------
; A binary number is preceded by a percent sign (%)
; Immediate addressing can be identified by the Hashpount (#)
; The dollar sign ($) tells the assembler, that the number is in Hexadecimal.
; Example:
; The number 6 can be written as follows:
; #6 = #$6 = #$06 = #%0110
; ----------------------------------------------------------

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

; In this example we will display four times the letter "F"
init    lda #6                  ; decimal
        sta $0400
        lda #$6                 ; hexadecimal
        sta $0401
        lda #$06                ; hexadecimal
        sta $0402
        lda #%0110              ; binary
        sta $0403
        rts