	//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//;;;;;;;;;;;;;;rtc functions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BitDly:    NOP                    
                                 
           RET

rtc_clkHigh:   SETB    rtc_SCL        
           JNB     rtc_SCL,$       
           RET

SendStop:  CLR     rtc_SDA        
           lcall   rtc_clkHigh        
           lcall   BitDly
           SETB    rtc_SDA         
           lcall   BitDly
           CLR     I2CBusy        
           RET                   


SendByte:  MOV     BitCnt,#8     
SBLoop:    RLC     A             
           MOV     rtc_SDA,C      
           lcall   rtc_clkHigh        
           lcall   BitDly
           CLR     rtc_SCL
           lcall   BitDly
           DJNZ    BitCnt,SBloop 
           SETB    rtc_SDA         
           lcall   rtc_clkHigh       
           lcall   BitDly
           JNB     rtc_SDA,SBEX    
           SETB    NoAck        
SBEX:      CLR     rtc_SCL         
           lcall   BitDly
           RET


GoMaster:  SETB    I2CBusy        
           CLR     NoAck        
           CLR     BusFault
           JNB     rtc_SCL,Fault 
           JNB     rtc_SDA,Fault
           CLR     rtc_SDA        
           lcall   BitDly
           CLR     rtc_SCL
           lcall   BitDly       
           MOV     A,SlvAdr      
           lcall   SendByte      
           RET
Fault:     SETB    BusFault      
           RET                 



SendData:  lcall   GoMaster       
           JB      NoAck,SDEX   
SDLoop:    MOV     A,@R0         
           lcall   SendByte      
           INC     R0            
           JB      NoAck,SDEX    
           DJNZ    ByteCnt,SDLoop 
SDEX:      lcall   SendStop       
           RET


RcvByte:   MOV     BitCnt,#8     
RBLoop:    lcall   rtc_clkHigh      
           lcall   BitDly
           MOV     C,rtc_SDA      
           RLC     A            
           CLR     rtc_SCL
           lcall   BitDly
           DJNZ    BitCnt,RBLoop  
           PUSH    ACC            
           MOV     A,ByteCnt
           CJNE    A,#1,RBAck     
           SETB    rtc_SDA       
           SJMP    RBAClk
RBAck:     CLR     rtc_SDA        
RBAClk:    lcall   rtc_clkHigh      
           POP     ACC           
           lcall   BitDly
           CLR     rtc_SCL
           SETB    rtc_SDA        
           lcall   BitDly
           RET


RcvData:   INC     SlvAdr       
          lcall   GoMaster      
           JB      NoAck,RDEX    
RDLoop:    lcall   RcvByte        
           MOV     @R0,A         
           INC     R0             
           DJNZ    ByteCnt,RDLoop 
RDEX:      lcall   SendStop       
           RET
;---------------------------------------
set_clock:
lcall set_rtc_bus
lcall short_delay
mov  a,hour;   #10h
mov  XmtDat+3,a
mov	 a,minute; #10h
mov  XmtDat+2,a
mov	 a,#00h; second= 00
mov  XmtDat+1,a

MOV     XmtDat,#02h
MOV     R0,#XmtDat  
MOV     ByteCnt,#4 
MOV     SlvAdr,#I2CRTC   
lCALL   SendData   ;set the new alarm
lcall set_key_bus
ret
;---------------------------------------
reset_alarm_interrupt: 
lcall set_rtc_bus
lcall short_delay
           MOV     XmtDat,#00h    
           MOV     XmtDat+1,#4 
           MOV     SlvAdr,#I2CRTC 
           MOV     R0,#XmtDat  
           MOV     ByteCnt,#2    
           lCALL   SendData
lcall set_key_bus 
ret     
;---------------------------------------
set_alarm:
lcall set_rtc_bus
lcall short_delay

mov  XmtDat+1,#090h
mov  XmtDat+2,#00h
mov  XmtDat+3,#01h

mov  XmtDat+4,b;read alarm min from e2p
mov  XmtDat+5,a;read alarm houre from e2p


MOV     XmtDat,#08h
MOV     R0,#XmtDat  
MOV     ByteCnt,#6 
MOV     SlvAdr,#I2CRTC   
lCALL   SendData   ;set the new alarm
lcall set_key_bus
ret
;------------------------------------------
set_new_alarm:
lcall set_rtc_bus
lcall short_delay

