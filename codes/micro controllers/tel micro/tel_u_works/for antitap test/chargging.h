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
	push 03
	                 mov TH1,#0ech//03ch
                     mov TL1,#077h//0afh
					 
					 clr TR1

					 mov r1,t1_c1
					 djnz r1,out_timer1_2_x
					 mov r1,#2				;10 mili sec
					 
					 mov r2,t1_c2
					 mov r3,t1_c3

					 lcall dec_r3_r2
					 cjne r2,#00,out_timer1_1_x
					 cjne r3,#00,out_timer1_1_x

					   mov r2,time_slot_lo
					   mov r3,time_slot_hi
					lcall  offline_decrease_account
					out_timer1_1_x:
					mov t1_c2,r2
					mov t1_c3,r3
					
					out_timer1_2_x:
					mov t1_c1,r1

  setb TR1
  	pop 03
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
   
   push ie
   mov ie,#00h
  lcall load_charge_level_from_pre_num
  lcall load_pulse_and_timeslot_from_zone_and_level
  pop ie
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
 mov a,time_slot_lo
 cjne a,#00h,hwdqa2
 mov a,time_slot_hi
 cjne a,#00h,hwdqa2

 lcall bye3
hwdqa2:
 lcall show_call_time
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
//calculate_offline_pulse_duration:
//mov a,time_slot
//mov b,pulse_coef
//div ab
//mov pulse_duration,a
//mov a,b
//clr c
//subb a,#6
//jc uyewo1
//inc pulse_duration
//uyewo1:
//ret
;------------------------------------------------
start_auto_charge:
clr ie.1
mov a,call_type
cjne a,#free_call,dtfe1
jmp dtfe2
dtfe1:
mov ie,#00h
	setb ie.7
clr TR1
clr online_chargging///;offline	selected
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
load_pre_num:
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre1
	jmp pre1_is_ff
next_pre1:
	clr c
	add a,#16
pre1_is_ff:
	mov pre_1,a
	
	lcall inc_e2p_counter
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre2
	jmp pre2_is_ff
next_pre2:
	clr c
	add a,#16	
pre2_is_ff:
	mov pre_2,a
	
	lcall inc_e2p_counter
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre3
	jmp pre3_is_ff
next_pre3:
	clr c
	add a,#16	
pre3_is_ff:
	mov pre_3,a

	lcall inc_e2p_counter
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre4
	jmp pre4_is_ff
next_pre4:
	clr c
	add a,#16	
pre4_is_ff:
	mov pre_4,a

	lcall inc_e2p_counter
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre5
	jmp pre5_is_ff
next_pre5:
	clr c
	add a,#16	
pre5_is_ff:
	mov pre_5,a

	lcall inc_e2p_counter
	lcall read_e2p_byte
	cjne a,#0ffh,next_pre6
	jmp pre6_is_ff
next_pre6:
	clr c
	add a,#16	
pre6_is_ff:
	mov pre_6,a
	
;-------------------
	lcall inc_e2p_counter

	ret
;------------------------------------------------
load_chargging_zone:
lcall rtc_date_to_index
lcall find_day_type_from_day_index
lcall find_chargging_zone_from_day_type
ret
;------------------------------------------------
compare_field:				
push acc
push 00	
check_from_field:
lcall load_pre_num

pre1_f_start:
mov a,pre_1
cjne a,#0ffh,chk_pre1_f 
jmp failed_from
chk_pre1_f:
mov r0,#031h
mov a,@r0
clr c
subb a,pre_1   
jnc pre2_f_start
jmp failed_from
pre2_f_start:
mov a,pre_2
cjne a,#0ffh,chk_pre2_f 
jmp check_to_field
chk_pre2_f:
mov r0,#032h
mov a,@r0
clr c
subb a,pre_2   
jnc pre3_f_start
jmp failed_from

