;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _jump
	.globl _wouldHitSurf
	.globl _performantdelay
	.globl _setupplayer
	.globl _movegamechar
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _gravity
	.globl _possibleYSurface
	.globl _floorYposition
	.globl _currentspeedY
	.globl _walkspeed
	.globl _jumping
	.globl _playerlocation
	.globl _spritesize
	.globl _player
	.globl _windowmap
	.globl _backtile
	.globl _back
	.globl _guy
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_guy::
	.ds 32
_back::
	.ds 720
_backtile::
	.ds 144
_windowmap::
	.ds 5
_player::
	.ds 6
_spritesize::
	.ds 1
_playerlocation::
	.ds 4
_jumping::
	.ds 1
_walkspeed::
	.ds 1
_currentspeedY::
	.ds 2
_floorYposition::
	.ds 2
_possibleYSurface::
	.ds 1
_gravity::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;guy.c:26: unsigned char guy[] =
	ld	hl, #_guy
	ld	(hl), #0xff
	ld	hl, #(_guy + 0x0001)
	ld	(hl), #0xff
	ld	hl, #(_guy + 0x0002)
	ld	(hl), #0x81
	ld	hl, #(_guy + 0x0003)
	ld	(hl), #0xff
	ld	hl, #(_guy + 0x0004)
	ld	(hl), #0xbf
	ld	hl, #(_guy + 0x0005)
	ld	(hl), #0xc1
	ld	hl, #(_guy + 0x0006)
	ld	(hl), #0x9b
	ld	hl, #(_guy + 0x0007)
	ld	(hl), #0xd3
	ld	hl, #(_guy + 0x0008)
	ld	(hl), #0xbf
	ld	hl, #(_guy + 0x0009)
	ld	(hl), #0xc1
	ld	hl, #(_guy + 0x000a)
	ld	(hl), #0xa7
	ld	hl, #(_guy + 0x000b)
	ld	(hl), #0xc3
	ld	hl, #(_guy + 0x000c)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x000d)
	ld	(hl), #0xc2
	ld	hl, #(_guy + 0x000e)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x000f)
	ld	(hl), #0xc2
	ld	hl, #(_guy + 0x0010)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x0011)
	ld	(hl), #0xd2
	ld	hl, #(_guy + 0x0012)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x0013)
	ld	(hl), #0xd2
	ld	hl, #(_guy + 0x0014)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x0015)
	ld	(hl), #0xd2
	ld	hl, #(_guy + 0x0016)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x0017)
	ld	(hl), #0xd2
	ld	hl, #(_guy + 0x0018)
	ld	(hl), #0xbe
	ld	hl, #(_guy + 0x0019)
	ld	(hl), #0xd2
	ld	hl, #(_guy + 0x001a)
	ld	(hl), #0xbf
	ld	hl, #(_guy + 0x001b)
	ld	(hl), #0xdb
	ld	hl, #(_guy + 0x001c)
	ld	(hl), #0xbf
	ld	hl, #(_guy + 0x001d)
	ld	(hl), #0xc9
	ld	hl, #(_guy + 0x001e)
	ld	(hl), #0xff
	ld	hl, #(_guy + 0x001f)
	ld	(hl), #0xff
