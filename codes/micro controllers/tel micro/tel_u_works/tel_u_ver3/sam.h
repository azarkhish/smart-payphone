;-----------------------------------
inverse_convertion:
cpl a
mov b,a
clr a
s0:
jnb b.0,s1
setb acc.7
s1:
jnb b.1,s2
setb acc.6
s2:
jnb b.2,s3
setb acc.5
s3:
jnb b.3,s4
setb acc.4
s4:
jnb b.4,s5
setb acc.3
s5:
jnb b.5,s6
setb acc.2
s6:
jnb b.6,s7
setb acc.1
s7:
jnb b.7,s8
setb acc.0
s8:
ret
;;;;;;;;;;;;;;;;;;;;;
test_sam:
;call end_scheduling_dial_wait_time
;call end_scheduling_answer_time
push 00
push tmod
push th1
check_sam_1:
mov state,#sam_check
mov addr_hi,#sam1_addr_hi
mov addr_lo,#sam1_addr_lo
lcall read_e2p_byte
jz check_sam_2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr sam_addr_0
clr sam_addr_1
lcall read_sam_atr
	cjne a,#03fh,no_sam	 
yes_sam1:
lcall stop_sam_kill
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_sam_2:
mov state,#sam_check
mov addr_hi,#sam2_addr_hi
mov addr_lo,#sam2_addr_lo
lcall read_e2p_byte
jz check_sam_3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
setb sam_addr_0
clr sam_addr_1
	lcall read_sam_atr
	cjne a,#03fh,no_sam	
 
yes_sam2:
lcall stop_sam_kill
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_sam_3:
mov state,#sam_check
mov addr_hi,#sam3_addr_hi
mov addr_lo,#sam3_addr_lo
lcall read_e2p_byte
jz check_sam_4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clr sam_addr_0
setb sam_addr_1
lcall read_sam_atr
	cjne a,#03fh,no_sam	 
yes_sam3:
lcall stop_sam_kill
check_sam_4:
mov state,#sam_check
mov addr_hi,#sam4_addr_hi
mov addr_lo,#sam4_addr_lo
lcall read_e2p_byte
jz out_sam_test
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
setb sam_addr_0
setb sam_addr_1
lcall read_sam_atr
	cjne a,#03fh,no_sam	 
yes_sam4:
lcall stop_sam_kill


//
jmp out_sam_test
no_sam:

lcall stop_sam_kill
lcall clear_lcd
lcall show_out_of_order
lcall delay2s
;;
lcall bye3
out_sam_test:
lcall stop_sam_kill
lcall set_key_bus
pop th1
pop tmod
pop 00
ret
;;;;;;;;;;;;;;;;;;;
start_sam_kill:
mov t2_c2,#1;;;;;;;;60
mov t2_c1,#5
mov TH2,#03ch
mov TL2,#0afh
mov T2MOD,#00000000B
clr exf2
setb TR2
setb ie.7
setb ie.5
ret
;----------------------------------------------------
stop_sam_kill:
clr ie.5
clr TR2
mov t2_c2,#1	
mov t2_c1,#5;
mov TH2,#03ch
mov TL2,#0afh
mov T2MOD,#00000000B
clr exf2
ret
;----------------------------------------------------
read_sam_atr:
lcall set_sam_bus
lcall start_sam_kill
	clr sam_reset
	lcall delay110m
	setb sam_reset

	 mov tmod,#20h
	 mov th1,#0fdh;-3;
	 mov scon,#50h
     setb tr1
 	recv3:
	jnb ri,recv3
    mov a,sbuf
	clr ri
	clr tr1
	lcall inverse_convertion
ret
;----------------
sam_kill:
 	push 01
	push 02		

					 mov TH2,#03ch
					 mov TL2,#0afh
					 
					 mov r1,t2_c1
					 djnz r1,out_timer1_2_h
					 lcall clear_lcd
						lcall show_out_of_order
						lcall delay2s
						//;;
	mov temp,#sam_event
	lcall save_other_event_report

	lcall mini_flash
//TODO  :check if its an emergency condition 
;;;
mov addr_hi,#emergency_map_addr_hi
mov addr_lo,#emergency_map_addr_lo
lcall read_e2p_byte
anl a,#sam_mask
jz out_9yg

lcall emergency_mode
out_9yg:

						lcall bye3

					out_timer1_2_h:


					mov t2_c1,r1
	 clr tf2

	pop 02
	pop 01
ret
;;;;;;;;;;;;;;-------------------------------
