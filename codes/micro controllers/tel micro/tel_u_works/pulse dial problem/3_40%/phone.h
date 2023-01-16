phone:
 	mov STATUS_FLAGS,#00h
    mov KEYBOARD_SCANNER,#63 
    mov DIALLED_COUNTER,#00h 

	setb line_sw
	setb card_sw	
	clr mic_mute ;
	setb tel_sw
	clr modem_sw
	setb lcd_sw

	lcall long_delay
	setb line_sw
	lcall initialize_lcd
	clr kolang
	clr valid_card 
 //;----------------------------------
	mov lang,#01
	;+++++++++++++++

	 mov ie,#00h
;clr bil
clr kolang
clr count_down_sw
	clr valid_card  
	

		mov call_type,#no_call
	   mov dialled_counter,#00h
	   clr access0
	   clr access1
	
		lcall initialize_volume

		lcall stop_online_chargging
		lcall stop_tic_tac
		clr answer_received
		lcall reset_call_duration
		mov pulse_count_lo,#00h
		mov pulse_count_hi,#00h
       lcall set_chargging_type ;
		mov free_call_status,#00h;0ffh 
		clr initial_account
		mov virt_account_hi,#00h
		mov virt_account_lo,#00h
clr FIRST_KEY   
clr card_status  
	;+++++++++++++++
		
   
lcall initialize_antitap

lcall load_event_time

;	lcall set_lcd_back_light
	lcall load_e2p_to_ram2

	mov pulse_count_hi,#00h	 ;
	mov pulse_count_lo,#00h	 ;
	clr answer_received		 ;
	
	lcall reload_serial_and_version
	
	lcall set_dialing_type
	lcall set_chargging_type ;
	lcall load_dialing_rule
	lcall load_phone_setting
	lcall load_paytol
	lcall load_chargging_zone
	lcall set_default_lang
	;mov lang,#default_lang
	mov KEYBOARD_SCANNER,#63

	lcall stop_tic_tac
	
;	setb ie.2
	setb ie.7

;	 lcall clear_lcd
;	 setb tel_sw	
lcall send_antitap_signal
;;;;;;;;;;;;;;;;;;;;;;;
lcall check_maintanence_card
mov a,state
cjne a,#maintanence_card_ok,continue_phone
lcall run_maintanence_routine
jmp continue_phone2				  
;;;;;;;;;;;;;;;;;;;;;;;
 continue_phone:
ijcv1:
	mov addr_hi,#phone_activity_level_addr_hi
	mov addr_lo,#phone_activity_level_addr_lo
	lcall read_e2p_byte
	cjne a,#170,check_free_access_level
	lcall show_out_of_order
	lcall long_delay
	lcall long_delay
	lcall bye3
check_free_access_level:
	cjne a,#180,check_full_but_no_emergency_key
	mov phone_access_level,#free_call
	 jmp gvzmp
check_full_but_no_emergency_key:
	cjne a,#190,full_access_level
	mov phone_access_level,#full_but_no_emergency_key
	 jmp gvzmp

full_access_level:
	mov phone_access_level,#00h
gvzmp:
 
// 



	lcall check_handset 
	lcall test_sam	;;;;"""""""""""""""""sam""""""
//   	lcall test_card_reader_short_connection

//	             
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov state,#normal_phone
    
	lcall initialize_volume
	lcall initialize_lcd  ;******
	lcall show_time
 	 lcall start_scheduling_dial_wait_time
	 mov call_type,#no_call
 	clr count_down_sw	
    lcall clear_dial_memory
	lcall reset_call_duration
	lcall start_scrolling_message

continue_phone2:	
;---------------------------------------
lcall set_key_bus
setb card_detect
lcall scan_keyboard

ret
