;----------------------------------------
test_spm_signal:
lcall clear_lcd
lcall show_spm_signal
//CMX605 16KHz  --> CMX631 Detect
clr ie.7
	setb spm_int
	jnb spm_int,no_spm_signal

/////////////////
    mov A,#0D0H         ;addressing SETUP register
    mov B,#01010000b    ;01000000b
    lcall at_CMXcmdsync    ;
	 mov A,#0D1H         ;addressing MODE register
    mov B,#10000000b    ;
    lcall at_CMXcmdsync    ;

	lcall delay110m
	setb spm_int
	jb spm_int,no_spm_signal
lcall show_test_ok
lcall jick_buzz
jmp out_test_spm_signal
no_spm_signal:
lcall show_test_error
lcall attention_buzz
;;;;;;;;;;;;;;;;;
out_test_spm_signal:

    mov A,#0D0H         ;addressing SETUP register
    mov B,#00h    ;
    lcall at_CMXcmdsync 
	lcall delay110m  
setb ie.7
   lcall set_key_bus
ret
;----------------------------------------
test_modem_dtmf:
//CMX644 DTMF  -->  CMX605 Detect
clr line_sw
lcall clear_lcd
lcall show_modem_dtmf
setb modem_sw
lcall set_modem_bus
lcall CMXinit
;;;;;;;;;;;;;;;;;;;;;;
		mov B,#12
        ORL B,#11100000b                                       ;answer tone 2100 & Tone enabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
;;;;;;;;;;;;;;;;;;;;;;
     mov A,#0D0H         ;addressing SETUP register
    mov B,#00100000b    ;01000000b
    lcall at_CMXcmdsync    ;
	 mov A,#0D1H         ;addressing MODE register
    mov B,#00000000b    ;
    lcall at_CMXcmdsync    ;

lcall long_delay
mov a,#0dfh
lcall antitap_replysync
mov a,b
jnb acc.4,no_tone_detected
anl a,#00001111b
cjne a,#0001100b,no_tone_detected

lcall show_test_ok
lcall jick_buzz
jmp out_test_modem_dtmf
no_tone_detected:
lcall show_test_error
lcall attention_buzz

;;;;;;;;;;;;;;;;;;;;;;;;;;;
out_test_modem_dtmf:
 lcall set_modem_bus
        mov B,#10100000b                                       ;answer tone 2100 & Tone disabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
        lcall Delay31m                                        ;110ms Delay
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;
lcall set_key_bus
//
setb line_sw
ret
;----------------------------------------
test_modem_tones:
//CMX644 Modem Tones  -->  CMX644 Detect
 clr line_sw
lcall clear_lcd
lcall show_modem_tones
mov ie,#00h

setb modem_sw
lcall set_modem_bus
lcall CMXinit
;;;;;;;;;;;;;;;;;;;;;;

	 	mov A,#0E0H         ;addressing SETUP register
	    mov B,#00100011b    ;0 & Relaybit & Detector oFF & No Loop Back & 11.0592 Mhz Xtal
	    lcall CMXcmdsync    ;
		
		mov A,#0E2H         ;addressing GAIN CONTROL register
	    mov B,#00010000b           	;jadid 
	    lcall CMXcmdsync   

		mov A,#0E7H      ;addressing Tx PSK mode register
		mov B,#01000011b ;0 & Tx DualOutput Y/N & Scramb Unlock & Tx Scramb & EQ1 EQ0 & Tx Output Enable & Channel H/L
		lcall CMXcmdsync ;
		
		mov A,#0E8H      ;addressing Rx PSK mode register
		mov B,#01000011b ;0 & Call Progress BW & DeScramb Unlock & Rx DeScramb Y/N & EQ1 EQ0 & Rx Enable & Channel H/L
		lcall CMXcmdsync ;

		mov A,#0E1H         ;addressing Tx TONES register
    	mov B,#01000100b    ;	  2100 Hz
        lcall CMXcmdsync    ;		

 		lcall delay110m

		mov A,#0ECH
		lcall modem_replysync
		jnb B.3,no_answer_signal_detected

lcall jick_buzz
lcall show_test_ok
jmp out_test_modem_tone_internal

no_answer_signal_detected:
lcall show_test_error
lcall attention_buzz

out_test_modem_tone_internal:
setb modem_sw
lcall set_modem_bus
lcall long_delay		
lcall long_delay		
		
		mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#00000100b    ;
         lcall CMXcmdsync

