load_e2p_to_ram2:
	push dpl					 ;;362fh
	push dph
	lcall set_e2p_bus

//
//	mov addr_hi,#36h
//	mov addr_lo,#30h
//	mov dptr,#01h
//	lcall read_page
//
//	mov addr_hi,#36h
//	mov addr_lo,#0B0h
//	mov dptr,#0129
//	lcall read_page
//
//	mov addr_hi,#37h
//	mov addr_lo,#30h
//	mov dpl,#01		;257
//	mov dph,#01
//	lcall read_page
//
//	mov addr_hi,#37h
//	mov addr_lo,#0B0h   
//	mov dpl,#081h	;385
//	mov dph,#01
//	lcall read_page
// 
  ;;;;;;;;;;;;
lcall load_black_list_to_ram
lcall load_white_list_to_ram

mov addr_hi,#card_check_policy_addr_hi
mov addr_lo,#card_check_policy_addr_lo
lcall read_e2p_byte
cjne a,#160,set_black_white_policy
clr card_check_policy
jmp out_load_e2p_to_ram
set_black_white_policy:
setb card_check_policy
;;;;;;;;;;;;;
out_load_e2p_to_ram:
	pop dph
	pop dpl

ret
;----------------------------------------------------
load_black_list_to_ram:
	push dpl
	push dph

	mov addr_hi,#black_list_addr_hi;
	mov addr_lo,#black_list_addr_lo;
	mov dptr,#00h
	
gyehui1:
	 lcall read_e2p_byte
   movx @dptr,a 
	 inc dptr
	 inc addr_lo
	 mov a,dpl
	 cjne a,#07,gyehui1 


	mov addr_hi,#02ch
	mov addr_lo,#080h
	mov dptr,#07h
	lcall read_page

	mov addr_hi,#02dh
	mov addr_lo,#00h
	mov dptr,#087h
	lcall read_page

	mov addr_hi,#02dh
	mov addr_lo,#080h
	mov dptr,#107h
	lcall read_page

	mov addr_hi,#02eh
	mov addr_lo,#00h
	mov dptr,#187h
	lcall read_page

	mov addr_hi,#02eh
	mov addr_lo,#080h
	mov dptr,#207h
	lcall read_page

   	mov addr_hi,#02fh
	mov addr_lo,#00h
	mov dptr,#287h
	lcall read_page

	mov addr_hi,#02fh
	mov addr_lo,#080h
	mov dptr,#307h
	lcall read_page

	mov addr_hi,#030h
	mov addr_lo,#00h
	mov dptr,#387h
	lcall read_page

	pop dph
	pop dpl

ret
;---------------------------------------------------
//load_black_list_to_ram:
//	push dpl
//	push dph
//	mov addr_hi,#black_list_addr_hi;
//	mov addr_lo,#black_list_addr_lo;
//	mov dptr,#0200h
//blackd_45:
//
//			mov b,#15
//		blackd_1:
//				mov a,#PADDR
//				lcall read_random
//				jnc blackd_3         
//				djnz b,blackd_1
//		blackd_3:
//
//	movx @dptr,a
//	inc dptr
//	lcall inc_e2p_counter
//	mov a,dph
//	cjne a,#06h,blackd_45
//	mov a,dpl
//	cjne a,#0b0h,blackd_45
//
//	pop dph
//	pop dpl
//ret
;----------------------------------------------------
load_white_list_to_ram:
	push dpl
	push dph

	mov addr_hi,#white_list_addr_hi;
	mov addr_lo,#white_list_addr_lo;
	mov dptr,#03e8h
	
	push 00
	 mov r0,#00h
gyehui2:
	 lcall read_e2p_byte
   movx @dptr,a 
	 inc dptr
	 lcall inc_e2p_counter
	 inc r0
	 cjne r0,#87,gyehui2 
	 pop 00

	mov addr_hi,#031h
	mov addr_lo,#080h
	mov dptr,#043fh
	lcall read_page

	mov addr_hi,#032h
	mov addr_lo,#00h
	mov dptr,#04bfh
	lcall read_page

	mov addr_hi,#032h
	mov addr_lo,#080h
	mov dptr,#53fh
	lcall read_page

	mov addr_hi,#033h
	mov addr_lo,#00h
	mov dptr,#5bfh
	lcall read_page

	mov addr_hi,#033h
	mov addr_lo,#080h
	mov dptr,#63fh
	lcall read_page

   	mov addr_hi,#034h
	mov addr_lo,#00h
	mov dptr,#6bfh
	lcall read_page

	mov addr_hi,#034h
	mov addr_lo,#080h
	mov dptr,#73fh
	lcall read_page

	mov addr_hi,#035h
	mov addr_lo,#00h
	mov dptr,#7bfh
	lcall read_page

	pop dph
	pop dpl

