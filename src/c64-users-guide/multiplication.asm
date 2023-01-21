; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive (digit.sensitivee@gmail.com)
; C64 User's Guide - Getting Started: Print Multiplication
;
; This example shows how to perform multiplication in assembly language.
; In this example we perform multiplication of two 8-bit numbers.
; The result is also stored in an 8-bit number.
; So the maximum number is 255 (a total of 256 values, 0-255).
; Adding 1 to 255 will wrap to zero.
;
; Remember:
; * 12 (Multiplicand, MPD) x 23 (Multiplier, MPR)
;   => 3 x 12 = 36 (Partial Product, PP)
;   => 2 x 12 = 24 (Added to the PP with an offset by one to the left) 
;   => 36 + 240 = 276 (Final Result, RES)
;
; Example:
;
;   010 (= 2, MPD)
;  x011 (= 3, MPR)
;  ----
;   010
;  010
; 000
; ----
; 00110 (= 6, RES)
;
; Example in BASIC:
; PRINT 2*3
; ==========================================================

        *=$02a7         ; sys 679 [up to $02FF (767), 88 bytes]

; clear screen

cls     lda #147        ; load accumulator with char CLR HOME
        jsr $ffd2       ; CHROUT, kernal rountine
                        ; send character in accumulator to screen

; init

init    lda #0          ; zero accumulator
        sta tmp         ; clear temp
        sta res         ; clear lo-byte of result
        sta res+1       ; clear hi-byte of result
        ldx #8          ; x is counter

; main loop

loop    jsr mult
        jsr print

mult    lsr mpr         ; logical shift right MPR
        bcc noadd       ; branch if carry bit is clear (= is zero)
        clc             ; clear carry bit
        lda res         ; load res (lo-byte) in accumulator
        adc mpd         ; add mpd (lo-byte) to res (lo-byte)
        sta res         ; save result
        lda res+1       ; add rest of shifted mpd
        adc tmp         ; carry is also added if one
        sta res+1

noadd   asl mpd         ; arithmetic shift left MPD
        rol tmp         ; save bit from mpd
        dex             ; decrement counter
        bne mult        ; do it again if counter #0
        rts

; print result to screen using LINPRT routine

print   ldx res
        lda res+1
        jsr $bdcd
        rts

; data

tmp     .byte $00,$00   ; 16-bit number
mpd     .byte $02,$00   ; 16-bit number
mpr     .byte $03,$00   ; 16-bit number
res     .byte $00,$00   ; 16-bit number