pre3_f_start:
mov a,pre_3
cjne a,#0ffh,chk_pre3_f 
jmp check_to_field
chk_pre3_f:
mov r0,#033h
mov a,@r0
clr c
subb a,pre_3   
jnc pre4_f_start
jmp failed_from

pre4_f_start:
mov a,pre_4
cjne a,#0ffh,chk_pre4_f 
jmp check_to_field
chk_pre4_f:
mov r0,#034h
mov a,@r0
clr c
subb a,pre_4   
jnc pre5_f_start
jmp failed_from

pre5_f_start:
mov a,pre_5
cjne a,#0ffh,chk_pre5_f 
jmp check_to_field
chk_pre5_f:
mov r0,#035h
mov a,@r0
clr c
subb a,pre_5   
jnc pre6_f_start
jmp failed_from

pre6_f_start:
mov a,pre_6
cjne a,#0ffh,chk_pre6_f 
jmp check_to_field
chk_pre6_f:
mov r0,#036h
mov a,@r0
clr c
subb a,pre_6   
jc failed_from

check_to_field:
lcall load_pre_num

mov a,pre_1
cjne a,#0ffh,chk_pre1_t 
jmp failed_to
chk_pre1_t:
mov a,pre_1
clr c
subb a,031h   
jc failed_to

mov a,pre_2
cjne a,#0ffh,chk_pre2_t 
jmp strike
chk_pre2_t:
mov a,pre_2
clr c
subb a,032h   
jc failed_to

mov a,pre_3
cjne a,#0ffh,chk_pre3_t 
jmp strike
chk_pre3_t:
mov a,pre_3
clr c
subb a,033h   
jc failed_to

mov a,pre_4
cjne a,#0ffh,chk_pre4_t 
jmp strike
chk_pre4_t:
mov a,pre_4
clr c
subb a,034h   
jc failed_to

mov a,pre_5
cjne a,#0ffh,chk_pre5_t 
jmp strike
chk_pre5_t:
mov a,pre_5
clr c
subb a,035h   
jc failed_to

mov a,pre_6
cjne a,#0ffh,chk_pre6_t 
jmp strike
chk_pre6_t:
mov a,pre_6
clr c
subb a,036h   
jc failed_to

strike:	 

	lcall read_e2p_byte	
	mov charge_level,a

	jmp bvcx2
failed_from:
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
failed_to:
bvcx2:				 
lcall inc_e2p_counter

pop 00
pop acc
ret
;--------------------------------------------------
inc_r2_r1:
push dph
push dpl
mov dph,r2
mov dpl,r1
inc dptr
mov r1,dpl
mov r2,dph
pop dpl
pop dph
ret
;---------------------------------------------------
dec_r3_r2:
push acc

clr c
mov a,r2
subb a,#1
mov r2,a
mov a,r3
subb a,#00h
mov r3,a

pop acc
ret
;---------------------------------------------------

set_chargging_time_slot:
  mov t1_c1,#2  ;10 mili sec
 
  mov a,time_slot_lo
  mov t1_c2,a	 

  mov a,time_slot_hi
  mov t1_c3,a	 
  
	                 mov TH1,#0ech//03ch
                     mov TL1,#077h//0afh

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
find_day_type_from_day_index:
// return  acc  as day_type
clr c
mov a,#day_type_table_addr_lo
addc a,date_index_lo
mov addr_lo,a
mov a,#day_type_table_addr_hi
addc a,date_index_hi
mov addr_hi,a
lcall read_e2p_byte 

ret
;----------------------------
find_chargging_zone_from_day_type:

chk_day_type_1:
cjne a,#1,chk_day_type_2
day_type_is_1:
mov addr_hi,#02ah
mov addr_lo,#0bch
 //
jmp out_find_chargging_zone_from_day_type_addr

chk_day_type_2:
cjne a,#2,chk_day_type_3
day_type_is_2:
mov addr_hi,#02ah
mov addr_lo,#0cch
 //
