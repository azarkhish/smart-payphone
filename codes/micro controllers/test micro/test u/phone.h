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
	
;jmp $

		mov call_type,#no_call
	   mov dialled_counter,#00h
	   clr access0
	   clr access1
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
		
   
    mov A,#01           ;applying General Reset
    mov B,#0            ;
    lcall at_CMXcmdsync 

lcall load_event_time

;//	lcall set_lcd_back_light
//	lcall load_e2p_to_ram2

	mov pulse_count_hi,#00h	 ;
	mov pulse_count_lo,#00h	 ;
	clr answer_received		 ;
//	lcall set_dialing_type
//	lcall set_chargging_type ;
//	lcall load_dialing_rule
	lcall load_phone_setting
//	lcall load_paytol 
//	lcall load_chargging_zone
	lcall set_default_lang
	;mov lang,#default_lang
	mov KEYBOARD_SCANNER,#63

	lcall stop_tic_tac
	
;	setb ie.2
	setb ie.7

;	 lcall clear_lcd
;	 setb tel_sw	

 continue_phone:



    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov state,#normal_phone
    
	lcall initialize_volume
	lcall initialize_lcd  ;******
	lcall show_fma_logo
	lcall delay1s
	lcall clear_lcd
 //	 lcall start_scheduling_dial_wait_time
	 mov call_type,#no_call
 	clr count_down_sw	
    lcall clear_dial_memory
	lcall reset_call_duration
//	lcall start_scrolling_message

continue_phone2:																 
;---------------------------------------
lcall set_key_bus
setb card_detect
lcall scan_keyboard

ret
