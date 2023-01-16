;------------------------------------------------
;-----------------card functions-----------------
;------------------------------------------------
;------------------------------
;------------------------------
reset_card:
	setb CARD_RESET
	lcall card_delay
	clr CARD_CLOCK
	lcall card_delay
	setb CARD_CLOCK
	lcall card_delay
	clr CARD_CLOCK
ret     
;-----------------------------
clock_card:
	clr CARD_RESET
	lcall card_delay
	clr CARD_CLOCK
	lcall card_delay
	setb CARD_CLOCK
	lcall card_delay
	clr CARD_CLOCK
ret     
;-----------------------------
write_card2:
	lcall set_card_bus
	clr CARD_RESET
	clr CARD_CLOCK
	setb CARD_RESET
	lcall card_delay
	clr CARD_RESET
	lcall card_delay
	setb CARD_CLOCK
	lcall card_delay
	clr CARD_CLOCK
	lcall card_delay
ret
;-----------------------------
write_card:
	lcall set_card_bus
	clr CARD_RESET
	clr CARD_CLOCK
	setb CARD_RESET
	lcall w_delay
	clr CARD_RESET
	lcall w_delay
	setb CARD_CLOCK
	lcall w_delay
	clr CARD_CLOCK
	lcall w_delay
 ;;;;;;;;;;;;;;;;;;;;;;;;;;
	setb CARD_CLOCK
	lcall w_delay
	clr CARD_CLOCK
ret
;-------------------------------
write_carry_card:
	lcall set_card_bus
	lcall short_delay
	clr CARD_RESET
	clr CARD_CLOCK

	setb CARD_RESET
	lcall w_delay
	clr CARD_RESET
	lcall w_delay
	setb CARD_CLOCK
	lcall w_delay
	clr CARD_CLOCK
	lcall w_delay
	setb CARD_RESET
	lcall w_delay
	clr CARD_RESET
	lcall w_delay
	setb CARD_CLOCK
	lcall w_delay
	clr CARD_CLOCK
	lcall w_delay
  ;;;;;;;;;;;;;;;;;;;;;;;;
	setb CARD_CLOCK
	lcall w_delay
	clr CARD_CLOCK
ret    
;-----------------------------------
clear_card_account:
;clr card_sw
push ie
clr ie.7

	lcall set_card_bus
	clr card_output
	setb psw.3
	clr psw.4
	setb CARD_INPUT
	;;
	lcall reset_card
	mov r7,#64
	yrfg1:
	lcall clock_card
	djnz r7,yrfg1
	
	mov r7,#40
	sfre1:
	lcall card_delay
	lcall card_delay
	lcall write_card
	djnz r7,sfre1

	clr psw.3
	clr psw.4
pop ie
;setb card_sw
ret
;-----------------------------------
decrease_card_account:
;setb card_sw
push ie
clr ie.7
	
	lcall set_card_bus
	clr card_output
	setb psw.3
	clr psw.4
	setb CARD_INPUT
	;;
	lcall reset_card
	mov r7,#96
	level_1:
	lcall clock_card
	djnz r7,level_1
	mov r7,#8
	test_level_1:
	jb CARD_INPUT,level_1_full
	lcall clock_card
	djnz r7,test_level_1
	jmp level_1_empty
	;;
	level_1_full:
	lcall write_card
	clr psw.3
	clr psw.4
	jmp jfh1
	;;
	level_1_empty:
	;;
	;;
	lcall reset_card
	mov r7,#88
	level_2:
	lcall clock_card
	djnz r7,level_2
	mov r7,#8
	test_level_2:
	jb CARD_INPUT,level_2_full
	lcall clock_card
	djnz r7,test_level_2
	jmp level_2_empty
	;;
	level_2_full:
	lcall write_carry_card
	lcall reset_card
	mov r7,#96
	level_1_2:
	lcall clock_card
	djnz r7,level_1_2
	lcall write_card
	clr psw.3
	clr psw.4
	jmp jfh1
	;;
	level_2_empty:
	lcall reset_card
	mov r7,#80
	level_3:
	lcall clock_card
	djnz r7,level_3
	mov r7,#8
	test_level_3:
	jb CARD_INPUT,level_3_full
	lcall clock_card
	djnz r7,test_level_3
	jmp level_3_empty
	;;
	level_3_full:
	lcall write_carry_card
	lcall reset_card
	mov r7,#88
	level_2_3:
	lcall clock_card
	djnz r7,level_2_3
	lcall write_carry_card
	lcall reset_card
	mov r7,#96
	level_1_3:
	lcall clock_card
	djnz r7,level_1_3
	lcall write_card
	clr psw.3
	clr psw.4
	jmp jfh1 
	;;
	level_3_empty:
	lcall reset_card
	mov r7,#72
	level_4:
	lcall clock_card
	djnz r7,level_4
	mov r7,#8
	test_level_4:
	jb CARD_INPUT,level_4_full
	lcall clock_card
	djnz r7,test_level_4
	jmp level_4_empty
	;;
	level_4_full:
	lcall write_carry_card
	lcall reset_card
	mov r7,#80
	level_3_4:
	lcall clock_card
	djnz r7,level_3_4
	lcall write_carry_card
	lcall reset_card
	mov r7,#88
	level_2_4:
	lcall clock_card
	djnz r7,level_2_4
	lcall write_carry_card 
	lcall reset_card
	mov r7,#96
	level_1_4:
	lcall clock_card
	djnz r7,level_1_4
	lcall write_card
	clr psw.3
	clr psw.4
	jmp jfh1
	level_4_empty: 
	clr psw.3
	clr psw.4
