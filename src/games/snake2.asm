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

        ; draw border
        jsr dbrd

        ; set current direction to right
        lda #$01
        sta dir
        lda #$00
        sta dir+1

        ; set snake start position
        lda #01
        sta s_pos
        lda #01
        sta s_pos+1

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

        ; jsr update
        jsr draw
        ; --------------

        dec $d020

        jmp loop

; ----------------------------------------------------------
; Input
; ----------------------------------------------------------

input   lda dir
        sta tmpdir

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
        lda #$01
        sta dir
        rts

dk      ; set current direction to down
        lda #$03
        sta dir
        rts

lk      ; set current direction to left
        lda #$00
        sta dir
        rts

rk      ; set current direction to right
        lda #$02
        sta dir
        rts

; ----------------------------------------------------------
; Update
; ----------------------------------------------------------

update  lda dir

        clc

        cmp #0 ; left
        beq left
        cmp #1 ; up
        beq up
        cmp #2 ; right
        beq right
        cmp #3 ; down
        beq down
        rts

left    lda #$01 ; TODO: FIX TO -1
        sta s_pos
        lda #$00
        sta s_pos+1
        rts

up      lda #$00
        sta s_pos
        lda #$01 ; TODO: FIX TO -1
        sta s_pos+1
        rts

right   lda #$01
        sta s_pos
        lda #$00
        sta s_pos+1
        rts

down    lda #$00
        sta s_pos
        lda #$01
        sta s_pos+1
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

; Draw border
; First draw top and bottom line of the border (brdtb)
; Second draw left and right border (brdlr)

dbrd    ldy #$00
dbrdtb  ldx brdtb,y             ; get byte position
        lda #102                ; load char
        sta $0428,x             ; plot char to byte position: $0428+offset
        sta $07c0,x             ; plot char to byte position: $07c0+offset
        iny
        cpy #$28                ; if equal zero flag is set to one
        bne dbrdtb              ; branch if zero flag is zero
        ldy #$00
dbrdlr  ldx brdlr,y             ; get byte position
        lda #102                ; load char
        sta $0450,x             ; plot char to byte position: $0450+offset
        sta $0478,x             ; ...
        sta $04a0,x
        sta $04c8,x
        sta $04f0,x
        sta $0518,x
        sta $0540,x
        sta $0568,x
        sta $0590,x
        sta $05b8,x
        sta $05e0,x
        sta $0608,x
        sta $0630,x
        sta $0658,x
        sta $0680,x
        sta $06a8,x
        sta $06d0,x
        sta $06f8,x
        sta $0720,x
        sta $0748,x
        sta $0770,x
        sta $0798,x
        iny
        cpy #$02                ; if equal zero flag is set to one
        bne dbrdlr              ; branch if zero flag is zero
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

 ; x + (y * 40)
dsnake  clc
        lda s_pos ; load x pos
        adc #80
        sta s_pos+2
        ldx s_pos+2
        lda #$80
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
; Left  = 0 (x = -1, y = 0)
; Up    = 1 (x = 0, y = -1)
; Right = 2 (x = 1, y = 0)
; Down  = 3 (x = 0, y = 1)
dir     .byte 0
tmpdir  .byte 0

time    .byte 0,0

snake   .byte 0,0

; snake (x,y)
s_pos   .byte 0,0,0
s_lp    .byte 0,0

; Using Binary Coded Decimal (BCD)
; Location of bytes from low to high: score,score+1,score+2
; Each location stores a two-digit value
score   .byte 0,0,0

; Border data

brdtb   .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
        .byte $0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12,$13
        .byte $14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d
        .byte $1e,$1f,$20,$21,$22,$23,$24,$25,$26,$27

brdlr   .byte $00,$27