mov  XmtDat+1,#090h
mov  XmtDat+2,#00h
mov  XmtDat+3,#00h

mov  XmtDat+4,current_alarm_minute; b;read alarm min from e2p
mov  XmtDat+5,current_alarm_hour  ;a;read alarm houre from e2p


MOV     XmtDat,#08h
MOV     R0,#XmtDat  
MOV     ByteCnt,#6 
MOV     SlvAdr,#I2CRTC   
lCALL   SendData   ;set the new alarm
lcall set_key_bus
ret
;------------------------------------------
load_current_alarm:
push acc
lcall set_rtc_bus
lcall short_delay
           MOV     SlvAdr,#I2CRTC 
           mov     XmtDat,#08
           MOV     R0,#XmtDat   
           MOV     ByteCnt,#1   
           lCALL   SendData
           MOV     R0,#RcvDat   
           MOV     ByteCnt,#8    
           lCALL   RcvData                         
           MOV     R0,#RcvDat
           inc r0
           inc r0

          ; mov a,@r0
          ; mov second,a
           inc r0

           mov a,@r0
           mov current_alarm_minute,a
		   inc r0 

           mov a,@r0
		   mov current_alarm_hour,a

pop acc
lcall set_key_bus
ret
;-----------------------------------------
load_event_time:

lcall set_rtc_bus
lcall short_delay 
push acc
           MOV     SlvAdr,#I2CRTC 
           mov     XmtDat,#00
           MOV     R0,#XmtDat   
           MOV     ByteCnt,#1   
           lCALL   SendData
           MOV     R0,#RcvDat   
           MOV     ByteCnt,#8    
           lCALL   RcvData                         
           MOV     R0,#RcvDat
           inc r0
           inc r0

           mov a,@r0
           mov second,a
           inc r0

           mov a,@r0
           mov minute,a
		   inc r0 

           mov a,@r0
		   mov hour,a
		   inc r0 

           mov a,@r0
		   anl a,#00111111b
		   mov day,a

           mov a,@r0
		   anl a,#11000000b
		   rr a
		   rr a
		   rr a
		   rr a
		   rr a
		   rr a
		   mov year,a

		   inc r0 
           mov a,@r0
		   anl a,#00011111b
		   mov month,a

pop acc
lcall set_key_bus
ret
;------------------------------------------
//check_rtc_alarm:
//push 00
//push acc
// lcall set_rtc_bus
//            MOV     SlvAdr,#I2CRTC 
//           mov     XmtDat,#00
//           MOV     R0,#XmtDat   
//           MOV     ByteCnt,#1   
//           lCALL   SendData
//           MOV     R0,#RcvDat   
//           MOV     ByteCnt,#1    
//           lCALL   RcvData   
//           
//           MOV     R0,#RcvDat
//           mov a,@r0
//           jnb acc.1,chk_no_alarm
//	       lcall its_rtc_alarm                            
// chk_no_alarm:
// pop acc
// pop 00
// lcall set_key_bus
//ret
;------------------------------------------
 its_rtc_alarm:
lcall long_delay
lcall clear_lcd
lcall show_out_of_order
lcall Delay2s
lcall clear_lcd
lcall set_key_bus
lcall mini_flash  
lcall call_mode
lcall bye3
 ret
;------------------------------------------
update_date:
mov addr_hi,#Day_update_mask_addr_hi
mov addr_lo,#Day_update_mask_addr_lo
lcall read_e2p_byte
cjne a,#161,hytp1c
lcall inc_e2p_counter
lcall read_e2p_byte
jb acc.7,negative_hytp2c
positive_hytp2c:
clr acc.7
lcall load_event_time
add a,day
mov day,a
lcall set_date
jmp hytp1c
negative_hytp2c:

clr acc.7
lcall load_event_time
mov b,a
mov a,day
clr c
subb a,b
mov day,a
lcall set_date
hytp1c:

lcall inc_e2p_counter
lcall read_e2p_byte
cjne a,#161,hytp2c
lcall inc_e2p_counter
lcall read_e2p_byte
jb acc.7,negative_hytp3c
positive_hytp3c:
clr acc.7
lcall load_event_time
push 01
mov r1,a
mov a,month
anl a,#00011111b
add a,r1
mov r1,a
mov a,month
anl a,#11100000b
orl a,r1
mov month,a
pop 01
lcall set_date
jmp hytp2c
negative_hytp3c:
clr acc.7
lcall load_event_time
push 01
mov r1,a
mov a,month
anl a,#00011111b
clr c
subb a,r1
mov r1,a
mov a,month
anl a,#11100000b
orl a,r1
mov month,a
pop 01
lcall set_date
hytp2c:
mov addr_hi,#Day_update_mask_addr_hi
mov addr_lo,#Day_update_mask_addr_lo
mov zdata,#00h
lcall save_to_e2p
mov addr_hi,#month_update_mask_addr_hi
mov addr_lo,#month_update_mask_addr_lo
mov zdata,#00h
lcall save_to_e2p

ret
;---------------------------------------
update_alarm:
mov addr_hi,#alarm_update_mask_addr_hi
mov addr_lo,#alarm_update_mask_addr_lo
lcall read_e2p_byte
cjne a,#161,gbde1
lcall inc_e2p_counter
lcall read_e2p_byte
mov r1,a
lcall inc_e2p_counter
lcall read_e2p_byte
mov b,a
mov a,r1
lcall set_alarm
gbde1:
mov addr_hi,#alarm_update_mask_addr_hi
mov addr_lo,#alarm_update_mask_addr_lo
mov zdata,#00h
lcall save_to_e2p
ret
;---------------------------------------
update_clock:
mov addr_hi,#hour_update_mask_addr_hi
mov addr_lo,#hour_update_mask_addr_lo
lcall read_e2p_byte
cjne a,#161,hytp1
lcall inc_e2p_counter
lcall read_e2p_byte
jb acc.7,negative_hytp2
positive_hytp2:
clr acc.7
lcall load_event_time
add a,hour
mov hour,a
lcall set_clock
jmp hytp1
negative_hytp2:
clr acc.7
lcall load_event_time
mov b,a
mov a,hour
clr c
subb a,b
mov hour,a
lcall set_clock
hytp1:

lcall inc_e2p_counter
lcall read_e2p_byte
cjne a,#161,hytp2
lcall inc_e2p_counter
lcall read_e2p_byte
jb acc.7,negative_hytp3
positive_hytp3:
clr acc.7
lcall load_event_time
add a,minute
mov minute,a
lcall set_clock
jmp hytp2
negative_hytp3:
clr acc.7
lcall load_event_time
mov b,a
mov a,minute
clr c
subb a,b
mov minute,a
lcall set_clock
hytp2:
mov addr_hi,#hour_update_mask_addr_hi
mov addr_lo,#hour_update_mask_addr_lo
mov zdata,#00h
lcall save_to_e2p
mov addr_hi,#minute_update_mask_addr_hi
mov addr_lo,#minute_update_mask_addr_lo
mov zdata,#00h
lcall save_to_e2p
ret
;---------------------------------------    
set_date:
lcall set_rtc_bus
lcall short_delay

mov a,year
rl	a
rl	a
rl	a
rl	a
rl	a
rl	a
orl  a,day
     
mov  XmtDat+1,a
mov	 a,month
mov  XmtDat+2,a
MOV  XmtDat,#05h
MOV  R0,#XmtDat  
MOV  ByteCnt,#3 
MOV  SlvAdr,#I2CRTC   
lCALL SendData   ;set the new date
lcall set_key_bus
ret
;---------------------------------------
manual_time_setting:
lcall show_manual_time_labels

lcall load_event_time

push START_COL
push acc
push 01
setb show_time_sw

mov a,hour
mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			; time_sign ":"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,minute
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit

    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			; time_sign ":"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,second
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	second
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit
;__________________________________________________
;__________________________________________________
;__________________________________________________
;;;;;;;;;;;;;;;;;;;;;new time
 
mov a,new_hour
lcall dec_to_bcd

mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
		mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			; time_sign ":"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,new_minute
lcall dec_to_bcd

mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit

    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			; time_sign ":"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,#00h;second
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	second
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit
pop 01
pop acc
pop START_COL



ret
;---------------------------------------
manual_alarm_setting:
lcall show_manual_alarm_labels
lcall load_current_alarm

push START_COL
push acc
push 01
setb show_time_sw