;	lcall card_not_valid   ;baraye teste card change key
	jmp jfh2
jfh1:	
 	lcall verify_decrease_account ;baraye teste card change key
jfh2:
;clr card_input
pop ie
;setb card_sw

ret
;----------------------------------
atf_recovery:
	push 00
	lcall set_card_bus
	clr card_output
	setb CARD_INPUT
	lcall reset_card
	lcall short_delay
//sle4436:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
st1355:
	lcall reset_card
	mov r0,#104
atfx1:
	lcall clock_card
	djnz r0,atfx1
	jnb CARD_INPUT,segment4_atf
	lcall clock_card
	jnb CARD_INPUT,segment3_atf
	lcall clock_card
	jnb CARD_INPUT,segment2_atf
	lcall clock_card
	jnb CARD_INPUT,segment1_atf
	jmp end_atf_recovery
segment4_atf:
	lcall reset_card
	mov r0,#08
atfx4_1:
	lcall clock_card
	djnz r0,atfx4_1		
	lcall write_card
	mov r0,#56
atfx4_2:
	lcall clock_card
	djnz r0,atfx4_2
	mov r0,#07
atfx4_3:
	jnb CARD_INPUT,atfx4_4
	lcall clock_card
	djnz r0,atfx4_3
	jmp end_atf_recovery
atfx4_4:
	lcall write_carry_card
	jmp end_atf_recovery

segment3_atf:
	lcall reset_card
	mov r0,#08
atfx3_1:
	lcall clock_card
	djnz r0,atfx3_1		
	lcall write_card
	mov r0,#64
atfx3_2:
	lcall clock_card
	djnz r0,atfx3_2
	mov r0,#07
atfx3_3:
	jnb CARD_INPUT,atfx3_4
	lcall clock_card
	djnz r0,atfx3_3
	jmp end_atf_recovery
atfx3_4:
	lcall write_carry_card
	jmp end_atf_recovery

segment2_atf:
	lcall reset_card
	mov r0,#08
atfx2_1:
	lcall clock_card
	djnz r0,atfx2_1		
	lcall write_card
	mov r0,#72
atfx2_2:
	lcall clock_card
	djnz r0,atfx2_2
	mov r0,#07
atfx2_3:
	jnb CARD_INPUT,atfx2_4
	lcall clock_card
	djnz r0,atfx2_3
	jmp end_atf_recovery
atfx2_4:
	lcall write_carry_card
	jmp end_atf_recovery

segment1_atf:
	lcall reset_card
	mov r0,#08
atfx1_1:
	lcall clock_card
	djnz r0,atfx1_1		
	lcall write_card
lcall short_delay
	mov r0,#80
atfx1_2:
	lcall clock_card
	djnz r0,atfx1_2
	mov r0,#07
atfx1_3:
	jnb CARD_INPUT,atfx1_4
	lcall clock_card
	djnz r0,atfx1_3
	jmp end_atf_recovery
atfx1_4:
	lcall write_carry_card
	jmp end_atf_recovery
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end_atf_recovery:
	pop 00
ret
;----------------------------------
verify_decrease_account:

lcall set_card_bus
clr card_output
lcall short_delay
setb psw.3
clr  psw.4
setb CARD_INPUT
lcall reset_card
lcall reset_card
mov r1,#0
mov r0,#72
kn1:
 lcall clock_card
 djnz r0,kn1
 mov r0,#8
kn2: 
 jnb CARD_INPUT,kn3
 inc r1
 kn3:
 lcall clock_card
 djnz r0,kn2
mov a,r1
mov b,#8
mul ab
mov b,#64
mul ab
mov r2,a
mov r3,b
mov r0,#8
mov r1,#0
kn4:
jnb CARD_INPUT,kn5
inc r1
kn5:
lcall clock_card
djnz r0,kn4
mov a,r1
mov b,#64
mul ab
clr c
addc a,r2
mov r2,a
mov a,b
addc a,r3
mov r3,a
mov r0,#8
mov r1,#0
kn6:
jnb CARD_INPUT,kn7
inc r1
kn7:
lcall clock_card
djnz r0,kn6
mov a,r1
mov b,#8
mul ab
clr c
addc a,r2
mov r2,a
mov a,#0
addc a,r3
mov r3,a  
mov r0,#8
mov r1,#0
kn8:
jnb CARD_INPUT,kn9
inc r1
kn9:
lcall clock_card
djnz r0,kn8
mov a,r1
clr c
addc a,r2
mov r2,a
mov a,#0
addc a,r3
mov r1,a  

