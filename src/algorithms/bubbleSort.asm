; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 22.04.2021
; Bubble Sort
; The subroutine (sort8) sorts unordered lists
; that are comprised of 8-bit elements
;
; The 6502 microprocessor will have to make from 1 to N number of passes
; through an N-element list in order to sort it.
; On the average, N/2 passes are required to sort an N-element list.
; ==========================================================

.include "src/include/macros-general.asm"

; ----------------------------------------------------------
; Labels
; ----------------------------------------------------------

listAddress     = $C000                 ; first byte holds the list length
exchangeFlag    = $CFFF

; ----------------------------------------------------------
; Program
; ----------------------------------------------------------

                *=$02a7                 ; sys679

init            jsr $e544               ; Clear the screen
                ldx #$01
                stx $d020               ; Border color register
                ldx #$00
                stx $d021               ; Background color

                lda #$00
                ldx #$00
                ldy #$00
ldlist          lda list1,x             ; get byte from list1+x
                sta listAddress,y       ; lo-byte of current list address
                inx                     ; increase x
                iny                     ; increase y
                cpx #$04                ; check if end of list reached
                bne ldlist

sort8           ldy #$00                ; Turn exchange flag off (= 0)
                sty exchangeFlag        ; Save exchange flag
                lda listAddress,y       ; Fetch element count
                tax                     ; and put it into x
                iny                     ; point to first element in list
                dex                     ; decrement element count

nxtel           lda listAddress,y       ; fetch element
                iny
                cmp listAddress,y       ; Is it larger than the next element?
                bcc chkend              ; Branch on carry clear
                beq chkend              ; Branch on Equal
                                        ; Yes. Exchange elements in memory
                pha                     ; By saving low byte on stack
                lda listAddress,y       ; then get high byte and
                dey                     ; store it at low address
                sta listAddress,y   
                pla                     ; Pull low byte from stack
                iny                     ; and store it at high address
                sta listAddress,y 
                lda #$FF                ; Turn exchange flag on (= -1)
                sta exchangeFlag
chkend          dex                     ; End of List reached?
                bne nxtel               ; No. Fetch the next element.
                bit exchangeFlag        ; Yes. Echange flag sitll off?
                bmi sort8               ; No. Go through list again
                rts


; ----------------------------------------------------------
; Data
; ----------------------------------------------------------

list1           .byte $03, $0A, $08, $02 ; First byte is the list length