mov a,current_alarm_hour
mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			; time_sign ":"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,current_alarm_minute
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit

    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			; time_sign ":"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,#00h;second
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	second
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit
;__________________________________________________
;__________________________________________________
;__________________________________________________
;;;;;;;;;;;;;;;;;;;;;new alarm
 
mov a,new_alarm_hour
lcall dec_to_bcd

mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
		mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			; time_sign ":"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,new_alarm_minute
lcall dec_to_bcd

mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit

    mov dptr,#time_sign
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			; time_sign ":"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,#00h;second
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	second
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit
pop 01
pop acc
pop START_COL
ret
;--------------------------------------- 
manual_date_setting:
;lcall show_manual_alarm_labels
;lcall load_current_alarm
 lcall load_event_time
						 
  ;lcall rtc_date_to_index
  ;lcall index_to_rtc_date

 push START_COL
push acc
push 01
setb show_time_sw

mov a,year
mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	year	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_8               ;lcd code  0
lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#slash
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			;  "/"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,month
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	month
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit

    mov dptr,#slash
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			;  "/"
	mov START_ROW,#ROW_8		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,day;#00h;second
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	day
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
		mov START_ROW,#ROW_8               ;lcd code  0

lcall show_digit
;__________________________________________________
;__________________________________________________
;__________________________________________________
;;;;;;;;;;;;;;;;;;;;;new alarm
 
mov a,year;new year=old year
lcall dec_to_bcd

mov r1,a
rr a						   ;			  ;
rr a						   ;			  ;
rr a						   ;	hour	  ;
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120		   ;			  ;
		mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit			   ;;;;;;;;;;;;;;;;

   
    mov dptr,#slash
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#104			;  "/"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,new_month
lcall dec_to_bcd

mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	minute
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#96			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#88
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit

    mov dptr,#slash
	setb sign					;
	mov TEXTURE_LENGTH,#8       ;                      
    mov START_COL,#80			;  "/"
	mov START_ROW,#ROW_6		;
	 clr LCD_CS 
	lcall show_pattern
	clr sign

mov a,new_day
lcall dec_to_bcd
mov r1,a
rr a						
rr a							;
rr a							;
rr a							;
anl a,#15						;;	second
    mov TEXTURE_LENGTH,#6       ;                      
    mov START_COL,#72			;
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit				;
mov a,r1						;;
anl a,#15						 ;
  mov TEXTURE_LENGTH,#6                             
    mov START_COL,#64
	mov START_ROW,#ROW_6               ;lcd code  0

lcall show_digit
pop 01
pop acc
pop START_COL
ret

;---------------------
rtc_date_to_index:
mov a,month
lcall hex_to_dec
test_month1:
cjne a,#01,test_month2
mov date_index_hi,#00h
mov date_index_lo,#00h
jmp add_day_to_index_0
test_month2:
cjne a,#02,test_month3
mov date_index_hi,#00h
mov date_index_lo,#31
jmp add_day_to_index_0
test_month3:
cjne a,#03,test_month4
mov date_index_hi,#00h
mov date_index_lo,#59
jmp add_day_to_index_0
test_month4:
cjne a,#04,test_month5
mov date_index_hi,#00h
mov date_index_lo,#90
jmp add_day_to_index_0
test_month5:
cjne a,#05,test_month6
mov date_index_hi,#00h
mov date_index_lo,#120
jmp add_day_to_index_0
test_month6:
cjne a,#06,test_month7
mov date_index_hi,#00h
mov date_index_lo,#151
jmp add_day_to_index_0
test_month7:
cjne a,#07,test_month8
mov date_index_hi,#00h
mov date_index_lo,#181
jmp add_day_to_index_0
test_month8:
cjne a,#08,test_month9
mov date_index_hi,#00h
mov date_index_lo,#212
jmp add_day_to_index_0
test_month9:
cjne a,#09,test_month10
mov date_index_hi,#00h
mov date_index_lo,#243
jmp add_day_to_index_0
test_month10:
cjne a,#10,test_month11
mov date_index_hi,#01h
mov date_index_lo,#11h
jmp add_day_to_index_0
test_month11:
cjne a,#11,test_month12
mov date_index_hi,#01h
mov date_index_lo,#30h
jmp add_day_to_index_0
test_month12:
mov date_index_hi,#01h
mov date_index_lo,#4eh
jmp add_day_to_index_0
;;;
;;;
add_day_to_index_0:
mov a,day
lcall hex_to_dec
clr c
add a,date_index_lo
mov date_index_lo,a
mov a,date_index_hi
addc a,#00h
mov date_index_hi,a 
ret
;--------------------------------------------
real_date_to_index:
ret
;----------------------------------------------
index_to_rtc_date:
mov a,date_index_hi
jnz chk_uihwd2
chk_month_1:
clr c
mov a,#31
subb a,date_index_lo
jc chk_month_2
mov month,#01
jmp day_uhwfhu0
chk_month_2:
clr c
mov a,#59
subb a,date_index_lo
jc chk_month_3
mov month,#02
jmp day_uhwfhu0
chk_month_3:
clr c
mov a,#90
subb a,date_index_lo
jc chk_month_4
mov month,#03
jmp day_uhwfhu0
chk_month_4:
clr c
mov a,#120
subb a,date_index_lo
jc chk_month_5
mov month,#04
jmp day_uhwfhu0
chk_month_5:
clr c
mov a,#151
subb a,date_index_lo
jc chk_month_6
mov month,#05
jmp day_uhwfhu0
chk_month_6:
clr c
mov a,#181
subb a,date_index_lo
jc chk_month_7
mov month,#06
jmp day_uhwfhu0
chk_month_7:
clr c
mov a,#212
subb a,date_index_lo
jc chk_month_8
mov month,#07
jmp day_uhwfhu0
chk_month_8:
clr c
mov a,#243
subb a,date_index_lo
jc chk_month_9_1
mov month,#08
jmp day_uhwfhu0

