offline_decrease_account:
	push 01
	push 02
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		mov a,pulse_coef
fbct0: 
	lcall decrease_virtual_account
	lcall inc_pulse_count
	lcall add_to_paytemp
	djnz acc,fbct0

fbct1:

	lcall check_pay_overload
	mov a,overload
	cjne a,#00h,fbct2
	lcall cal_account		  
	jmp fbct3
fbct2:
	lcall decrease_card_account
	lcall reduce_from_paytemp
	jmp fbct1
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fbct3:
    pop 02
	pop 01
ret
;------------------------------------------------
schedule_offline_chargging:
 	push 01
	push 02
	                 mov TH1,#03ch
                     mov TL1,#0afh
					 
					 clr TR1

					 mov r1,t1_c1
					 djnz r1,out_timer1_2_x
					 mov r1,#20				;1 sec
					 mov r2,t1_c2
					 djnz r2,out_timer1_1_x
					   mov r2,time_slot
                    lcall  offline_decrease_account
					out_timer1_1_x:
					mov t1_c2,r2
					out_timer1_2_x:
					mov t1_c1,r1

  setb TR1
	pop 02
	pop 01		
ret
;------------------------------------------------
start_online_chargging:
setb ie.0
ret
;------------------------------------------------
stop_online_chargging:
clr ie.0
ret
;------------------------------------------------
start_offline_chargging:
  push acc

  lcall search_table
  jb search_table_failed,gtfh_er

  jmp gtfh_2

gtfh_er:

  lcall bye3
  jmp gtfh_1

gtfh_2:
 mov a,pulse_coef
 cjne a,#00h,hwdqa1
 lcall bye3
hwdqa1:
 mov a,time_slot
 cjne a,#00h,hwdqa2
 lcall bye3
hwdqa2:
 lcall show_call_time
 lcall calculate_offline_pulse_duration
 lcall set_chargging_time_slot	

 jnb pre_charge,tjk1
 lcall decrease_card_account
 lcall offline_decrease_account
 tjk1:

 mov a,TMOD
 orl a,#00010000B
 mov TMOD,a
 setb ie.3
 setb TR1
gtfh_1: 
 pop acc
ret
;------------------------------------------------
calculate_offline_pulse_duration:
mov a,time_slot
mov b,pulse_coef
div ab
mov pulse_duration,a
mov a,b
clr c
subb a,#6
jc uyewo1
inc pulse_duration
uyewo1:
ret
;------------------------------------------------
start_auto_charge:
mov a,call_type
cjne a,#free_call,dtfe1
jmp dtfe2
dtfe1:
mov ie,#00h
	setb ie.7
clr TR1
clr online_chargging;offline
clr answer_received
lcall spm_online
dtfe2:
ret
;------------------------------------------------
check_pay_overload:
	mov overload,#00h
	mov a,paytemp_lo
	mov r5,#00h
lbg1:
	mov temp,r5
	cjne a,temp,lbg2
	mov overload,#00h
	ret
lbg2:
	inc r5
	cjne r5,#50,lbg1
	mov overload,#01h
ret
;------------------------------------------------
spm_online:
setb tone_dialing;;;;;;;;;;;;;;;;;;
clr ie.7
mov a,call_type
cjne a,#free_call,sdfff
jmp sdf3
sdfff:
//jnb need_to_alert,sser1
//lcall alert_account_free
//jmp sdf3
//sser1:
jb latch_up_pulse_duration,sdf4
jnb answer_received,sdf4
setb latch_up_pulse_duration
sdf4:

	jb online_chargging,online_go_on
		jb answer_received,sdf3
			setb answer_received
			lcall start_tic_tac
			lcall end_scheduling_answer_time
			lcall stop_online_chargging
			lcall start_offline_chargging 	
		jmp sdf3
online_go_on:
    jb answer_received,sdf0
		setb answer_received
		lcall start_tic_tac
		lcall end_scheduling_answer_time
		lcall show_call_time
		jnb pre_charge,sdf3

	lcall decrease_card_account	;	  
;	 jmp sdf3					;;;;

sdf0:
	lcall decrease_virtual_account
	lcall inc_pulse_count
	lcall add_to_paytemp
sdf1:
	lcall check_pay_overload
	mov a,overload
	cjne a,#00h,sdf2
	lcall cal_account		  
	jmp sdf3
sdf2:
	lcall decrease_card_account		  
	lcall reduce_from_paytemp
	jmp sdf1
sdf3:

setb ie.7
ret
;------------------------------------------------
spm_offline:
clr ie.7
 jb answer_received,gpft23
 lcall schedule_answer_time
 jmp gpft55
 gpft23:
 setb tone_dialing;;;;;;;;;;;;;;;;;;
 lcall schedule_offline_chargging
 gpft55:
setb ie.7
ret
;------------------------------------------------
ltmr:
push acc
mov a,state
cjne a,#modem_condition,spm_offline_lbl
lcall schedule_guard_time
jmp out_timer2_lbl
spm_offline_lbl:
lcall spm_offline
out_timer2_lbl:
pop acc
ret
;------------------------------------------------
add_to_paytemp:
push acc
	clr c
	mov a,paytemp_lo
	add a,paytol_lo
	mov paytemp_lo,a
	mov a,paytemp_hi
	addc a,paytol_hi
	mov paytemp_hi,a
	clr c
pop acc
ret
;------------------------------------------------
reduce_from_paytemp:
	clr c
	mov a,paytemp_lo
	subb a,#50
	mov paytemp_lo,a
	mov a,paytemp_hi
	subb a,#00h
	mov paytemp_hi,a
	clr c
ret
;------------------------------------------------
load_paytol:
	push dph
	push dpl
	mov overload,#00
	mov paytemp_hi,#00
	mov paytemp_lo,#00

	mov dptr,#00h			 	;load internal e2p to paytol
	lcall read_internal_e2p
	mov paytol_hi,a
	mov dptr,#01h					 
	lcall read_internal_e2p
	mov paytol_lo,a		   

;	mov addr_hi,#PAYTOL_ADDR_HI				  
;	mov addr_lo,#PAYTOL_ADDR_LO 			  
;	lcall read_e2p_byte
;	cjne a,#UPDATE_MASK,dont_need_to_update_paytol
	
	mov zdata,#00h	 ;clr update mask
	lcall save_to_e2p					

	lcall inc_e2p_counter
	lcall read_e2p_byte
	mov  paytol_hi,a
	lcall inc_e2p_counter
	lcall read_e2p_byte
	mov  paytol_lo,a

	mov dptr,#00h			; save paytol in telmicro e2p	 	
	mov a,paytol_hi
	mov zdata,a
	lcall write_internal_e2p
	mov dptr,#01h			 
	mov a,paytol_lo
	mov zdata,a				 
	lcall write_internal_e2p

dont_need_to_update_paytol:
	mov paytol_hi,#00h
	mov paytol_lo,#047
pop dpl
pop dph	
ret
;------------------------------------------------
load_pre_num:
	lcall read_e2p_byte
	clr c
	add a,#16
	mov pre_1,a
	lcall inc_e2p_counter
	lcall read_e2p_byte
	clr c
	add a,#16	
	mov pre_2,a
	lcall inc_e2p_counter
	lcall read_e2p_byte
	clr c
	add a,#16	
	mov pre_3,a

	lcall inc_e2p_counter	;for extention(raghame 4om e pishshomare)
	 
	lcall inc_e2p_counter
	lcall read_e2p_byte	
	mov time_slot,a
 mov a,zone;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;iiiiiii
check_zone3:
cjne a,#3,check_zone2
zone3:
 	lcall inc_e2p_counter
 	lcall inc_e2p_counter
 	lcall inc_e2p_counter
	lcall read_e2p_byte	
	mov pulse_coef,a

jmp out_zone

check_zone2:
cjne a,#2,zone1
zone2:
 	lcall inc_e2p_counter
 	lcall inc_e2p_counter
	lcall read_e2p_byte	
	mov pulse_coef,a
jmp out_zone

zone1:
  	lcall inc_e2p_counter
	lcall read_e2p_byte	
	mov pulse_coef,a
out_zone:
	ret
;------------------------------------------------
load_chargging_zone:
push dpl
push dph
mov addr_hi,#00h
mov addr_lo,#06
lcall read_e2p_byte
anl a,#11100000b
rr a
rr a
rr a
rr a
rr a
mov b,#24
mul ab
add a,hour
mov dph,#022h
mov dpl,#088h
clr c
add a,dpl
mov dpl,a
mov a,dph
addc a,#00h
mov dph,a
mov addr_hi,a
mov a,dpl
mov addr_lo,a
lcall read_e2p_byte
mov zone,#1;a		   ;zone ra taghiir dadim
pop dph
pop dpl
ret
;------------------------------------------------
compare_field:				;return the result : pre_2=0aah  as true
							;				   : pre_2=0bbh	 as false 
	lcall load_pre_num
	
	mov a,pre_1				 ;
	cjne a,#2,bvcx1			 ;
	cjne a,031h,failed		 ;
	mov a,pre_2				 ;	 for 2digit pre_num such as 0(21)
	cjne a,#1,bvcx1			 ;
	cjne a,032h,failed		 ;
	jmp strike				 ;