jmp out_find_chargging_zone_from_day_type_addr

chk_day_type_3:
cjne a,#3,chk_day_type_4
day_type_is_3:
mov addr_hi,#02ah
mov addr_lo,#0dch
 //
jmp out_find_chargging_zone_from_day_type_addr

chk_day_type_4:
cjne a,#4,chk_day_type_5
day_type_is_4:
mov addr_hi,#02ah
mov addr_lo,#0ech
 //
jmp out_find_chargging_zone_from_day_type_addr

chk_day_type_5:
day_type_is_5:
mov addr_hi,#02ah
mov addr_lo,#0fch
 //
jmp out_find_chargging_zone_from_day_type_addr

out_find_chargging_zone_from_day_type_addr:

chk_sector1:
lcall read_e2p_byte	
lcall inc_e2p_counter
clr c
subb a,hour   
jc chk_sector2
jz chk_minute1
jmp sector1
chk_minute1:
lcall read_e2p_byte
clr c
subb a,minute  
jc chk_sector2
sector1:
//
lcall inc_e2p_counter
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type

chk_sector2:
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall read_e2p_byte	
lcall inc_e2p_counter
clr c
subb a,hour   
jc chk_sector3
jz chk_minute2
jmp sector2
chk_minute2:
lcall read_e2p_byte
clr c
subb a,minute  
jc chk_sector3
sector2:
//
lcall inc_e2p_counter
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type

chk_sector3:
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall read_e2p_byte	
lcall inc_e2p_counter
clr c
subb a,hour   
jc chk_sector4
jz chk_minute3
jmp sector3
chk_minute3:
lcall read_e2p_byte
clr c
subb a,minute  
jc chk_sector4
sector3:
//
lcall inc_e2p_counter
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type

chk_sector4:
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall read_e2p_byte	
lcall inc_e2p_counter
clr c
subb a,hour   
jc chk_sector5
jz chk_minute4
jmp sector4
chk_minute4:
lcall read_e2p_byte
clr c
subb a,minute  
jc chk_sector5
sector4:
//
lcall inc_e2p_counter
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type

chk_sector5:
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall read_e2p_byte	
lcall inc_e2p_counter
clr c
subb a,hour   
jc chk_sector6
jz chk_minute5
jmp sector5
chk_minute5:
lcall read_e2p_byte
clr c
subb a,minute  
jc chk_sector6
sector5:
//
lcall inc_e2p_counter
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type

chk_sector6:
lcall inc_e2p_counter
lcall inc_e2p_counter
sector6:
//
lcall read_e2p_byte
mov zone,a
jmp out_find_chargging_zone_from_day_type


out_find_chargging_zone_from_day_type:


ret
;-------------------------------------------
load_charge_level_from_pre_num:
push 01
push 02

  mov charge_level,#0ffh

   mov addr_hi,#OFF_CHARGE_TABLE_HI
   mov addr_lo,#OFF_CHARGE_TABLE_LO

   
   mov r1,#1
   mov r2,#00h

   mov a,#016 
   cjne a,030h,charge_level_rdtg4   //raghame aval e shomaregiri =0 ? 
   jmp charge_level_rdtg1
charge_level_rdtg4:	
						  ;dakhele shahri
   lcall load_pre_num
   lcall load_pre_num
	lcall read_e2p_byte
	mov charge_level,a
   jmp charge_level_rdtg3

charge_level_rdtg1:
   
   lcall inc_r2_r1
   cjne r2,#01h,charge_level_rdtg2		  ;
    cjne r1,#02dh,charge_level_rdtg2		  ;counter of offline chargging table fields (300 fields)
   jmp charge_level_rdtg3
charge_level_rdtg2:
   lcall compare_field
jmp	charge_level_rdtg1

;'''''''''''''''''''''''''''''''''''''
charge_level_rdtg3:
pop 02
pop 01
ret
;-------------------------------------------
load_pulse_and_timeslot_from_zone_and_level:
clr search_table_failed