chk_month_9_1:
mov month,#09
jmp day_uhwfhu0

chk_uihwd2:

chk_month_9_2:
clr c
mov a,#17
subb a,date_index_lo
jc chk_month_10
mov month,#09
jmp day_uhwfhu0
chk_month_10:
clr c
mov a,#48
subb a,date_index_lo
jc chk_month_11
mov month,#010h
jmp day_uhwfhu0
chk_month_11:
clr c
mov a,#78
subb a,date_index_lo
jc chk_month_12
mov month,#011h
jmp day_uhwfhu0
chk_month_12:
mov month,#012h
jmp day_uhwfhu0

day_uhwfhu0:


mov a,month
calc_day_m1:
cjne a,#1,calc_day_m2
mov a,date_index_lo
mov day,a
jmp uhuefij32
calc_day_m2:
cjne a,#2,calc_day_m3
mov a,date_index_lo
subb a,#31
mov day,a
jmp uhuefij32
calc_day_m3:
cjne a,#3,calc_day_m4
mov a,date_index_lo
subb a,#59
mov day,a
jmp uhuefij32
calc_day_m4:
cjne a,#4,calc_day_m5
mov a,date_index_lo
subb a,#90
mov day,a
jmp uhuefij32
calc_day_m5:
cjne a,#5,calc_day_m6
mov a,date_index_lo
subb a,#120
mov day,a
jmp uhuefij32
calc_day_m6:
cjne a,#6,calc_day_m7
mov a,date_index_lo
subb a,#151
mov day,a
jmp uhuefij32
calc_day_m7:
cjne a,#7,calc_day_m8
mov a,date_index_lo
subb a,#181
mov day,a
jmp uhuefij32
calc_day_m8:
cjne a,#8,calc_day_m9
mov a,date_index_lo
subb a,#212
mov day,a
jmp uhuefij32
calc_day_m9:
cjne a,#9,calc_day_m10
mov a,date_index_lo
subb a,#243
mov day,a
jmp uhuefij32
calc_day_m10:
cjne a,#10h,calc_day_m11
mov a,date_index_lo
subb a,#17
mov day,a
jmp uhuefij32
calc_day_m11:
cjne a,#11h,calc_day_m12
mov a,date_index_lo
subb a,#48
mov day,a
jmp uhuefij32
calc_day_m12:
mov a,date_index_lo
subb a,#78
mov day,a
jmp uhuefij32
;
uhuefij32:
mov a,day
lcall dec_to_hex
mov day,a
ret
;------------------------
index_to_real_date:
ret
;----------------------------------------------
rtc_alarm:
	lcall clear_lcd
	lcall show_out_of_order
	lcall long_delay
	lcall long_delay
	lcall long_delay
	lcall long_delay
	lcall bye3
ret