bvcx1:	
	mov a,pre_1
	cjne a,031h,failed
	mov a,pre_2
	cjne a,032h,failed
	mov a,pre_3
	cjne a,033h,failed
strike:	 
	mov pre_2,#0aah	 
	jmp bvcx2
failed:
	mov pre_2,#0bbh
bvcx2:
ret
;--------------------------------------------------
search_table:
   push 01
   clr search_table_failed
   mov addr_hi,#OFF_CHARGE_TABLE_HI
   mov addr_lo,#OFF_CHARGE_TABLE_LO
   mov r1,#1

   mov a,#016 
   cjne a,030h,rdtg4
   jmp rdtg1
rdtg4:	
						  ;dakhele shahri
   lcall load_pre_num
   jmp rdtg3
rdtg1:
   inc r1
   cjne r1,#121,rdtg2		  ;counter of offline chargging table fields
   setb search_table_failed
   jmp rdtg3
rdtg2:
   lcall compare_field
   lcall inc_e2p_counter
;'''''''''''''''''''''''''''''''''''''
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   lcall inc_e2p_counter
   
   mov a,zone
   cjne a,#3,khtr1
   jmp khtr3
   khtr1:
   lcall inc_e2p_counter
   mov a,zone
   cjne a,#2,khtr2
    jmp khtr3
	khtr2:
   lcall inc_e2p_counter
	khtr3:
;'''''''''''''''''''''''''''''''''''''
   mov a,pre_2
   cjne	a,#0aah,rdtg1
rdtg3:   
   pop 01
ret
;----------------------------------------------------
set_chargging_time_slot:
  mov t1_c1,#20	
  mov a,time_slot
  mov t1_c2,a;;;	 
  
  mov TH1,#03ch
  mov TL1,#0afh

ret
;;;;
;------------------------------------------------
 schedule_answer_time:
 	push 01
	push 02
	jnb FIRST_KEY,yuhg1
	jnb access0,yuhg1
	                 mov TH1,#03ch
                     mov TL1,#0afh
					 
					 setb TR1
					 mov r1,t1_c1
					 djnz r1,out_timer1_2
					 mov r1,#20	
					 mov r2,t1_c2
					 djnz r2,out_timer1_1
					 jb chargging_routine,its_auto_chargging 
		its_manual_chargging:
					lcall bye3
		its_auto_chargging:
					lcall start_auto_charge
					jmp uytr1
					out_timer1_1:
					mov t1_c2,r2
					out_timer1_2:
					mov t1_c1,r1
jmp uytr1
yuhg1:
	                 mov TH1,#03ch
                     mov TL1,#0afh
					 
					 setb TR1
					 mov r1,t1_c1
					 djnz r1,out_timer1_2f
					 mov r1,#20
					 mov r2,t1_c2
					 djnz r2,out_timer1_1f
					  lcall bye3

					jmp uytr1
					out_timer1_1f:
					mov t1_c2,r2
					out_timer1_2f:
					mov t1_c1,r1


uytr1:
	pop 02
	pop 01		
 ret
 ;------------------------------------------------
 start_scheduling_answer_time:
 push acc
 clr answer_received
 mov t1_c1,#20
 mov a,answer_time
 mov t1_c2,a  ;har vahed az t1_c2 =1 sec 
 mov TH1,#03ch
 mov TL1,#0afh
 mov a,TMOD
 orl a,#00010000B
 mov TMOD,a
  setb ie.3
  setb TR1
 pop acc
 ret
;------------------------------------------------
end_scheduling_answer_time:
mov state,#normal_phone
clr  TR1
clr ie.3
ret
 ;------------------------------------------------
 start_scheduling_dial_wait_time:
 push acc
 clr FIRST_KEY
 mov t1_c1,#20
 mov addr_hi,#dial_wait_addr_hi
 mov addr_lo,#dial_wait_addr_lo
 lcall read_e2p_byte
 mov t1_c2,a  ;har vahed az t1_c2 =1 sec 
 mov TH1,#03ch
 mov TL1,#0afh
 mov a,TMOD
 orl a,#00010000B
 mov TMOD,a
  setb ie.3
  setb TR1
 pop acc
 ret
;------------------------------------------------
end_scheduling_dial_wait_time:
mov state,#normal_phone
clr  TR1
clr ie.3
ret

;-------------------------------------------------
inc_pulse_count:
	push dpl
	push dph
	mov dpl,pulse_count_lo
	mov dph,pulse_count_hi
	inc dptr
	mov pulse_count_hi,dph
	mov pulse_count_lo,dpl
	pop dph
	pop dpl
ret
;----------------------------
