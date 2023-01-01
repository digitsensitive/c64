; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com;
; A Snake Clone
; Version 0.1
; ==========================================================

        *=$c000         ; sys 49152 [up to $cfff (53247), 4000 bytes]

; input keys
KEY_W               = 87
KEY_A               = 65
KEY_S               = 83
KEY_D               = 68

; ----------------------------------------------------------
; Init
; ----------------------------------------------------------

init    ; Set border and background color to black
        ldx #$00                
        stx $d020               ; Border color register
        stx $d021               ; Background color

        jsr cls                 ; clear screen

        ; set current direction to right
        lda #$01
        sta dir
        lda #$00
        sta dir+1

        ; set snake start position
        lda #13
        sta snake
        lda #08
        sta snake+1

        ; TODO: add_new_food
        
; ----------------------------------------------------------
; Main Loop
; ----------------------------------------------------------

loop    jsr input

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

input   lda dir
        sta tmpdir
        lda dir+1
        sta tmpdir+1

        jsr $ff9f ; 65439, jump to scan keyboard
        jsr $ffe4 ; 65508, jump to get a character

        ; cmp (short for "CoMPare")
        ; compares contents of accumulator against the specified operand 
        cmp #KEY_W
        beq uk
        cmp #KEY_S
        beq dk
        cmp #KEY_A
        beq lk
        cmp #KEY_D
        beq rk

        ; TODO:
        ; if dir.x == -lastDir.x or dir.y == -lastDir.y then
        ;        dir = lastDir
	; end

        rts

uk      ; set current direction to up
        lda #$00
        sta dir
        lda #$02
        sta dir+1
        rts

dk      ; set current direction to down
        lda #$00
        sta dir
        lda #$01
        sta dir+1
        rts

lk      ; set current direction to left
        lda #$02
        sta dir
        lda #$00
        sta dir+1
        rts

rk      ; set current direction to right
        lda #$01
        sta dir
        lda #$00
        sta dir+1
        rts

; ----------------------------------------------------------
; Update
; ----------------------------------------------------------

update  clc
        lda snake
        adc #1
        sta snake
        rts

; ----------------------------------------------------------
; Draw
; ----------------------------------------------------------

draw    ; TODO: Draw Food
        jsr dsnake
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
        adc #1
        sta score
        lda score+1
        adc #$00
        sta score+1
        lda score+2
        adc #$00
        sta score+2

        cld ; clear decimal mode

; ----------------------------------------------------------
; Draw Snake
; ----------------------------------------------------------

dsnake  ldx snake
        lda #$80
        sta $0400,x
        dex
        lda #$20                ; spacebar screen code
        sta $0400,x
        rts

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

; Current direction
; Location of bytes from low to high: dir,dir+1
; dir   => x value
; dir+1 => y value
dir     .byte 0,0
tmpdir  .byte 0,0

time    .byte 0,0

snake   .byte 0,0

; Using Binary Coded Decimal (BCD)
; Location of bytes from low to high: score,score+1,score+2
; Each location stores a two-digit value
score   .byte 0,0,0