mov r3,a
mov a,r2
mov r4,a
mov r0,#4
kmul_five:
clr c
mov a,r2
addc a,r4
mov r2,a
mov a,r1
addc a,r3
mov r1,a
djnz r0,kmul_five

mov a,r1
cjne a,current_account_hi,its_ok  
mov a,r2
cjne a,current_account_lo,its_ok 	

some_thing_wrong:
clr psw.3
clr psw.4
lcall card_not_detected
jmp dfb1
its_ok:
clr psw.3
clr  psw.4
dfb1:
ret
;----------------------------------
 get_card_response:
 push 01
	 lcall set_card_bus
	 
	 lcall mid_delay
	 clr card_output
	 clr card_input
	 lcall reset_card
	
	 mov r1,#110
	skx_1:
	  lcall clock_card
	 djnz r1,skx_1
	
	lcall write_card2
	lcall short_delay
	
	mov r1,#177
	skx_2:
	lcall clock_card
	djnz r1,skx_2
	
	clr card_input
	mov r1,#48
	skx_3:
	setb card_output
	lcall clock_card
	djnz r1,skx_3
	
	
	clr a
	clr card_output
	setb card_input
	mov r1,#160
	skx_4:
	lcall clock_card
	djnz r1,skx_4
	
	jnb card_input,skx_5
	setb acc.0
	skx_5:
	
	mov r1,#160
	skx_6:
	lcall clock_card
	djnz r1,skx_6
	
	jnb card_input,skx_7
	setb acc.1
	skx_7:
	
	mov r1,#160
	skx_8:
	lcall clock_card
	djnz r1,skx_8
	
	jnb card_input,skx_9
	setb acc.2
	skx_9:
	
	skx_10:
	lcall clock_card
	djnz r1,skx_10
	
	jnb card_input,skx_11
	setb acc.3
	skx_11:
	
	skx_12:
	lcall clock_card
	djnz r1,skx_12
	
	jnb card_input,skx_13
	setb acc.3
	skx_13:
	
	skx_14:
	lcall clock_card
	djnz r1,skx_14
	
	jnb card_input,skx_15
	setb acc.4
	skx_15:
	
	skx_16:
	lcall clock_card
	djnz r1,skx_16
	
	jnb card_input,skx_17
	setb acc.5
	skx_17:
	
	skx_18:
	lcall clock_card
	djnz r1,skx_18
	
	jnb card_input,skx_19
	setb acc.6
	skx_19:
	
	skx_20:
	lcall clock_card
	djnz r1,skx_20
	
	jnb card_input,skx_21
	setb acc.7
	skx_21:
	setb psw.3
	clr  psw.4
	mov r2,a
	clr psw.3
	clr  psw.4
	clr a
	
	skx_22:
	lcall clock_card
	djnz r1,skx_22
	
	jnb card_input,skx_23
	setb acc.0
	skx_23:
	
	skx_24:
	lcall clock_card
	djnz r1,skx_24
	
	jnb card_input,skx_25
	setb acc.1
	skx_25:
	
	skx_26:
	lcall clock_card
	djnz r1,skx_26
	
	jnb card_input,skx_27
	setb acc.2
	skx_27:
	
	skx_28:
	lcall clock_card
	djnz r1,skx_28
	
	jnb card_input,skx_29
	setb acc.3
	skx_29:
	
	skx_30:
	lcall clock_card
	djnz r1,skx_30
	
	jnb card_input,skx_31
	setb acc.4
	skx_31:
	
	skx_32:
	lcall clock_card
	djnz r1,skx_32
	
	jnb card_input,skx_33
	setb acc.5
	skx_33:
	
	skx_34:
	lcall clock_card
	djnz r1,skx_34
	
	jnb card_input,skx_35
	setb acc.6
	skx_35:
	
	skx_36:
	lcall clock_card
	djnz r1,skx_36
	
	jnb card_input,skx_37
	setb acc.7
	skx_37:
	setb psw.3
	clr  psw.4
	mov r1,a
	
	clr card_input
	clr card_output
	//clr psw.3
	//clr  psw.4
	// setb wwwx
	//lcall www
	lcall set_e2p_bus
	lcall mid_delay
	mov zdata,r1
	mov addr_hi,#00h
	mov addr_lo,#10h
	lcall write_byte
	lcall mid_delay
	mov zdata,r2
	mov addr_hi,#00h
	mov addr_lo,#11h
	lcall write_byte
	
	clr psw.3
	clr  psw.4
 pop 01
 ret
;;;
;----------------------------------------------------