;back.c:25: unsigned char back[] =
	ld	hl, #_back
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0169)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x016f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0173)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0175)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x0176)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0180)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0182)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0183)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0184)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0185)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0186)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0187)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0188)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0189)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x018f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0190)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0191)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0192)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0193)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0194)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0195)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0196)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0197)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0198)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0199)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x019a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x019b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x019c)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x019d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x019e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x019f)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x01a0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01a9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01aa)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ab)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ac)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ad)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ae)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01af)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01b9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ba)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01bb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01bc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01bd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01be)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01bf)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c3)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x01c4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01c8)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x01c9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ca)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01cb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01cc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01cd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ce)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01cf)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01d9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01da)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01db)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01dc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01dd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01de)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01df)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01e9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ea)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x01eb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ec)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ed)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ee)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ef)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f0)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f1)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x01f2)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f3)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f4)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f5)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f6)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f7)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f8)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01f9)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01fa)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01fb)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01fc)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01fd)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0202)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0203)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0204)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0205)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0206)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0207)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0208)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0209)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x020f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0210)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0211)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x0212)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0213)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0214)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0215)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0216)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0217)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0218)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0219)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x021a)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x021b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x021c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x021d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x021e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x021f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0220)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0221)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0222)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0223)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0224)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0225)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0226)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0227)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0228)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0229)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x022f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0230)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0231)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0232)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0233)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0234)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0235)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0236)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0237)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0238)
	ld	(hl), #0x2c
	ld	hl, #(_back + 0x0239)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x023f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0240)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0241)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0242)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0243)
	ld	(hl), #0x2d
	ld	hl, #(_back + 0x0244)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0245)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0246)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0247)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0248)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0249)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024a)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024b)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024c)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024d)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024e)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x024f)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0250)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0251)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0252)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0253)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0254)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0255)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0256)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0257)
	ld	(hl), #0x00
	ld	hl, #(_back + 0x0258)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0259)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025a)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025b)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025c)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025d)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025e)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x025f)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0260)
	ld	(hl), #0x26
	ld	hl, #(_back + 0x0261)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0262)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0263)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0264)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0265)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0266)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0267)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0268)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x0269)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x026a)
	ld	(hl), #0x27
	ld	hl, #(_back + 0x026b)
	ld	(hl), #0x28
	ld	hl, #(_back + 0x026c)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x026d)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x026e)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x026f)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0270)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0271)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0272)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0273)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0274)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0275)
	ld	(hl), #0x2b
	ld	hl, #(_back + 0x0276)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0277)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0278)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0279)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027a)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027b)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027c)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027d)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027e)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x027f)
	ld	(hl), #0x2a
	ld	hl, #(_back + 0x0280)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0281)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0282)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0283)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0284)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0285)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0286)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0287)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0288)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0289)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028a)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028b)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028c)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028d)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028e)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x028f)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0290)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0291)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0292)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0293)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0294)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0295)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0296)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0297)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0298)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x0299)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029a)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029b)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029c)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029d)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029e)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x029f)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a0)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a1)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a2)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a3)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a4)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a5)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a6)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a7)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a8)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02a9)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02aa)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ab)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ac)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ad)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ae)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02af)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b0)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b1)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b2)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b3)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b4)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b5)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b6)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b7)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b8)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02b9)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ba)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02bb)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02bc)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02bd)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02be)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02bf)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c0)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c1)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c2)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c3)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c4)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c5)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c6)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c7)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c8)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02c9)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ca)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02cb)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02cc)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02cd)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02ce)
	ld	(hl), #0x29
	ld	hl, #(_back + 0x02cf)
	ld	(hl), #0x29