mov a,charge_level
cjne a,#1,chk_level_2
chk_level_1:
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#charge_level_table_addr_lo
jmp out_find_level_addr
chk_level_2:
cjne a,#2,chk_level_3
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#074h
jmp out_find_level_addr
chk_level_3:
cjne a,#3,chk_level_4
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#086h
jmp out_find_level_addr
chk_level_4:
cjne a,#4,chk_level_5
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#098h
jmp out_find_level_addr
chk_level_5:
cjne a,#5,chk_level_6
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#0aah
jmp out_find_level_addr

chk_level_6:
cjne a,#6,chk_level_7
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#0bch
jmp out_find_level_addr
chk_level_7:
cjne a,#7,chk_level_8
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#0ceh
jmp out_find_level_addr
chk_level_8:
cjne a,#8,chk_level_9
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#0e0h
jmp out_find_level_addr
chk_level_9:
cjne a,#9,chk_level_10
mov addr_hi,#charge_level_table_addr_hi
mov addr_lo,#0f2h
jmp out_find_level_addr
chk_level_10:
cjne a,#10,chk_level_11
mov addr_hi,#029h
mov addr_lo,#04h
jmp out_find_level_addr
chk_level_11:
cjne a,#11,chk_level_12
mov addr_hi,#029h
mov addr_lo,#016h
jmp out_find_level_addr
chk_level_12:
cjne a,#12,chk_level_13
mov addr_hi,#029h
mov addr_lo,#028h
jmp out_find_level_addr
chk_level_13:
cjne a,#13,chk_level_14
mov addr_hi,#029h
mov addr_lo,#03ah
jmp out_find_level_addr
chk_level_14:
cjne a,#14,chk_level_15
mov addr_hi,#029h
mov addr_lo,#04ch
jmp out_find_level_addr
chk_level_15:
cjne a,#15,chk_level_16
mov addr_hi,#029h
mov addr_lo,#05eh
jmp out_find_level_addr
chk_level_16:
cjne a,#16,chk_level_17
mov addr_hi,#029h
mov addr_lo,#070h
jmp out_find_level_addr
chk_level_17:
cjne a,#17,chk_level_18
mov addr_hi,#029h
mov addr_lo,#082h
jmp out_find_level_addr
chk_level_18:
cjne a,#18,chk_level_19
mov addr_hi,#029h
mov addr_lo,#094h
jmp out_find_level_addr
chk_level_19:
cjne a,#19,chk_level_20
mov addr_hi,#029h
mov addr_lo,#0a6h
jmp out_find_level_addr
chk_level_20:
cjne a,#20,out_find_level_addr
mov addr_hi,#029h
mov addr_lo,#0b8h
jmp out_find_level_addr
out_find_level_addr:

mov a,zone
chk_zone_1:
cjne a,#1,chk_zone_2
lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

chk_zone_2:
cjne a,#2,chk_zone_3
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter

lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

chk_zone_3:
cjne a,#3,chk_zone_4
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter

lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

chk_zone_4:
cjne a,#4,chk_zone_5
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter

lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

chk_zone_5:
cjne a,#5,chk_zone_6
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter

lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

chk_zone_6:
cjne a,#5,out_find_zone
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter
lcall inc_e2p_counter

lcall read_e2p_byte
mov time_slot_hi,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov time_slot_lo,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov pulse_coef,a
jmp out_find_zone

out_find_zone:

mov a,zone
clr c
subb a,#7
jnc some_error_in_chargging_elements

mov a,charge_level
clr c
subb a,#21
jnc some_error_in_chargging_elements
jmp out_load_pulse_and_timeslot_from_zone_and_level

some_error_in_chargging_elements:
setb search_table_failed
out_load_pulse_and_timeslot_from_zone_and_level:
ret
;-------------------------------------------