lcall CMXinit
;;;;;;;;;;;;;;;;;;;;;;
clr modem_reply
clr modem_clk
clr modem_cs
clr modem_cmd
clr modem_sw
;;;;;;;
lcall set_key_bus
//setb ie.7
setb line_sw
ret
;----------------------------------------
test_card_reader_short_connection:
//test pin to pin short connection
mov ie,#00h
lcall set_card_bus
setb CARD_input
setb CARD_OUTPUT
lcall long_delay
clr CARD_OUTPUT
lcall short_delay
jnb CARD_input,l1_card_test
lcall show_test_ok
lcall jick_buzz
jmp out_test_card
l1_card_test:
lcall attention_buzz
lcall show_test_error
out_test_card:
lcall set_key_bus
ret
;----------------------------------------
test_card_in_detector:
lcall clear_lcd
lcall show_card_in
mov ie,#00h
//card in switch test
setb card_detect
jb card_detect,test_no_card_detected
lcall jick_buzz
lcall show_test_ok
jmp out_test_card_in_detector
test_no_card_detected:
lcall attention_buzz
lcall show_test_error
out_test_card_in_detector:

ret
;----------------------------------------
test_card_read_write:
lcall clear_lcd
lcall show_card_rw
mov ie,#00h
//write some thing in maintenance card and then read it 
lcall set_card_bus
mov zdata,#0aah
mov addr_hi,#0ffh
mov addr_lo,#0ffh
lcall Maintenance_save_to_e2p

mov addr_hi,#0ffh
mov addr_lo,#0ffh
lcall Maintenance_read_e2p_byte
cjne a,#0aah,test_card_read_write_error
lcall jick_buzz
lcall show_test_ok
jmp out_test_card_read_write
test_card_read_write_error:
lcall attention_buzz
lcall show_test_error
out_test_card_read_write:
lcall set_key_bus

ret
;----------------------------------------
door_detector_test:
lcall show_door_open
lcall jick_buzz
lcall delay2s
lcall clear_lcd
ret
;----------------------------------------
ring_detector_test:
ret			  
;----------------------------------------
hook_detector_test:
lcall clear_lcd
lcall show_hook_detect
lcall jick_buzz
lcall show_switch_on
lcall long_delay
ret
;----------------------------------------
buzz_test:
lcall clear_lcd
lcall show_buzzer_test
lcall test_buzz
lcall clear_lcd
ret
;----------------------------------------
e2p_read_write_test:
lcall clear_lcd
lcall show_e2p_rw

mov ie,#00h
//write some thing in e2o and then read it 
lcall set_card_bus
mov zdata,#0aah
mov addr_hi,#0ffh
mov addr_lo,#0ffh
lcall save_to_e2p

mov addr_hi,#0ffh
mov addr_lo,#0ffh
lcall read_e2p_byte
cjne a,#0aah,test_e2p_read_write_error
lcall jick_buzz
lcall show_test_ok
jmp out_test_e2p_read_write
test_e2p_read_write_error:
lcall attention_buzz
lcall show_test_error
out_test_e2p_read_write:
lcall set_key_bus

ret
;----------------------------------------
lcd_power_switch_test:
lcall clear_lcd
lcall show_lcd_power
jb card_check_policy,power_on_lcd_sw
power_off_lcd_sw:
  clr lcd_sw
  lcall show_switch_off
  jmp out_lcd_power_switch_test
power_on_lcd_sw:
  setb lcd_sw
  lcall show_switch_on
out_lcd_power_switch_test:
cpl card_check_policy
lcall long_delay
ret
;----------------------------------------
line_hook_switch_test:
 lcall clear_lcd
lcall show_line_hook
jb card_check_policy,power_on_line_hook_sw
power_off_line_hook_sw:
  clr line_sw
  lcall show_switch_off
  jmp out_line_hook_power_switch_test
power_on_line_hook_sw:
  setb line_sw
  lcall show_switch_on
out_line_hook_power_switch_test:
cpl card_check_policy
lcall long_delay

ret
;----------------------------------------
card_power_switch_test:
lcall clear_lcd
lcall show_card_power
jb card_check_policy,power_on_card_sw
power_off_card_sw:
  clr card_sw
  lcall show_switch_off
  jmp out_card_power_switch_test
power_on_card_sw:
  setb card_sw
  lcall show_switch_on
out_card_power_switch_test:
cpl card_check_policy
lcall long_delay
ret
;----------------------------------------
mic_switch_test:
lcall clear_lcd
lcall show_mic_mute
jb card_check_policy,power_on_mic_sw
power_off_mic_sw:
  clr mic_mute
  lcall show_switch_off
  jmp out_mic_power_switch_test
power_on_mic_sw:
  setb mic_mute
  lcall show_switch_on
out_mic_power_switch_test:
cpl card_check_policy
lcall long_delay
ret
;----------------------------------------

modem_power_switch_test:
lcall clear_lcd
lcall show_modem_power
jb card_check_policy,power_on_modem_sw
power_off_modem_sw:
  clr modem_sw
  lcall show_switch_off
  jmp out_modem_power_switch_test
power_on_modem_sw:
  setb modem_sw
  lcall show_switch_on
out_modem_power_switch_test:
cpl card_check_policy
lcall long_delay