;backtile.c:26: unsigned char backtile[] =
	ld	hl, #_backtile
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0012)
	ld	(hl), #0x80
	ld	hl, #(_backtile + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0014)
	ld	(hl), #0xbf
	ld	hl, #(_backtile + 0x0015)
	ld	(hl), #0xc0
	ld	hl, #(_backtile + 0x0016)
	ld	(hl), #0x80
	ld	hl, #(_backtile + 0x0017)
	ld	(hl), #0xc0
	ld	hl, #(_backtile + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x001a)
	ld	(hl), #0x8f
	ld	hl, #(_backtile + 0x001b)
	ld	(hl), #0xf8
	ld	hl, #(_backtile + 0x001c)
	ld	(hl), #0xbc
	ld	hl, #(_backtile + 0x001d)
	ld	(hl), #0xc8
	ld	hl, #(_backtile + 0x001e)
	ld	(hl), #0x88
	ld	hl, #(_backtile + 0x001f)
	ld	(hl), #0xc8
	ld	hl, #(_backtile + 0x0020)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0024)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0028)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x002a)
	ld	(hl), #0x1f
	ld	hl, #(_backtile + 0x002b)
	ld	(hl), #0xf0
	ld	hl, #(_backtile + 0x002c)
	ld	(hl), #0xf8
	ld	hl, #(_backtile + 0x002d)
	ld	(hl), #0x10
	ld	hl, #(_backtile + 0x002e)
	ld	(hl), #0x10
	ld	hl, #(_backtile + 0x002f)
	ld	(hl), #0x10
	ld	hl, #(_backtile + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0031)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0032)
	ld	(hl), #0x01
	ld	hl, #(_backtile + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0034)
	ld	(hl), #0xfd
	ld	hl, #(_backtile + 0x0035)
	ld	(hl), #0x03
	ld	hl, #(_backtile + 0x0036)
	ld	(hl), #0x01
	ld	hl, #(_backtile + 0x0037)
	ld	(hl), #0x03
	ld	hl, #(_backtile + 0x0038)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0039)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x003a)
	ld	(hl), #0xf1
	ld	hl, #(_backtile + 0x003b)
	ld	(hl), #0x1f
	ld	hl, #(_backtile + 0x003c)
	ld	(hl), #0x3d
	ld	hl, #(_backtile + 0x003d)
	ld	(hl), #0x13
	ld	hl, #(_backtile + 0x003e)
	ld	(hl), #0x11
	ld	hl, #(_backtile + 0x003f)
	ld	(hl), #0x13
	ld	hl, #(_backtile + 0x0040)
	ld	(hl), #0xa5
	ld	hl, #(_backtile + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0042)
	ld	(hl), #0x5a
	ld	hl, #(_backtile + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0044)
	ld	(hl), #0xa5
	ld	hl, #(_backtile + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0046)
	ld	(hl), #0x5a
	ld	hl, #(_backtile + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0048)
	ld	(hl), #0x5a
	ld	hl, #(_backtile + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x004a)
	ld	(hl), #0xa5
	ld	hl, #(_backtile + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x004c)
	ld	(hl), #0x5a
	ld	hl, #(_backtile + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x004e)
	ld	(hl), #0xa5
	ld	hl, #(_backtile + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0051)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0052)
	ld	(hl), #0xa9
	ld	hl, #(_backtile + 0x0053)
	ld	(hl), #0x56
	ld	hl, #(_backtile + 0x0054)
	ld	(hl), #0xfd
	ld	hl, #(_backtile + 0x0055)
	ld	(hl), #0x02
	ld	hl, #(_backtile + 0x0056)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0058)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x005a)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x005c)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x005e)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0060)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0061)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0062)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0063)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0065)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0066)
	ld	(hl), #0xdd
	ld	hl, #(_backtile + 0x0067)
	ld	(hl), #0x22
	ld	hl, #(_backtile + 0x0068)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x006a)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x006c)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x006e)
	ld	(hl), #0xff
	ld	hl, #(_backtile + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0070)
	ld	(hl), #0x01
	ld	hl, #(_backtile + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0072)
	ld	(hl), #0x02
	ld	hl, #(_backtile + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0074)
	ld	(hl), #0x04
	ld	hl, #(_backtile + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0076)
	ld	(hl), #0x08
	ld	hl, #(_backtile + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0078)
	ld	(hl), #0x10
	ld	hl, #(_backtile + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x007a)
	ld	(hl), #0x20
	ld	hl, #(_backtile + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x007c)
	ld	(hl), #0x40
	ld	hl, #(_backtile + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x007e)
	ld	(hl), #0x80
	ld	hl, #(_backtile + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0080)
	ld	(hl), #0x80
	ld	hl, #(_backtile + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0082)
	ld	(hl), #0x40
	ld	hl, #(_backtile + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0084)
	ld	(hl), #0x20
	ld	hl, #(_backtile + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0086)
	ld	(hl), #0x10
	ld	hl, #(_backtile + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x0088)
	ld	(hl), #0x08
	ld	hl, #(_backtile + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x008a)
	ld	(hl), #0x04
	ld	hl, #(_backtile + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x008c)
	ld	(hl), #0x02
	ld	hl, #(_backtile + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_backtile + 0x008e)
	ld	(hl), #0x01
	ld	hl, #(_backtile + 0x008f)
	ld	(hl), #0x00
