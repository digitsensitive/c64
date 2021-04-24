; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com
; How to print a text
; ==========================================================

; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

        *=$02a7                 ; sys 679

init    ldx #$01
        stx $d020               ; Border color register
        ldx #$00
        stx $d021               ; Background color

clear   lda #$20                ; spacebar screen code
        sta $0400,x             ; fill four areas of screen with 256 spacebar characters
        sta $0500,x
        sta $0600,x
        sta $06e8,x
        lda #$01                ; set foreground to white in Color Ram 
        sta $d800,x
        sta $d900,x
        sta $da00,x
        sta $dae8,x
        inx
        bne clear               ; bne = branch on not equal
                                ; did x turn to zero already? 
                                ; if yes -> stop loop
                                ; if no -> continue loop

        ldx #$00
text    lda hello,x             ; take byte by byte
        and #$3f                ; convert to uppercase
        sta $05BF,x             ; store byte to screen area
        inx
        cpx #26                 ; check for end of the string data table
        bne text

loop    jmp loop                ; endless stupid loop

; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

; .text is a pseudo-ops and one standard way to make a string data table
; It takes a quoted string and converts it into a span of bytes
; Characters are converted from ASCII to PETSCII
hello   .text "Hello wonderful C64 world!"