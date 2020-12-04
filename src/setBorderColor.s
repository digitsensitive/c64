
; COMMODORE 64 - Examples in BASIC and Assembly
; Set the border color

; *** labels ***

border = $d020

; *** main ***

*=$02a8         ; sys 680

loop    lda #$03
        sta border
        jmp loop