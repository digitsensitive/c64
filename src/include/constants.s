; ==========================================================
; COMMODORE 64 - Examples in 6502 Assembly language
; © Digitsensitive; digit.sensitivee@gmail.com; 05.12.2020
; Constants
; ==========================================================

; ----------------------------------------------------------
; Colors
; ----------------------------------------------------------
BLACK                               = 0
WHITE                               = 1
RED                                 = 2
CYAN                                = 3
PURPLE                              = 4
GREEN                               = 5
BLUE                                = 6
YELLOW                              = 7
ORANGE                              = 8
BROWN                               = 9
LIGHT_RED                           = 10
GRAY_ONE                            = 11
DARK_GREY                           = 11
GRAY_TWO                            = 12
MEDIUM_GREY                         = 12
LIGHT_GREEN                         = 13
LIGHT_BLUE                          = 14
GRAY_THREE                          = 15
LIGHT_GREY                          = 15

; ----------------------------------------------------------
; Default screen memory (1000 bytes)
; $0400-$07FF, 1024-2047
; ----------------------------------------------------------
SCREEN_MEMORY                       = $0400 ; 1024
UNUSED_16_BYTES                     = $07e8 ; 2024
SPRITE_POINTERS                     = $07f8 ; 2040

; ----------------------------------------------------------
; VIC-II Video Display
; $D000-$D3FF, 53248-54271
; ----------------------------------------------------------

; Sprite horizontal and vertical position registers
SP0X                                = $d000 ; 53248
SP0Y                                = $d001 ; 53249
SP1X                                = $d002 ; 53250
SP1Y                                = $d003 ; 53251
SP2X                                = $d004 ; 53252
SP2Y                                = $d005 ; 53253
SP3X                                = $d006 ; 53254
SP3Y                                = $d007 ; 53255
SP4X                                = $d008 ; 53256
SP4Y                                = $d009 ; 53257
SP5X                                = $d00A ; 53258
SP5Y                                = $d00B ; 53259
SP6X                                = $d00C ; 53260
SP6Y                                = $d00D ; 53261
SP7X                                = $d00E ; 53262
SP7Y                                = $d00F ; 53263

; Most significant bits of sprites 0-7 horizontal positions
MSIGX                               = $d010 ; 53264

; Sprite enable register
SPRITE_ENABLE_REGISTER              = $d015 ; 53269

; Sprite color registers
SPRITE_0_COLOR_REGISTER             = $d027 ; 53287
SPRITE_1_COLOR_REGISTER             = $d028 ; 53288
SPRITE_2_COLOR_REGISTER             = $d029 ; 53289
SPRITE_3_COLOR_REGISTER             = $d02a ; 53290
SPRITE_4_COLOR_REGISTER             = $d02b ; 53291
SPRITE_5_COLOR_REGISTER             = $d02c ; 53292
SPRITE_6_COLOR_REGISTER             = $d02d ; 53293
SPRITE_7_COLOR_REGISTER             = $d02e ; 53294



; **************


; VIC-II COLOR REGISTER (HEX and DECIMAL)
BORDER_COLOR_REGISTER               = $d020 ; 53280
BACKGROUND_COLOR                    = $d021 ; 53281

; COLOR MEMORY MAP / FOREGROUND COLOR (HEX and DECIMAL)
COLOR_MEMORY_MAP                    = $d800 ; 55296

; ----------------------------------------------------------
; 8k Operating System ROM
; $E000-$FFFF, 57344-65535
; ----------------------------------------------------------

; Kernal Jump Table
SCNKEY                              = $ff9f ; 65439
GETIN                               = $ffe4 ; 65508