mini_flash:
mov ie,#00h
clr mic_mute ;
clr card_sw;;
clr lcd_sw
lcall long_delay 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr line_sw  
lcall delay_flash
setb line_sw
lcall long_delay
lcall send_antitap_signal
lcall long_delay

ret
;------------------------------------------------
imidiate_flash:
mov ie,#00h
;clr bil
clr kolang
clr count_down_sw	
 	clr valid_card  
		mov call_type,#no_call
	   jb access0,tyfre1i
	   mov dialled_counter,#00h
	tyfre1i:
	   clr access0
	   clr access1
		lcall stop_online_chargging
		lcall stop_tic_tac
		clr answer_received
		lcall end_scheduling_answer_time
	    clr show_time_sw
		lcall save_report

			mov free_call_status,#00h;0ffh

		lcall reset_call_duration
clr initial_account
mov virt_account_hi,#00h
mov virt_account_lo,#00h

		mov pulse_count_lo,#00h
		mov pulse_count_hi,#00h
       lcall set_chargging_type ;

clr FIRST_KEY   
lcall load_paytol
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lcall clear_line_8
lcall clear_line_7
lcall clear_line_5
lcall clear_line_6

clr mic_mute ;
clr card_sw;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr line_sw  
lcall delay_flash
setb line_sw
;;;;;;;;;;;;;;;;;;;;;;;;
lcall send_antitap_signal
 setb card_sw
clr card_status
lcall start_scheduling_dial_wait_time
lcall set_dialing_type
lcall load_event_time	
	lcall show_time
	lcall start_scrolling_message
	setb ie.7
ret
;------------------------------------------------
flash: 
mov ie,#00h
;clr bil
clr kolang
clr count_down_sw
	clr valid_card  
		mov call_type,#no_call
	   jb access0,tyfre1
	   mov dialled_counter,#00h
	tyfre1:
	   clr access0
	   clr access1
		lcall stop_online_chargging
		lcall stop_tic_tac
		clr answer_received
		lcall end_scheduling_answer_time
	    clr show_time_sw
		lcall save_report

		mov free_call_status,#00h;0ffh

		lcall reset_call_duration
clr initial_account
mov virt_account_hi,#00h
mov virt_account_lo,#00h

		mov pulse_count_lo,#00h
		mov pulse_count_hi,#00h
       lcall set_chargging_type ;
		 
	mov a,state
	cjne a,#normal_phone,back_to_main_state2
	jmp your_in_main_state_2
back_to_main_state2:
		lcall return_to_main_state 
your_in_main_state_2:

clr FIRST_KEY   
lcall load_paytol
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lcall clear_message
lcall show_please_wait

lcall clear_line_8
lcall clear_line_7
lcall clear_line_5
lcall clear_line_6

