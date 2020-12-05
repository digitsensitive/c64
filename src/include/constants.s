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
UNUSED_16_BYTES                     = $07E8 ; 2024
SPRITE_POINTERS                     = $07F8 ; 2040




; **********************************************************



; VIC-II COLOR REGISTER (HEX and DECIMAL)
BORDER_COLOR_REGISTER               = $D020 ; 53280
BACKGROUND_COLOR                    = $D021 ; 53281

; COLOR MEMORY MAP / FOREGROUND COLOR (HEX and DECIMAL)
COLOR_MEMORY_MAP                    = $D800 ; 55296

; ----------------------------------------------------------
; Sprite
; ----------------------------------------------------------


; SPRITE HORIZONTAL AND VERTICAL POSITION REGISTERS
SPRITE_0_HORIZONTAL_POSITION        = $D000 ; 53248
SPRITE_0_VERTICAL_POSITION          = $D001 ; 53249
SPRITE_1_HORIZONTAL_POSITION        = $D002 ; 53250
SPRITE_1_VERTICAL_POSITION          = $D003 ; 53251
SPRITE_2_HORIZONTAL_POSITION        = $D004 ; 53252
SPRITE_2_VERTICAL_POSITION          = $D005 ; 53253
SPRITE_3_HORIZONTAL_POSITION        = $D006 ; 53254
SPRITE_3_VERTICAL_POSITION          = $D007 ; 53255
SPRITE_4_HORIZONTAL_POSITION        = $D008 ; 53256
SPRITE_4_VERTICAL_POSITION          = $D009 ; 53257
SPRITE_5_HORIZONTAL_POSITION        = $D00A ; 53258
SPRITE_5_VERTICAL_POSITION          = $D00B ; 53259
SPRITE_6_HORIZONTAL_POSITION        = $D00C ; 53260
SPRITE_6_VERTICAL_POSITION          = $D00D ; 53261
SPRITE_7_HORIZONTAL_POSITION        = $D00E ; 53262
SPRITE_7_VERTICAL_POSITION          = $D00F ; 53263

SPRITE_ENABLE_REGISTER              = $D015 ; 53269

; SPRITE COLOR REGISTERS
SPRITE_0_COLOR_REGISTER             = $D027 ; 53287
SPRITE_1_COLOR_REGISTER             = $D028 ; 53288
SPRITE_2_COLOR_REGISTER             = $D029 ; 53289
SPRITE_3_COLOR_REGISTER             = $D02A ; 53290
SPRITE_4_COLOR_REGISTER             = $D02B ; 53291
SPRITE_5_COLOR_REGISTER             = $D02C ; 53292
SPRITE_6_COLOR_REGISTER             = $D02D ; 53293
SPRITE_7_COLOR_REGISTER             = $D02E ; 53294