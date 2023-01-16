tic_tac:
 	push 01
	push 02		
		
		
					 mov TH2,#03ch
					 mov TL2,#0afh
					 
					 mov r1,t2_c1
					 djnz r1,out_timer1_2_w
					 jb latch_up_pulse_duration,tryeg1
					 jnb online_chargging,tryeg1
					 inc pulse_duration
				tryeg1:	
//				 	 jnb need_to_alert,tryeg2
//					 lcall start_count_down
//					 lcall count_down
//				tryeg2:
					 lcall inc_call_duration
					 mov r1,#20				;1 sec
					 mov r2,t2_c2
					 djnz r2,out_timer1_1_w
					   mov r2,#1;60	  ;60 sec
                    lcall refresh_call_timer
					
					out_timer1_1_w:
					mov t2_c2,r2
					out_timer1_2_w:
					mov t2_c1,r1
	 clr tf2

	pop 02
	pop 01
	
 ret
;----------------------------------------------------
inc_call_duration:
push dph
push dpl
mov dpl,call_duration_lo
mov dph,call_duration_hi
inc dptr
mov call_duration_lo,dpl
mov call_duration_hi,dph
pop dpl
pop dph
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
reset_call_duration:
mov call_duration_lo,#00h
mov call_duration_hi,#00h
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start_tic_tac:
lcall clear_line_7
mov call_timer_minute,#00h
mov call_timer_hour,#00h
mov call_duration_hi,#00h
mov call_duration_lo,#00h
setb mic_mute	 ;
clr need_to_alert
clr latch_up_pulse_duration
mov pulse_duration,#00h
mov t2_c2,#1;;;;;;;;60
mov t2_c1,#20;
mov TH2,#03ch
mov TL2,#0afh
mov T2MOD,#00000000B
clr exf2
setb TR2
setb ie.7
setb ie.5
ret
;----------------------------------------------------
stop_tic_tac:
clr ie.5
clr TR2
mov call_timer_minute,#00h
mov call_timer_hour,#00h
clr mic_mute ;
clr need_to_alert
clr latch_up_pulse_duration
mov pulse_duration,#00h
mov t2_c2,#10	;??????/
mov t2_c1,#20;
mov TH2,#03ch
mov TL2,#0afh
mov T2MOD,#00000000B
clr exf2
ret
;-----------
;----------------------------------------------------
refresh_call_timer:	
lcall inc_call_timer
mov a,state
cjne a,#language_menu,otfd1
jmp otfd2
otfd1:
lcall show_call_time
otfd2:

ret

;----------------------------------------------------
show_call_time:
push STATUS_FLAGS
push START_COL
push acc
push 01
push 02
clr sign

mov a,call_timer_hour
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
mov TEXTURE_LENGTH,#6   	   ;              ;         
mov START_COL,#120			   ;			  ;
lcall show_digit_x			   ;			  ;
mov a,call_timer_hour		   ;			  ;
anl a,#15					   ;			  ;
mov TEXTURE_LENGTH,#6   	   ;              ;         
mov START_COL,#112		   		;			  ;
lcall show_digit_x			   ;;;;;;;;;;;;;;;;

mov dptr,#time_sign
setb sign					;
mov TEXTURE_LENGTH,#8       ;                      
mov START_COL,#104			; time_sign ":"
mov START_ROW,#ROW_2		;
clr LCD_CS 
lcall show_pattern
clr sign

mov a,call_timer_minute
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
lcall show_digit_x				;
mov a,call_timer_minute			;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
lcall show_digit_x

pop 02
pop 01
pop acc
pop START_COL
pop STATUS_FLAGS
ret
;----------------------------------------------------
inc_call_timer:
push STATUS_FLAGS
push START_COL
push acc
push 01
push 02

mov a,call_timer_minute
clr c
clr ac
inc a
da a
mov call_timer_minute,a
cjne a,#060h,ghfd1
mov call_timer_minute,#00h

mov a,call_timer_hour
clr c
clr ac
inc a
da a
mov call_timer_hour,a

cjne a,#010h,ghfd1
mov call_timer_minute,#00h
mov call_timer_hour,#00h

ghfd1:

//////////////////////////// 
pop 02
pop 01
pop acc
pop START_COL
pop STATUS_FLAGS

ret
;----------------------------------------------------
tic_tac_or_sam:
mov a,state
cjne a,#sam_check,its_not_sam_check
lcall sam_kill
jmp out_tic_tac
its_not_sam_check:
lcall tic_tac
out_tic_tac:
ret
;;;;;;;--------------------------------------------
