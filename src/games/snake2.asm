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
        jsr uscore
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
        lda #$01                ; set foreground to white in color ram
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
; Update Score
; ----------------------------------------------------------

uscore  sed ; set decimal mode

        clc     
        lda score
        adc #$10
        sta score
        lda score+1
        adc #$00
        sta score+1
        lda score+2
        adc #$00
        sta score+2

        cld ; clear decimal mode

; ----------------------------------------------------------
; Draw Score
; ----------------------------------------------------------

dscore  ldx #5 ; screen offset start from right-most value
        ldy #0 ; score byte index

sloop   lda score,y
        pha
        and #$0f
        jsr plotd

        pla
        lsr a 
        lsr a
        lsr a
        lsr a
        jsr plotd

        iny
        cpy #3
        bne sloop

        rts

; plot digit   
plotd   clc
        adc #48
        sta $0400,x
        dex
        rts

; ----------------------------------------------------------
; Data and Variables
; ----------------------------------------------------------

time    .byte 0,0

; Using Binary Coded Decimal (BCD)
; Location of bytes from low to high: score,score+1,score+2
; Each location stores a two-digit value
score   .byte 0,0,0