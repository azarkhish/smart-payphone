dial_all_in_memory:
push 06
push 01
;clr lcd_bl
lcall show_free_call
lcall mid3_delay
lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time
mov call_type,#free_call
setb access0
mov r1,#30h
frbc1:
mov a,@r1
mov dial_buf,a
lcall dial
   lcall mid3_delay
inc r1
djnz r6,frbc1

setb mic_mute  ;
setb tone_dialing;;;;;;;;;;;;;;;;;;
pop 01
pop 06
ret
;--------------------------------------------------------------
clear_dial_memory:

mov 30h,#00h
mov 31h,#00h
mov 32h,#00h
mov 33h,#00h
mov 34h,#00h
mov 35h,#00h
mov 36h,#00h
mov 37h,#00h
mov 38h,#00h
mov 39h,#00h
mov 3ah,#00h
mov 3bh,#00h
mov 3ch,#00h
mov 3dh,#00h
mov 3eh,#00h
mov 3fh,#00h

ret
;---------------------------------------------------------------
pulse_dial:
push acc
mov a,dial_buf

cjne a,#16,jbs1
mov a,#10
jmp jbscomplete
jbs1:
cjne a,#17,jbs2
mov a,#1
jmp jbscomplete
jbs2:
cjne a,#18,jbs3
mov a,#2
jmp jbscomplete
jbs3:
cjne a,#19,jbs4
mov a,#3
jmp jbscomplete
jbs4:
cjne a,#20,jbs5
mov a,#4
jmp jbscomplete
jbs5:
cjne a,#21,jbs6
mov a,#5
jmp jbscomplete
jbs6:
cjne a,#22,jbs7
mov a,#6
jmp jbscomplete
jbs7:
cjne a,#23,jbs8
mov a,#7
jmp jbscomplete
jbs8:
cjne a,#24,jbs9
mov a,#8
jmp jbscomplete
jbs9:
cjne a,#25,jbs10
mov a,#9
jmp jbscomplete
jbscomplete:


qqfs1:
clr line_sw
lcall delay31m
lcall delay31m

lcall delay31m
lcall delay31m

setb line_sw
lcall delay31m
lcall delay31m

lcall delay31m
lcall delay31m

djnz acc,qqfs1


jbs10:
pop acc
ret
;----------------------------------------------------------------
dial:
clr ie.7
jb tone_dialing,tone_dial
lcall pulse_dial
lcall long_delay
lcall long_delay
jmp yewa2

tone_dial:
setb modem_sw
lcall set_modem_bus
lcall CMXinit
   mov a,DIAL_BUF							 ;	11101011
check_0:									 ;	11100111	  
   cjne a,#16,check_1						 ;	11100011   @ =e3h  ;low
   mov B,#0ah
check_1:
   cjne a,#17,check_2
      mov B,#01
check_2:
   cjne a,#18,check_3
      mov B,#02
check_3:
   cjne a,#19,check_4
      mov B,#03
check_4:
   cjne a,#20,check_5
      mov B,#04
check_5:
   cjne a,#21,check_6
      mov B,#05
check_6:
   cjne a,#22,check_7
      mov B,#06
check_7:
   cjne a,#23,check_8
      mov B,#07
check_8:
   cjne a,#24,check_9
      mov B,#08
check_9:
   cjne a,#25,check_star
   mov B,#09
check_star:
   cjne a,#30,check_sharp
      mov B,#11
check_sharp:
   cjne a,#31,yewa1
      mov B,#12

yewa1:
lcall CMXtonedial2
yewa2:
setb ie.7
clr modem_sw
;;;;;;;
clr modem_reply
clr modem_clk
clr modem_cs
clr modem_cmd
;;;;;;;
lcall set_key_bus
ret