ret
;-----------------
load_dialing_rule:
mov addr_hi,#zerro_prevent_addr_hi
mov addr_lo,#zerro_prevent_addr_lo
lcall read_e2p_byte
;free  160
;zerro 170
;2xzerro 180

cjne a,#160,vgy1
clr first_zerro
clr second_zerro
jmp vgy3
vgy1:
cjne a,#170,vgy2
setb first_zerro
setb second_zerro
jmp vgy3
vgy2:
clr first_zerro
setb second_zerro
vgy3:
ret
;;;;;;;;;
load_phone_setting:
push acc
	mov addr_hi,#card_change_wait_time_addr_hi				  
	mov addr_lo,#card_change_wait_time_addr_lo 			  
	lcall read_e2p_byte
	cjne a,#01,poikij2
	mov card_alarm_counter,#01
	jmp poikij6
	poikij2:
	cjne a,#02,poikij3
	mov card_alarm_counter,#02
	jmp poikij6
	poikij3:
	cjne a,#03,poikij4
	mov card_alarm_counter,#03
	jmp poikij6
	poikij4:
	cjne a,#04,poikij5
	mov card_alarm_counter,#04
	jmp poikij6
	poikij5:
	mov card_alarm_counter,#05
	poikij6:



	mov addr_hi,#flash_delay_addr_hi				  
	mov addr_lo,#flash_delay_addr_lo 			  
	lcall read_e2p_byte
	mov flash_delay,a
 	
	mov addr_hi,#dtmf_delay_addr_hi				  
	mov addr_lo,#dtmf_delay_addr_lo 			  
	lcall read_e2p_byte
	mov dtmf_delay,a
	
	mov addr_hi,#dtmf_db_addr_hi				  
	mov addr_lo,#dtmf_db_addr_lo 			  
	lcall read_e2p_byte
	mov dtmf_db,a
 pop acc
ret
ret
;--------------------------------------------
initialize_volume:
	mov VOLUME_LEVEL,#010
	clr volume0
	clr volume1
ret
;-----------------------------------
set_dialing_type:
mov addr_hi,#dialing_type_addr_hi
mov addr_lo,#dialing_type_addr_lo
lcall read_e2p_byte
cjne a,#160,pulse_selected
setb tone_dialing
jmp xrdg1
pulse_selected:
clr tone_dialing
xrdg1:
ret
;------------------------------------
set_chargging_type:
	mov addr_hi,#chargging_type_addr_hi				  
	mov addr_lo,#chargging_type_addr_lo 			  
	lcall read_e2p_byte
	cjne a,#offline_charge,online_selected
    clr online_chargging
    jmp szv1
	online_selected:
	setb online_chargging
	szv1:

	mov addr_hi,#chargging_routine_addr_hi				  
	mov addr_lo,#chargging_routine_addr_lo 			  
	lcall read_e2p_byte
	cjne a,#manual_charge,check_auto
	
	manual_selected:
	clr chargging_routine
	clr push_to_talk
	jmp szv2
	check_auto:
	cjne a,#auto_charge,push_to_talk_selected
	setb chargging_routine 
	clr push_to_talk
	jmp szv2
	
	push_to_talk_selected:
	clr chargging_routine
	setb push_to_talk

	
	
	szv2:
	mov addr_hi,#answer_time_addr_hi				  
	mov addr_lo,#answer_time_addr_lo 			  
	lcall read_e2p_byte
	mov answer_time,a

	mov addr_hi,#charge_priority_addr_hi
	mov addr_lo,#charge_priority_addr_lo
	lcall read_e2p_byte
	cjne a,#00,its_post_charge
its_pre_charge:
	setb pre_charge
	jmp mogt1
its_post_charge:
	clr pre_charge
mogt1:
;++++++++++++++++++++++++++++++++++
;setb online_chargging
;clr chargging_routine
;setb pre_charge

ret
;------------------------------------------------