;windowmap.c:1: unsigned char windowmap[] =
	ld	hl, #_windowmap
	ld	(hl), #0x16
	ld	hl, #(_windowmap + 0x0001)
	ld	(hl), #0x19
	ld	hl, #(_windowmap + 0x0002)
	ld	(hl), #0x16
	ld	hl, #(_windowmap + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_windowmap + 0x0004)
	ld	(hl), #0x00
;main.c:16: UBYTE spritesize = 8;
	ld	hl, #_spritesize
	ld	(hl), #0x08
;main.c:45: BYTE jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:46: INT8 walkspeed = 2;
	ld	hl, #_walkspeed
	ld	(hl), #0x02
;main.c:48: INT16 floorYposition = 120;
	ld	hl, #_floorYposition
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;main.c:57: INT8 gravity = -2;
	ld	hl, #_gravity
	ld	(hl), #0xfe
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:19: void movegamechar(struct gamechar* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamechar
; ---------------------------------
_movegamechar::
	add	sp, #-2
;main.c:20: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:21: move_sprite(character->spritids[1], x,y+spritesize);
	dec	hl
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	inc	de
	ld	a, (de)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;main.c:21: move_sprite(character->spritids[1], x,y+spritesize);
;main.c:27: }
	add	sp, #2
	ret
;main.c:29: void setupplayer(){
;	---------------------------------
; Function setupplayer
; ---------------------------------
_setupplayer::
;main.c:30: player.x = 80;
	ld	bc, #_player+0
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x50
;main.c:31: player.y = 120;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x78
;main.c:32: player.width = 8;
	ld	hl, #(_player + 0x0004)
	ld	(hl), #0x08
;main.c:33: player.height = 16;
	ld	hl, #(_player + 0x0005)
	ld	(hl), #0x10
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:37: player.spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x01
;main.c:39: player.spritids[1] = 1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;main.c:41: movegamechar(&player, player.x, player.y);
	ld	a, (#(_player + 0x0003) + 0)
	ld	hl, #(_player + 0x0002)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamechar
	add	sp, #4
;main.c:42: }
	ret
;main.c:51: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;main.c:53: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:54: wait_vbl_done();
	call	_wait_vbl_done
;main.c:53: for(i = 0; i < numloops; i++){
	inc	c
;main.c:56: }
	jr	00103$
;main.c:58: INT8 wouldHitSurf(UINT8 projectedYPosition)
;	---------------------------------
; Function wouldHitSurf
; ---------------------------------
_wouldHitSurf::
;main.c:60: if(projectedYPosition >= floorYposition){
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_floorYposition
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	C, 00102$
;main.c:61: return floorYposition;
	ld	hl, #_floorYposition
	ld	e, (hl)
	ret
00102$:
;main.c:63: return -1;
	ld	e, #0xff
;main.c:64: }
	ret
;main.c:67: void jump()
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
;main.c:69: if(jumping == 0)
	ld	hl, #_jumping
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;main.c:71: jumping = 1;
	ld	(hl), #0x01
;main.c:72: currentspeedY = 10;
	ld	hl, #_currentspeedY
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:73: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG+0),a
;main.c:74: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG+0),a
;main.c:75: NR12_REG = 0x73; 
	ld	a, #0x73
	ldh	(_NR12_REG+0),a
;main.c:76: NR13_REG = 0x00; 
	ld	a, #0x00
	ldh	(_NR13_REG+0),a
;main.c:77: NR14_REG = 0xC3;
	ld	a, #0xc3
	ldh	(_NR14_REG+0),a
