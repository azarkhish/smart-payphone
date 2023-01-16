	lcd_port equ P3
	en equ P3.7
	rs equ P3.5
	lock equ P1.3
	LCD_CLR equ 01H
	LCD_LN1 equ 80H
	LCD_LN2 equ 0C0H
	LOCK_i equ 0
	UNLOCK_i equ 1
	EX_i equ 2
	OK_i equ 3

	var1 equ r2
	temp equ r3
	delay equ r4

	scan equ r5
	iskey equ 0H
	newcode equ 1H
	keyval equ r6
	status equ r7
	max equ 30H
	count equ 31H
	length equ 32H
	retries equ 33H
	input equ 40H
	upass equ 50H

	is_ok equ 2H

	FALSE equ 0
	TRUE equ 1
	RETRY equ 2
	EXIT equ 3

	keyport equ P1
	col1 equ P1.0
	col2 equ P1.1
	col3 equ P1.2

	org 0H
	 clr p3.0
	 clr p3.1
	/////////////////////
	setb p3.7
	test:
	jnb p3.7,hook
	setb p3.2
	jmp test
	hook:
	clr p3.2
	jmp test
	/////////////////////
	acall lcd_init
	acall keypad_init
	clr iskey
	mov sp,#60H
	mov retries,#3
pre_main:
 	mov a,#LCD_CLR
	acall lcd_cmd
	mov dptr,#salam
	acall lcd_str
  lcall delay_1sec
main:
	mov a,#LCD_CLR
	acall lcd_cmd
	mov dptr,#str_enter
	acall lcd_str
	mov a,#0C0H
	acall lcd_cmd
	mov a,#LOCK_i
	acall lcd_dat
	mov a,#':'
	acall lcd_dat
	mov max,#4
	acall get_input
	cjne status,#TRUE,main
	mov dptr,#chk_12345
	mov count,#4
	acall chk
	jnb is_ok,main_2
	acall set_upass
	sjmp main
main_2:
	jb newcode,main_3
	mov dptr,#chk_upass
	mov count,#4
	acall chk
	sjmp main_4
main_3:
	acall chk_newcode
main_4:
	jnb is_ok, main_5
	mov retries,#3
	clr lock
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#OK_i
	acall lcd_dat
	mov dptr,#inactive
	acall lcd_str
	mov a,#LCD_LN2
	acall lcd_cmd
	mov dptr,#inactive1
	acall lcd_str
	acall delay_1sec
	mov a,#LCD_CLR
	acall lcd_cmd
	mov dptr,#inactive2
	acall lcd_str
	mov a,#LCD_LN2
	acall lcd_cmd
	mov dptr,#inactive3
	acall lcd_str
main_6:
	acall get_key
	cjne keyval,#12,main_6
	setb lock
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#OK_i
	acall lcd_dat
	mov dptr,#active
	acall lcd_str
	acall delay_1sec
	ajmp main
main_5:
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov a,#EX_i
	acall lcd_dat
	mov a,#2FH
	add a,retries
	acall lcd_dat
	mov dptr,#str_retry
	acall lcd_str
	acall delay_1sec
	djnz retries,main_8
	sjmp main_7
main_8:
	ajmp main
main_7:
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov a,#EX_i
	acall lcd_dat
	mov dptr,#str_blocked
	acall lcd_str
	mov a,#EX_i
	acall lcd_dat
	mov a,#LCD_LN2
	acall lcd_cmd
	mov a,#LOCK_i
	acall lcd_dat
	mov a,#':'
	acall lcd_dat
	mov max,#10
	acall get_input
	mov count,#10
	mov dptr,#chk_master
	acall chk
	jnb is_ok, main_7
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov a,#OK_i
	acall lcd_dat
	mov dptr,#str_unblocked
	acall lcd_str
	acall delay_1sec
	mov retries, #3
main_1:
	ajmp main