clr card_sw;;"""""""""""""""""""""""""""""""""""""""
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr line_sw  
lcall delay_flash
setb line_sw
;;;;;;;;;;;;;;;;;;;;;;;;
lcall send_antitap_signal
setb card_sw 
lcall clear_line_2         
;;;;;;;;;;;;;;;;;;;;;;;;
clr card_status  
lcall start_scheduling_dial_wait_time
lcall set_dialing_type
lcall load_event_time
	lcall show_time
	lcall start_scrolling_message

setb ie.7

ret
;-------------------------------------
card_insertion:
mov a,state
jnb acc.7,continue_card_insertion ;bit 7 of state = maintenance
jmp out_card_insertion
continue_card_insertion:
   push start_col
	
	jb kolang,out_card; only one time run cal_account
	setb kolang
	mov a,state
//	cjne a,#count_down_mode,vfqp1
//		 	lcall clear_lcd
//			lcall cal_account
//			;;;;;;;;;;;;;;;;;;;;
//			mov a,current_account_hi
//			mov  primary_account_hi,a
//			mov a,current_account_lo
//			mov  primary_account_lo,a
//			;;;;;;;;;;;;;;;;;;;;
//			jnb card_status,ifte1
//		 	lcall bye3
//		 ifte1:
////			jnb need_to_alert,ifte2 
////		 	lcall bye2
////		 ifte2:
//		 	mov state,#normal_phone
//		 	clr count_down_sw	
//			lcall save_card_info
//			lcall check_black_white_condition
//			lcall authenticate 
//			;setb mic_mute
//			jmp out_card
// vfqp1:
   	jb ACCESS0,out_card	
	jb CARD_STATUS,out_card	 

	lcall save_card_info
 	lcall check_black_white_condition
	lcall authenticate 
	
	  
	   mov a,state
	   cjne a,#normal_phone,back_to_main_state1
	   	jmp your_in_main_state_1
back_to_main_state1:
	lcall exit_to_main_state
your_in_main_state_1:
    lcall cal_account
	lcall check_card_account_limit	
   
	;;;;;;;;;;;;;;;;;;;;
			mov a,current_account_hi
			mov  primary_account_hi,a
			mov a,current_account_lo
			mov  primary_account_lo,a
	;;;;;;;;;;;;;;;;;;;;  
	
	jb card_status,mkhg1
;	jb FIRST_KEY,mkhg1
	jb dial_num_sw,mkhg1    
	
	lcall show_dial_num
mkhg1:	
	clr FIRST_KEY
  out_card:	
  
  pop start_col
out_card_insertion:
ret
;-------------------------------------
no_card:
mov a,state
cjne a,#maintanence_card_ok,continue_no_card
jmp out_no_card
continue_no_card:
   mov a,call_type
   cjne a,#free_call,yyfgq1
   setb mic_mute ;
   jmp out_no_card
yyfgq1:   
   clr mic_mute	 ;
   clr kolang
	jnb ACCESS0,out_no_card1
	 jmp terg12
out_no_card1:
	
	jb CARD_STATUS,terg13
	lcall show_insert_card_pls
	 jmp out_no_card

terg12:
clr ACCESS0
clr ACCESS1
mov a,state		   ;
//cjne a,#count_down_mode,sdhrk1  ;
//clr card_status	   ;
//clr mic_mute   ;
//jmp	out_no_card	   ;
//sdhrk1:			   ;

mov a,state
 cjne a,#normal_phone,rtt1 
lcall flash                  
jmp terg13
rtt1:
lcall return_to_main_state                 
lcall flash

terg13:
	clr CARD_STATUS		
    mov a,state
    cjne a,#normal_phone,dont_clear_lcd
				 
	 lcall clear_line_2
	 lcall clear_line_3
	 lcall clear_line_4
	 lcall clear_line_5
	 lcall clear_line_6
dont_clear_lcd:
	lcall show_insert_card_pls
out_no_card:
ret				
;-------------------------------------
next_number: 
	jb FIRST_KEY,not_first
	lcall clear_line_7
	lcall clear_line_8
	lcall clear_message
	;;;;;;;;;;;;;;;;;
	mov START_ROW,#ROW_7 
	mov START_COL,#120   
	setb FIRST_KEY
	clr LCD_CS  ; left 
	mov DIALLED_COUNTER,#1
	lcall clear_dial_memory  
	jnb access0,bcee1
	
	lcall end_scheduling_dial_wait_time
	lcall start_scheduling_answer_time
	lcall start_online_chargging

//	mov a,call_type
//	cjne a,#free_call,bcee1
//	mov call_type,#common_call	;;;;;;;;????????????
 bcee1:
	ret
  not_first:
	
	mov a,DIALLED_COUNTER	//t
	clr c					// t
	subb a,#16				//	t
	jb acc.7,countinue_bbb	//	 t
	jmp countinue_aaa		//	  t
  countinue_bbb:			//	   t

	inc DIALLED_COUNTER
	 							 //	test
	countinue_aaa:				//	t
	mov START_ROW,#ROW_7
	mov a,START_COL
	clr c
	subb a,#8
	mov START_COL,a
	cjne a,#56,same_pos
	cpl LCD_CS ;right
	mov START_COL,#120
  same_pos:
    
	cjne DIALLED_COUNTER,#16,countinue
//	clr FIRST_KEY	off charge test
  countinue:
  clr dial_num_sw
ret
;-------------------------------------
add_memory:
	push 00  
	mov a,DIALLED_COUNTER
	clr c
	subb a,#17
	jb acc.7,free_mem
	jmp uheq1
  free_mem:	
    mov a,#02fh
	add a,DIALLED_COUNTER
	mov r0,a 
	mov a,DIAL_BUF
	mov @r0,a
uheq1:
pop 00
ret
;-------------------------------------
return_to_main_state:
mov state,#normal_phone
;clr  TR0
;clr ie.1
 lcall refresh_main_state_screen
ret
;---------------------------------------
exit_to_main_state:
mov state,#normal_phone
;clr  TR0
;clr ie.1
ret
;----------------------------
search_in_free_nums:
push 06;--->push DIALLED_COUNTER
push b
push 02
push 00
mov addr_hi,#free_nums_table_addr_hi	
mov addr_lo,#free_nums_table_addr_lo
mov free_call_num_index,#01

tfc1:
mov r0,#30h	
mov r2,06  ;r2 <-- r6
gyf2:
lcall mid_delay
lcall read_e2p_byte
lcall mid_delay
add a,#16
mov b,@r0
cjne a,b,gyf1
inc r0
lcall inc_e2p_counter
djnz r2,gyf2
lcall mid_delay
lcall read_e2p_byte
lcall mid_delay
cjne a,#0ffh,just_matched
striked:
mov free_call_status,#0ffh
jmp poxcm1
gyf1: 

lcall go_to_next_free_num
inc free_call_num_index
mov a,free_call_num_index
cjne a,#21,tfc1
does_not_matched:
mov free_call_status,#00h
jmp poxcm1
just_matched:
mov free_call_status,#0aah
poxcm1:
pop 00
pop 02
pop b
pop 06
ret
;--------------------------------------------------------------
go_to_next_free_num:
push 02
push 01
mov addr_hi,#free_nums_table_addr_hi	
mov addr_lo,#free_nums_table_addr_lo
mov r1,free_call_num_index
zdrt2:
mov r2,#12
zdrt1:
lcall inc_e2p_counter
djnz r2,zdrt1
djnz r1,zdrt2
pop 01
pop 02
ret
;---------------------------------------
;---------------------------------------
manage_incomming_call:
setb line_sw
mov addr_hi,#ring_manage_addr_hi
mov addr_lo,#ring_manage_addr_lo
lcall read_e2p_byte
cjne a,#160,normal_manage_incomming_call

pms_manage_incomming_call:
lcall answer_mode
lcall bye3
normal_manage_incomming_call:
	lcall attention_buzz
	lcall delay2s
	lcall attention_buzz
	lcall delay1s
	
	lcall send_antitap_signal
   
   setb lcd_sw
   lcall initialize_lcd
	lcall clear_lcd
lcall show_incomming_call

loop_check_hook_incomming:
setb row1
setb row2
setb row3
setb row4
clr col6
setb col1
setb col2
setb col3
setb col4
setb col5
jnb row3,off_hook_incomming_call
jmp loop_check_hook_incomming
off_hook_incomming_call:	
lcall bye3
ret
;-----------------------------------------
door_is_open:
   setb lcd_sw
   lcall initialize_lcd
	lcall clear_lcd
	lcall show_door_open
	lcall notice_buzz
	mov temp,#door_event
	lcall save_other_event_report
	lcall delay2s
	lcall clear_lcd

	lcall mini_flash
//TODO  :check if its an emergency condition 
;;;
mov addr_hi,#emergency_map_addr_hi
mov addr_lo,#emergency_map_addr_lo
lcall read_e2p_byte
anl a,#door_mask
jz out_7yg

;;;		
	lcall emergency_mode
out_7yg:
	lcall bye3
ret
;----------------------------------------
bye3:
	lcall reset_alarm_interrupt
	lcall set_modem_bus
	lcall CMXinit
clr ie.7
clr voice_sw
;clr line_sw 
clr modem_sw
lcall clear_lcd
lcall long_delay
lcall long_delay
lcall long_delay
clr lcd_sw
clr tel_sw
jmp $
ret 
;------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
reload_serial_and_version:
push dph
push dpl
push acc
	    mov addr_hi,#00h
		mov addr_lo,#00h
		mov zdata,#00h
		lcall write_to_e2p

	    mov addr_hi,#00h
		mov addr_lo,#01h
		 mov dptr,#425
		   clr a
		 movc a,@a+dptr
		mov zdata,a
		lcall write_to_e2p

	    mov addr_hi,#00h
		mov addr_lo,#02h
		mov dptr,#426
		   clr a
		 movc a,@a+dptr
		mov zdata,a
		lcall write_to_e2p

	    mov addr_hi,#00h
		mov addr_lo,#03h
		mov dptr,#427
		   clr a
		 movc a,@a+dptr
		mov zdata,a
		lcall write_to_e2p

	    mov addr_hi,#00h
		mov addr_lo,#04h
		mov dptr,#428
		   clr a
		 movc a,@a+dptr
		mov zdata,a
		lcall write_to_e2p
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	  
	    mov addr_hi,#software_version_addr_hi
		mov addr_lo,#software_version_addr_lo
		mov dptr,#429
		   clr a
		 movc a,@a+dptr
		mov zdata,a
		lcall write_to_e2p
pop acc
pop dpl
pop dph
ret
;-------------------------------------------------
reload_payphone_serial_to_isp_e2p:
push acc
push dpl
push dph
	    mov addr_hi,#01h
		mov addr_lo,#0a9h
		 mov dptr,#425
		   clr a
		 movc a,@a+dptr
		cpl a
		mov zdata,a
		lcall isp_write_to_e2p

	    mov addr_hi,#01h
		mov addr_lo,#0aah
		mov dptr,#426
		   clr a
		 movc a,@a+dptr
		cpl a
		mov zdata,a
		lcall isp_write_to_e2p

	    mov addr_hi,#01h
		mov addr_lo,#0abh
		mov dptr,#427
		   clr a
		 movc a,@a+dptr
		cpl a
		mov zdata,a
		lcall isp_write_to_e2p

	    mov addr_hi,#01h
		mov addr_lo,#0ach
		mov dptr,#428
		   clr a
		 movc a,@a+dptr
		cpl a
		mov zdata,a
		lcall isp_write_to_e2p
pop dph
pop dpl
pop acc
ret
