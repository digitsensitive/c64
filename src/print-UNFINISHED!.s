; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 05.12.2020
; How to print a text
; ==========================================================

; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

sng     .text "Hello Commodore 64!"

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

        lda #$00
loop    pha                     ; push accumulator on stack
        lda #<sng               ; load low byte of string
        ldy #>sng               ; load high byte of string
        jsr $ab1e               ; print str; destroys register values!
        pla             ; pull a from the stack
        clc             ; clear carry
        adc #$01        ; a += $01
        cmp 4           ; a == count ?
        bne loop        ; not equal -> jump to loop
        rts