str_enter:
db "Enter lock Code",0H
str_master:
db "Enter Mastercode",0H
str_retry:
db " Tries left", 0H
str_blocked:
db "Blocked",0H
str_unblocked:
db "Unblocked",0H
inactive:
db " Lock is",0H
inactive1:
db "deactivated!", 0H
inactive2:
db "Press '#' key to", 0H
inactive3:
db "lock again", 0H
active:
db "Lock is active!", 0H
salam:
db "salam :)", 0H
lcd_reset:
	mov lcd_port, #0FFH
	mov delay,#20
	acall delayms
	mov lcd_port, #83H
	mov lcd_port, #03H
	mov delay,#15
	acall delayms
	mov lcd_port, #83H
	mov lcd_port, #03H
	mov delay,#5
	acall delayms
	mov lcd_port, #83H
	mov lcd_port, #03H
	mov delay,#5
	acall delayms
	mov lcd_port, #82H
	mov lcd_port, #02H
	mov delay,#5
	acall delayms
	ret

lcd_init:
	acall lcd_reset
	mov a,#28H
	acall lcd_cmd
	mov a,#0CH
	acall lcd_cmd
	mov a,#06H
	acall lcd_cmd
	mov a,#80H
	acall lcd_cmd
	acall cgbuild
	ret

cgbuild:
	mov count,#32
	mov a,#40H
	acall lcd_cmd
	mov dptr,#icons
cgbuild_l1:
	clr a
	movc a,@a+dptr
	acall lcd_dat
	inc dptr
	djnz count,cgbuild_l1
	ret

lcd_cmd:
	mov temp,a
	swap a
	anl a,#0FH
	add a,#80H
	mov lcd_port,a
	anl a,#0FH
	mov lcd_port,a

	mov a,temp
	anl a,#0FH
	add a,#80H
	mov lcd_port,a
	anl a,#0FH
	mov lcd_port,a

	mov delay,#10
	acall delayms
	ret

lcd_dat:
	mov temp,a
	swap a
	anl a,#0FH
	add a,#0A0H
	mov lcd_port,a
	nop
	clr en

	mov a,temp
	anl a,#0FH
	add a,#0A0H
	mov lcd_port,a
	nop
	clr en

	mov delay,#10
	acall delayms
	ret

lcd_str:
	clr a
	movc a,@a+dptr
	jz lcd_str_end
	inc dptr
	acall lcd_dat
	sjmp lcd_str
lcd_str_end:
	ret

lcd_str1:
	clr a
	mov a,@r0
	jz lcd_str_end1
	inc r0
	acall lcd_dat
	sjmp lcd_str1
lcd_str_end1:
	ret

delayms:
	mov var1,#230
d:
	nop
	nop
	djnz var1,d
	djnz delay,delayms
	ret

keypad_init:
	anl keyport,#0FH
	ret

get_key:
	mov keyval,#1
	mov a,#80H
	mov temp,#04
read:
	mov scan,a
	cpl a
	anl keyport,a
	
	jb col1,next
	jnb col1,$
	setb iskey
	ret
next:	
	jb col2,next1
	inc keyval
	jnb col2,$
	setb iskey
	ret
next1:
	jb col3,nokey
	inc keyval
	inc keyval
	jnb col3,$
	setb iskey
	ret
nokey:
	mov a,scan
	orl keyport,a
	inc keyval
	inc keyval
	inc keyval
	rr a
	mov delay,#10
	acall delayms
	djnz temp,read

	clr iskey
	ret

translate:
	mov a,keyval
	cjne a,#10,jmp1
	mov keyval,#'x'
	ret
jmp1:
	cjne a,#11,jmp2
	mov keyval,#'0'
	ret
jmp2:
	cjne a,#12,jmp3
	mov keyval,#'e'
	ret
jmp3:
	add a,#'0'
	mov keyval,a
	ret

get_input:
	mov r0,#input
	mov count,#0
	inc max
get_input_cnt:
	acall get_key
	jnb iskey,get_input_cnt
	acall translate
	mov a, keyval
	mov @r0,a
	cjne @r0,#'x',chk_e
	mov a,count
	jnz get_input_l1
	mov status,#EXIT
	ret
