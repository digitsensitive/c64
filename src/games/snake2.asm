; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com;
; A Snake Clone
; Version 0.1
; ==========================================================

        *=$c000         ; sys 49152 [up to $cfff (53247), 4000 bytes]

; ----------------------------------------------------------
; Init
; ----------------------------------------------------------

init    ; Set border and background color to black
        ldx #$00                
        stx $d020               ; Border color register
        stx $d021               ; Background color

        jsr cls                 ; clear screen
        ; TODO: add_new_food
        
; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

loop    ; TODO: check input
        lda #100
delay   cmp $d012
        bne delay

        inc $d020

        ; --------------
        ; update timer
        lda #$00
        clc             
        adc #$01
        sta time

        ; update score
        clc     
        lda score
        adc #1
        sta score
        bcc ahead1
        inc score+1
ahead1
        ; Move cursor to upper left-hand corner
        lda #19                 ; CLR HOME
        jsr $ffd2               ; Send char in accumulator screen

        jsr update
        jsr draw
        ; --------------

        dec $d020

        jmp loop


; ----------------------------------------------------------
; Input
; ----------------------------------------------------------

input   ; TODO: Input
        rts

; ----------------------------------------------------------
; Update
; ----------------------------------------------------------

update  ; TODO: Update
        rts

; ----------------------------------------------------------
; Draw
; ----------------------------------------------------------

draw    ; TODO: Draw Food
        ; TODO: Draw Snake
        jsr dscore
        ; TODO: Draw version of Game
        rts

; ----------------------------------------------------------
; Clear Screen
; ----------------------------------------------------------

cls     lda #$20                ; spacebar screen code
        sta $0400,x             ; area 1: fill with 256 spacebar characters
        sta $0500,x             ; area 2: fill with 256 spacebar characters
        sta $0600,x             ; area 3: fill with 256 spacebar characters
        sta $06e8,x             ; area 4: fill with 256 spacebar characters
        lda #$00                ; set foreground to black in color ram
        sta $d800,x
        sta $d900,x
        sta $da00,x
        sta $dae8,x
        inx
        bne cls                 ; bne = branch on not equal
                                ; did x turn to zero already? 
                                ; if yes -> stop loop
                                ; if no -> continue loop
        rts

; ----------------------------------------------------------
; Draw Score
; ----------------------------------------------------------

dscore  ldx score
        lda score+1
        jsr $bdcd
        rts

; ----------------------------------------------------------
; Data and Variables
; ----------------------------------------------------------

time    .byte 0,0
score   .byte 0,0