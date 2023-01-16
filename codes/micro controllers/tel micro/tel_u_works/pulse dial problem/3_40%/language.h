set_lang_offset:
 	push acc
	mov a,lang
check_persian:
	cjne a,#01,check_english
	   jmp lang_check_complete
check_english:
	cjne a,#02,check_arabic
	   lcall add_lang_offset
	   jmp lang_check_complete
check_arabic:
	cjne a,#03,check_dutch
	   lcall add_lang_offset
	   lcall add_lang_offset
	   jmp lang_check_complete
check_dutch:
	cjne a,#04,check_other
	   lcall add_lang_offset
	   lcall add_lang_offset
	   lcall add_lang_offset
	   jmp lang_check_complete
check_other:

lang_check_complete:	
	pop acc
ret
;------------------------------------------------
add_lang_offset:
	push acc
	clr c
	mov a,#lang_offset_lo
	add a,dpl
	mov dpl,a
	mov a,#lang_offset_hi
	addc a,dph
	mov dph,a
	pop acc
ret
;------------------------------------------------
set_default_lang:
mov lang,#01
mov addr_hi,#default_lang_addr_hi
mov addr_lo,#default_lang_addr_lo
lcall read_e2p_byte
farsi_1:
cjne a,#160,english_1
mov lang,#01
jmp vcde1
english_1:
cjne a,#170,Arabic_1
mov lang,#02
jmp vcde1
Arabic_1:
cjne a,#180,Deuch_1
mov lang,#03
jmp vcde1
Deuch_1:
cjne a,#190,vcde1
mov lang,#04
vcde1:
ret
;------------------------------------------------