ret
;----------------------------------------
;-----------------------------------------
lcd_test:
lcall set_lcd_bus
	mov LCD_COMMAND_BUF,#03eh
	lcall command_lcd
	mov LCD_COMMAND_BUF,#ROW_1
	
	mov TEXTURE_LENGTH,#8
  lcd_test_next_row:
	mov START_ROW,#64
	lcall command_lcd
  lcd_test_next_col:
    mov DISPLAY_BUF,#0ffh
	setb LCD_CS1
	setb LCD_CS2
	lcall display_lcd
	djnz START_ROW,lcd_test_next_col
	inc LCD_COMMAND_BUF
	djnz TEXTURE_LENGTH,lcd_test_next_row
	
	mov LCD_COMMAND_BUF,#03fh
	lcall command_lcd
lcall delay1s
lcall clear_lcd
lcall set_key_bus
ret
//;-----------------------------------------
voice_test:
lcall clear_lcd
lcall show_voice_test
clr ie.7
lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time
clr line_sw
setb modem_sw
lcall set_modem_bus
lcall CMXinit
;;;;;;;;;;;;;;;;;;;;;;

	 	mov A,#0E0H         ;addressing SETUP register
	    mov B,#00100011b    ;0 & Relaybit & Detector oFF & No Loop Back & 11.0592 Mhz Xtal
	    lcall CMXcmdsync    ;
		
		mov A,#0E2H         ;addressing GAIN CONTROL register
	    mov B,#01000100b           	;jadid 
	    lcall CMXcmdsync   

		mov A,#0E7H      ;addressing Tx PSK mode register
		mov B,#01000011b ;0 & Tx DualOutput Y/N & Scramb Unlock & Tx Scramb & EQ1 EQ0 & Tx Output Enable & Channel H/L
		lcall CMXcmdsync ;
		
		mov A,#0E8H      ;addressing Rx PSK mode register
		mov B,#01000011b ;0 & Call Progress BW & DeScramb Unlock & Rx DeScramb Y/N & EQ1 EQ0 & Rx Enable & Channel H/L
		lcall CMXcmdsync ;

		mov A,#0E1H         ;addressing Tx TONES register
    	mov B,#11000011b    ;	  2100 Hz
        lcall CMXcmdsync    ;		

lcall inc_volume
lcall delay1s
lcall inc_volume
lcall delay1s
lcall inc_volume
lcall delay1s
lcall inc_volume
lcall delay1s

//
	lcall set_modem_bus
lcall CMXinit
	
		mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#00000100b    ;
         lcall CMXcmdsync

//
setb line_sw
lcall set_key_bus

lcall clear_lcd

ret
//;-----------------------------------------
rtc_test:
lcall clear_lcd
 lcall show_rtc_test
lcall show_running

mov hour,#00h
mov minute,#00h
lcall set_clock
	   
mov a,#00h
mov b,#00h
lcall set_alarm

ret
//
//;-----------------------------------------
//keyboard_test:
//
//ret
//;------------------------------------------
inc_volume:
 mov a,state
               
    inc VOLUME_LEVEL
    inc VOLUME_LEVEL 
    mov r4,VOLUME_LEVEL
    cjne r4,#18,go_ahead
    mov VOLUME_LEVEL,#10
 go_ahead:  
    
    ;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;
    mov r4,VOLUME_LEVEL
volume_level_1:
    cjne r4,#10,volume_level_2
	clr volume0
	clr volume1
	jmp out_volume_level
volume_level_2:
    cjne r4,#12,volume_level_3
	setb volume0
	clr volume1
	jmp out_volume_level
volume_level_3:
    cjne r4,#14,volume_level_4
	clr volume0
	setb volume1
	jmp out_volume_level
volume_level_4:
    cjne r4,#16,out_volume_level
	setb volume0
	setb volume1
out_volume_level:   
   ;;;;;;;;;;;;;;;;;;;;;

	out_of_key_vol:
ret
;----------------------------
handset_detector_test:
lcall clear_lcd
lcall show_handset_det_test
lcall set_handset_check_bus
setb handset_chk_out
jb handset_chk_out,handset_detector_test_off
    lcall show_switch_on
	jmp out_handset_detector_test
handset_detector_test_off:
  lcall show_switch_off
out_handset_detector_test:
lcall jick_buzz
lcall set_key_bus
ret
;--------------------------
sam_operation_test:
mov ie,#00h
lcall clear_lcd
lcall show_sam_test
lcall set_sam_bus
push 00
push tmod
push th1
mov state,#sam_check
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr sam_addr_0
clr sam_addr_1
lcall read_sam_atr
	cjne a,#03fh,sam_atr_read_error	 
sam_read_ok:
lcall stop_sam_kill
lcall show_test_ok
//lcall jick_buzz
jmp	out_sam_operation_test
sam_atr_read_error:
lcall stop_sam_kill
lcall show_test_error
//lcall attention_buzz
out_sam_operation_test:
lcall stop_sam_kill
lcall set_key_bus
pop th1
pop tmod
pop 00
ret