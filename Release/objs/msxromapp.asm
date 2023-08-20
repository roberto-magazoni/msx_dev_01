;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.0 #14184 (MINGW64)
;--------------------------------------------------------
	.module msxromapp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _onDeviceDEV_IO
	.globl _onDeviceDEV_getId
	.globl _onCallCMD2
	.globl _onCallCMD1
	.globl _main
	.globl _print
	.globl __print
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;msxromapp.c:16: void _print(char* msg) {
;	---------------------------------
; Function _print
; ---------------------------------
__print::
;msxromapp.c:38: __endasm;
	ld	hl, #2; retrieve address from stack
	add	hl, sp
	ld	b, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, b
_printMSG_loop	:
	ld	a, (hl); print
	or	a
	ret	z
	push	hl
	push	ix
	ld	iy, (#0xfcc0); 0xfcc0
	ld	ix, #0x00a2; 0x00a2
	call	#0x001c; 0x001c
	pop	ix
	pop	hl
	inc	hl
	jr	_printMSG_loop
;msxromapp.c:40: return;
;msxromapp.c:41: }
	ret
;msxromapp.c:47: void print(char* msg) {
;	---------------------------------
; Function print
; ---------------------------------
_print::
;msxromapp.c:51: _print(msg);
;msxromapp.c:52: return;
;msxromapp.c:53: }
	jp	__print
;msxromapp.c:60: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;msxromapp.c:65: "main's return instruction.\r\n\0");
	ld	hl, #___str_0
;msxromapp.c:66: }
	jp	_print
___str_0:
	.ascii "Hello MSX from C!"
	.db 0x0d
	.db 0x0a
	.ascii "If you don't want your"
	.db 0x0d
	.db 0x0a
	.ascii "ROM program to return to"
	.db 0x0d
	.db 0x0a
	.ascii "BASIC/MSX-DOS, just avoid"
	.db 0x0d
	.db 0x0a
	.ascii "main's return instruction."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.db 0x00
;msxromapp.c:79: char* onCallCMD1(char* param) {
;	---------------------------------
; Function onCallCMD1
; ---------------------------------
_onCallCMD1::
;msxromapp.c:80: print("The C handler for CMD1 says hi!\r\n\0");
	push	hl
	ld	hl, #___str_1
	call	_print
	pop	de
;msxromapp.c:82: while ((*param != 0) && (*param != 0x3a)) {
00102$:
	ld	a, (de)
	or	a, a
	ret	Z
	sub	a, #0x3a
	ret	Z
;msxromapp.c:83: param++;
	inc	de
;msxromapp.c:85: return param;
;msxromapp.c:86: }
	jr	00102$
___str_1:
	.ascii "The C handler for CMD1 says hi!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.db 0x00
;msxromapp.c:99: char* onCallCMD2(char* param) {
;	---------------------------------
; Function onCallCMD2
; ---------------------------------
_onCallCMD2::
;msxromapp.c:100: print("The C handler for CMD2 says hi!\r\n\0");
	push	hl
	ld	hl, #___str_2
	call	_print
	pop	de
;msxromapp.c:102: while ((*param != 0) && (*param != 0x3a)) {
00102$:
	ld	a, (de)
	or	a, a
	ret	Z
	sub	a, #0x3a
	ret	Z
;msxromapp.c:103: param++;
	inc	de
;msxromapp.c:105: return param;
;msxromapp.c:106: }
	jr	00102$
___str_2:
	.ascii "The C handler for CMD2 says hi!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.db 0x00
;msxromapp.c:119: char onDeviceDEV_getId() {
;	---------------------------------
; Function onDeviceDEV_getId
; ---------------------------------
_onDeviceDEV_getId::
;msxromapp.c:120: print("The C handler for DEV_getId says hi!\r\n\0");
	ld	hl, #___str_3
	call	_print
;msxromapp.c:121: return 0;
	xor	a, a
;msxromapp.c:122: }
	ret
___str_3:
	.ascii "The C handler for DEV_getId says hi!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.db 0x00
;msxromapp.c:135: void onDeviceDEV_IO(char* param, char cmd) {
;	---------------------------------
; Function onDeviceDEV_IO
; ---------------------------------
_onDeviceDEV_IO::
;msxromapp.c:136: print("The C handler for DEV_IO says hi!\r\n\0");
	ld	hl, #___str_4
	call	_print
;msxromapp.c:137: }
	pop	hl
	inc	sp
	jp	(hl)
___str_4:
	.ascii "The C handler for DEV_IO says hi!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
