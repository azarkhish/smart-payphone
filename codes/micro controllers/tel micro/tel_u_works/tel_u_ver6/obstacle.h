//;----------------------------------------
//test_card_reader_short_connection:
////test pin to pin short connection
//mov ie,#00h
//lcall set_card_bus
//setb CARD_input
//setb CARD_OUTPUT
//lcall short_delay
//clr CARD_OUTPUT
//lcall short_delay
//jnb CARD_input,l1_card_test
//jmp out_test_card
//l1_card_test:
/////////////////////////
//clr card_sw
//lcall show_out_of_order
//lcall long_delay
//lcall long_delay
//lcall long_delay
//lcall clear_lcd
//
//	mov temp,#card_reader_event
//	lcall save_other_event_report
//			   
////TODO  :check if its an emergency condition 
//;;;
//mov addr_hi,#emergency_map_addr_hi
//mov addr_lo,#emergency_map_addr_lo
//lcall read_e2p_byte
//anl a,#card_mask
//jz out_9cjhy
//
//	lcall emergency_mode
//out_9cjhy:
//lcall bye3
//
/////////////////////////
//out_test_card:
//lcall set_key_bus
//ret
//;----------------------------------------
check_handset:
lcall set_handset_check_bus
setb handset_chk_out
jb handset_chk_out,handset_damaged
jmp swd1
handset_damaged:
lcall show_handset_damaged
lcall long_delay
lcall long_delay
lcall long_delay
lcall clear_lcd

	mov temp,#handset_event
	lcall save_other_event_report

//TODO  :check if its an emergency condition 
;;;
mov addr_hi,#emergency_map_addr_hi
mov addr_lo,#emergency_map_addr_lo
lcall read_e2p_byte
anl a,#handset_mask
jz out_8yg

;;;		
	lcall emergency_mode
out_8yg:


lcall bye3
swd1:
lcall set_key_bus
ret
;---------------------------
