;--------------------------------------
check_key_row1:
test_key_1:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col1,refresh_key1
lcall key_1
jmp test_key_2
refresh_key1:
clr key1_pressed
;;;
test_key_2:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col2,refresh_key2
lcall key_2
jmp test_key_3
refresh_key2:
clr key2_pressed
;;;
test_key_3:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col3,refresh_key3
lcall key_3
jmp test_key_vol
refresh_key3:
clr key3_pressed
;;;
test_key_vol:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col4,test_key_lang
lcall key_vol
test_key_lang:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col5,test_key_rtc
lcall key_lang
test_key_rtc:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col6,out_check_key_row1
lcall q_key_rtc
out_check_key_row1:
ret
;---------------------------------------
check_key_row2:
test_key_4:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col1,refresh_key4
lcall key_4
jmp test_key_5
refresh_key4:
clr key4_pressed
;;;
test_key_5:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col2,refresh_key5
lcall key_5
jmp test_key_6
refresh_key5:
clr key5_pressed
;;;
test_key_6:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col3,refresh_key6
lcall key_6
jmp test_key_redial
refresh_key6:
clr key6_pressed
;;;
test_key_redial:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col4,test_key_police
lcall key_redial

test_key_police:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col5,test_key_door
lcall key_police
test_key_door:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col6,out_check_key_row2
lcall q_key_door

out_check_key_row2:
ret
;---------------------------------------
check_key_row3:
test_key_7:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col1,refresh_key7
lcall key_7
jmp test_key_8
refresh_key7:
clr key7_pressed
;;;
test_key_8:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col2,refresh_key8
lcall key_8
jmp test_key_9
refresh_key8:
clr key8_pressed
;;;
test_key_9:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col3,refresh_key9
lcall key_9
jmp test_key_flash
refresh_key9:
clr key9_pressed
;;;
test_key_flash:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col4,test_key_fire
lcall key_flash

test_key_fire:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col5,test_key_hook
lcall key_fire

test_key_hook:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col6,out_check_key_row3
lcall key_hook
out_check_key_row3:
ret
;---------------------------------------
check_key_row4:
test_key_star:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col1,test_key_0
lcall key_star
test_key_0:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
;;;
jb col2,refresh_key0
lcall key_0
jmp test_key_sharp
refresh_key0:
clr key0_pressed
;;;
test_key_sharp:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col3,test_key_help
lcall key_sharp
test_key_help:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col4,test_key_emergency 
lcall key_help

test_key_emergency:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col5,test_key_ring 
lcall key_urgent

test_key_ring:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col6,out_check_key_row4 
lcall q_key_ring

out_check_key_row4:
ret
;---------------------------------------
scan_keyboard:
//jb card_detect,no_card_detected
//   lcall card_insertion
//   jmp card_in
//no_card_detected:
//	lcall no_card
//card_in:
       
test_row1:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row1,clear_key_status_row1
lcall check_key_row1
jmp test_row2 
clear_key_status_row1:
clr key1_pressed
clr key2_pressed
clr key3_pressed
;--------
test_row2:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row2,clear_key_status_row2
lcall check_key_row2
jmp test_row3 
clear_key_status_row2:
clr key4_pressed
clr key5_pressed
clr key6_pressed
;--------
test_row3:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row3,clear_key_status_row3
lcall check_key_row3
jmp test_row4 
clear_key_status_row3:
clr key7_pressed
clr key8_pressed
clr key9_pressed
;--------
test_row4:
setb row1
setb row2
setb row3 
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row4,clear_key_status_row4
lcall check_key_row4
jmp scan_keyboard 
clear_key_status_row4:
clr key0_pressed
;--------
jmp scan_keyboard
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;  
key_0:
lcall line_hook_switch_test
ret 
;-------------------------------                       
key_1:
lcall test_spm_signal
ret                       
;-------------------------------
key_2:
lcall test_modem_dtmf
ret                        
;-------------------------------
key_3:
lcall test_modem_tones
ret                     
;-------------------------------
key_4:
lcall test_card_in_detector
ret                      
;-------------------------------
key_5:
lcall test_card_read_write
ret                      
;-------------------------------
key_6:
lcall e2p_read_write_test
ret                       
;-------------------------------
key_7:
lcall lcd_test
ret                      
;-------------------------------
key_8:
lcall lcd_power_switch_test
ret                       
;-------------------------------
key_9:
lcall buzz_test 
ret 
;-------------------------------------                   
key_star:
lcall card_power_switch_test
ret                      
;-------------------------------------
key_sharp:
lcall modem_power_switch_test
ret  
;-------------------------------------
key_redial:
lcall voice_test
ret    
;-------------------------------------
key_flash:
lcall mic_switch_test             
ret       
;-------------------------------------
key_lang:
lcall handset_detector_test
ret                         
;-------------------------------------
key_vol:
lcall rtc_test
ret    
;-------------------------------------
key_police:
lcall sam_operation_test
ret       
;-------------------------------------
key_urgent:
ret       
;-------------------------------------
key_fire:
ret     
;--------------------------------------
key_help:
clr ie.7
lcall bye3
ret 
;-------------------------------------
key_hook: 
lcall hook_detector_test
ret
;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------
;---------------------------------------------
q_key_rtc:
lcall reset_alarm_interrupt
lcall reset_alarm_interrupt
lcall clear_line_5
lcall show_test_ok
lcall jick_buzz
ret                       
;-------------------------------
q_key_door:
lcall door_detector_test					  
ret                       
;-------------------------------
q_key_ring:
//
ret                       
;-------------------------------
