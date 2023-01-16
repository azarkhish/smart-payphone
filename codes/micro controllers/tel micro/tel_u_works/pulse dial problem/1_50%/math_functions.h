bcd_to_dec:
;read a compact bcd from acc and return decimal value to acc  
	push 01
	push b
	mov	 r1,a
	rr a
	rr a
	rr a
	rr a
	anl a,#15
	mov b,#10
	mul ab
	mov b,a
	mov a,r1
	anl a,#15
	add a,b
	pop b
	pop 01 
ret
;-----------------------------
dec_to_bcd:
	push b
	mov b,#10
	div ab
	rl a
	rl a
	rl a
	rl a
	orl a,b
	pop b
ret

;-----------------------------                                                
;----------------------------------------------
hex_to_dec:
push 01

mov r1,a
anl a,#30h	;110000b

cjne a,#0,uheyg1
mov a,r1
jmp uytew21
uheyg1:
cjne a,#10h,uheyg2
mov a,r1
clr c
subb a,#6
jmp uytew21
uheyg2:
cjne a,#20h,uheyg3
mov a,r1
clr c
subb a,#12
jmp uytew21
uheyg3:
mov a,r1
clr c
subb a,#18
jmp uytew21
uytew21:
pop 01
ret
;---------------------------------------------
dec_to_hex:
push 01

mov r1,a
clr c
subb a,#10
jnc uhuwh1
mov a,r1
jmp ljiiur34 
uhuwh1:
clr c
subb a,#10
jnc uhuwh2
mov a,r1
add a,#6
jmp ljiiur34 
uhuwh2:
clr c
subb a,#10
jnc uhuwh3
mov a,r1
add a,#12
jmp ljiiur34 
uhuwh3:
mov a,r1
add a,#18
jmp ljiiur34 
ljiiur34:
pop 01
ret
;---------------------------------
; CRC16 subroutine.
; - accumulator is assumed to have byte to be crc’ed
; - three direct variables are used, tmp, crc_hi and crc_lo
; - crc_hi and crc_lo contain the CRC16 result
; - this CRC16 algorithm uses a table lookup
;-------------------------------------------------------
crc16:
	push acc
	xrl a, crc_lo 
	mov tmp, a 
	push dph 
	push dpl 
	mov dptr, #crc16_tablo 
	movc a, @a+dptr 
	xrl a, crc_hi 
	mov crc_lo, a 
	mov dptr, #crc16_tabhi 
	mov a, tmp 
	movc a, @a+dptr 
	mov crc_hi, a 
	pop dpl 
	pop dph 
	pop acc
	ret 
;---------------------------- 
clear_crc:
	mov crc_lo,#00h
	mov crc_hi,#00h 
ret
;---------------------------- 