00102$:
;main.c:79: currentspeedY = currentspeedY + gravity;
	ld	a, (#_gravity)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #_currentspeedY
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;main.c:81: player.y -= currentspeedY;
	ld	bc, #_player + 3
	ld	a, (bc)
	dec	hl
	ld	e, (hl)
	sub	a, e
	ld	(bc), a
;main.c:83: possibleYSurface = wouldHitSurf(player.y);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_wouldHitSurf
	inc	sp
	pop	bc
	ld	hl, #_possibleYSurface
	ld	(hl), e
;main.c:86: if(possibleYSurface == floorYposition)
	ld	e, (hl)
	ld	d, #0x00
;main.c:90: movegamechar(&player,player.x, possibleYSurface);
;main.c:86: if(possibleYSurface == floorYposition)
	ld	hl, #_floorYposition
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00104$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00104$
;main.c:89: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:90: movegamechar(&player,player.x, possibleYSurface);
	ld	hl, #(_player + 0x0002)
	ld	b, (hl)
	ld	a, (#_possibleYSurface)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_player
	push	hl
	call	_movegamechar
	add	sp, #4
	ret
00104$:
;main.c:95: movegamechar(&player,player.x,player.y);
	ld	a, (bc)
	ld	c, a
	ld	hl, #(_player + 0x0002)
	ld	l, (hl)
	ld	a, c
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	hl, #_player
	push	hl
	call	_movegamechar
	add	sp, #4
;main.c:98: }
	ret
;main.c:100: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:102: set_sprite_data(0,2,guy);
	ld	hl, #_guy
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:103: setupplayer();
	call	_setupplayer
;main.c:105: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;main.c:106: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;main.c:107: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG+0),a
;main.c:112: font_init();
	call	_font_init
;main.c:113: min_font = font_load(font_min);
	ld	hl, #_font_min
	push	hl
	call	_font_load
	add	sp, #2
;main.c:114: font_set(min_font);
	push	de
	call	_font_set
	add	sp, #2
;main.c:116: set_bkg_data(37,9,backtile);
	ld	hl, #_backtile
	push	hl
	ld	de, #0x0925
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:117: set_bkg_tiles(0,0,40,18,back);
	ld	hl, #_back
	push	hl
	ld	de, #0x1228
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:119: set_win_tiles(0,0,5,1,windowmap);
	ld	hl, #_windowmap
	push	hl
	ld	de, #0x0105
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:893: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x7f
	ldh	(_WY_REG+0),a
;main.c:122: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:123: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:124: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:125: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:128: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:130: while(1){
00112$:
;main.c:132: if(joypad() & J_A || jumping == 1){
	call	_joypad
	bit	4, e
	jr	NZ, 00101$
	ld	a, (#_jumping)
	dec	a
	jr	NZ, 00102$
00101$:
;main.c:133: jump();
	call	_jump
00102$:
;c:/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	inc	a
	ldh	(_SCX_REG+0),a
;main.c:140: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00105$
;main.c:141: player.x -= 1*walkspeed;
	ld	bc, #_player + 2
	ld	a, (bc)
	ld	d, a
	ld	hl, #_walkspeed
	ld	e, (hl)
	ld	a, d
	sub	a, e
	ld	(bc), a
;main.c:142: movegamechar(&player, player.x, player.y);
	ld	hl, #_player + 3
	ld	d, (hl)
	ld	a, (bc)
	ld	e, a
	push	de
	ld	hl, #_player
	push	hl
	call	_movegamechar
	add	sp, #4
00105$:
;main.c:144: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00107$
;main.c:145: player.x += 1*walkspeed;
	ld	bc, #_player + 2
	ld	a, (bc)
	ld	e, a
	ld	a, (#_walkspeed)
	add	a, e
	ld	(bc), a
;main.c:146: movegamechar(&player, player.x, player.y);
	ld	hl, #(_player + 0x0003)
	ld	l, (hl)
	ld	a, (bc)
	ld	c, a
	ld	b, l
	push	bc
	ld	hl, #_player
	push	hl
	call	_movegamechar
	add	sp, #4
00107$:
;main.c:149: if(joypad() & J_B){
	call	_joypad
	bit	5, e
	jr	Z, 00109$
;main.c:150: walkspeed = 4;
	ld	hl, #_walkspeed
	ld	(hl), #0x04
	jr	00110$
00109$:
;main.c:152: walkspeed = 2;
	ld	hl, #_walkspeed
	ld	(hl), #0x02
00110$:
;main.c:158: performantdelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
;main.c:160: }
	jr	00112$
	.area _CODE
	.area _CABS (ABS)