get_input_l1:
	inc max
	dec count
	mov @r0,#0
	dec r0
	mov a,#0C2H
	add a,count
	acall lcd_cmd
	mov a,#' '
	acall lcd_dat
	mov a,#0C2H
	add a,count
	acall lcd_cmd
	sjmp get_input_cnt
chk_e:
	cjne @r0,#'e',chk_key
	mov @r0,#0
	dec max
	mov a,max
	jnz get_input_lerr
	mov status,#TRUE
	ret
chk_key:
	inc count
	djnz max, get_input_nxt
	mov dptr,#get_input_err
get_input_retry:
	mov input,#0
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov a,#EX_i
	acall lcd_dat
	acall lcd_str
	acall delay_1sec
	mov status,#RETRY
	ret
get_input_nxt:
	mov a,@r0
	acall lcd_dat
	inc r0
	sjmp get_input_cnt
get_input_lerr:
	mov dptr,#get_input_err1
	sjmp get_input_retry
get_input_err1:
db " Code is small...", 0H
get_input_err:
db	" Code too long...",0H

chk:
	mov r0,#input
chk_l2:
	clr a
	movc a,@a+dptr
	mov b,@r0
	cjne a,b,chk_l1
	inc dptr
	inc r0
	djnz count,chk_l2
	setb is_ok
	ret
chk_l1:
	clr is_ok
	ret

chk_newcode:
	mov count,#4
	mov r0,#input
	mov r1,#upass
chk_newcode_l1:
	mov a,@r0
	mov b,@r1
	cjne a,b,chk_newcode_l2
	inc r0
	inc r1
	djnz count, chk_newcode_l1
	setb is_ok
	ret
chk_newcode_l2:
	clr is_ok
	ret

chk_12345:
db	"1234",0h

chk_master:
db "1234567890",0h

chk_upass:
db "4321",0h

set_upass:
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov dptr,#str_master
	acall lcd_str
	mov a,#LCD_LN2
	acall lcd_cmd
	mov a,#LOCK_i
	acall lcd_dat
	mov a,#':'
	acall lcd_dat
	mov max,#10
	acall get_input
	cjne status,#TRUE,set_upass_l1
	mov count,#10
	mov dptr,#chk_master
	acall chk
	jnb is_ok,set_upass_l1
set_upass_l4:
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#LCD_LN1
	acall lcd_cmd
	mov dptr,#str_new
	acall lcd_str
	mov a,#LCD_LN2
	acall lcd_cmd
	mov a,#LOCK_i
	acall lcd_dat
	mov a,#':'
	acall lcd_dat
	mov max,#4
	acall get_input
	cjne status,#TRUE, set_upass_l5
	mov a,#LCD_CLR
	acall lcd_cmd
	mov a,#OK_i
	acall lcd_dat
	mov dptr,#str_saved
	acall lcd_str
	setb newcode
	acall copy_code
	acall delay_1sec
	ret
set_upass_l5:
	cjne status,#RETRY,set_upass_l2
	sjmp set_upass_l4
set_upass_l1:
	cjne status,#RETRY,set_upass_l2
	sjmp set_upass
set_upass_l2:
	ret

str_new:
db "Enter new code", 0h
str_saved:
db "Lock code saved!", 0h

copy_code:
	mov r0,#input
	mov r1,#upass
	mov count,#5
copy_code_l1:
	mov a,@r0
	mov @r1,a
	inc r0
	inc r1
	djnz count, copy_code_l1
	ret

delay_1sec:
	mov delay,#250
	acall delayms
	mov delay,#250
	acall delayms
	mov delay,#250
	acall delayms
	mov delay,#250
	acall delayms
	ret

icons:
db 0xe, 0xa, 0x1f, 0x1f, 0x1b, 0x1b, 0xe, 0x0, 0xe, 0x2, 0x1f, 0x1f, 0x1b, 0x1b, 0xe, 0x0, 0x1f, 0x1b, 0x1b, 0x1b, 0x1b, 0x1f, 0x1b, 0x1f, 0x0, 0x1, 0x3, 0x16, 0x1c, 0x8, 0x0, 0x0

	end