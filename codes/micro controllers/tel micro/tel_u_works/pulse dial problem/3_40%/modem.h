 //;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//;;;;;;;;;;;;;;modem functions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;-------------------------------------------------------
previous_dptr:
	mov dph,dp_h
	mov dpl,dp_l
ret
;---------------------------- 
save_dptr:
	mov dp_h,dph
	mov dp_l,dpl
ret

;----------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;modem control subs;;;;
;___ initialize CMX ____
CMXinit:                ;

     mov A,#01           ;applying General Reset
    mov B,#0            ;
    lcall CMXcmdsync    ;

    mov A,#0E0H         ;addressing SETUP register
    mov B,#01110011b    ;0 & Relaybit & Detector oFF & No Loop Back & 11.0592 Mhz Xtal
    lcall CMXcmdsync    ;
	lcall Delay31m          ;

    mov A,#0E2H         ;addressing GAIN CONTROL register
    mov B,#11111111b        ;11110000b     	 
    lcall CMXcmdsync    ;

    mov A,#0E4H         ;addressing UART SETUP register, Not required for synchrone mode
    mov B,#00101000b    ;00 & Async & One Stop Bit & No Parity Bit & Even Parity Type & 8 Bits
    lcall CMXcmdsync    ;

    mov A,#0E3H         ;addressing TX Data Byte register
    mov B,#50h          ;loading first byte of data 'p' to Tx buffer
    lcall CMXcmdsync    ;

    mov A,#0EAH         ;
    lcall modem_replysync    ;addressing Rx Data byte

    mov A,#0ECH         ;addressing Tones Detect register
    lcall modem_replysync    ;

    mov A,#0EFH         ;addressing Flags register
    lcall modem_replysync    ;reading Flags register to B

    mov A,#0E8H         ;addressing Rx PSK mode register
    mov B,#01001111b;11    ;0 & Call Progress BW & DeScramb Unlock & Rx DeScramb Y/N & EQ1 EQ0 & Rx Enable & Channel H/L
    lcall CMXcmdsync    ;

    mov A,#0EEH         ;addressing IRQ CONTROL register
    mov B,#00001000b    ;parity & ringDetect & detect & Rx OverFlow & Rx DataReady & Tx data underflow & Tx dataReady & Unscram Mark
    lcall CMXcmdsync    ;

    mov A,#0E1H         ;addressing Tx TONES register
    mov B,#10100001b    ;answer tone 2100 & NoTone enabled & DTMF tone & normal DTMF & XXXX
    lcall CMXcmdsync    ;

    mov A,#0E7H         ;addressing Tx PSK mode register
    mov B,#01001100b    ;0 & Tx DualOutput Y/N & Scramb Unlock & Tx Scramb & EQ1 EQ0 & Tx Output Enable & Channel H/L
    lcall CMXcmdsync    ;

RET                     ;
;----------------------------
;----------------------------
;_____________ sending sync command from B to CMX addressed by A ____
CMXcmdsync:                                                         ;
        push 01
  clr ie.7	
		clr modem_cs
		nop
		nop
		nop                                                   ;This subroutine takes A as
        mov r1,#8                                                   ;address and B as data then
CMX00:  clr modem_clk                                                  ;sends the data to addressed
        nop
		nop
		nop
		RLC A                                                       ;register in CMX modem
        mov modem_cmd,C                                                ;
        setb modem_clk                                                 ;
        djnz r1,CMX00                                               ;

        mov A,B                                                     ;
        mov r1,#8                                                   ;
CMX02:  clr modem_clk                                                  ;
        nop
		nop
		nop
		RLC A                                                       ;
        mov modem_cmd,C                                                ;
        setb modem_clk                                                 ;
        djnz r1,CMX02                                               ;
        clr modem_clk                                                  ;
        nop
		nop
		nop
		setb modem_cs
		nop
		nop
		nop
		pop 01  
setb ie.7	                                               ;
RET                                           
;----------------------------
;_____________ recieving sync reply from CMX to B addressed by A _____
modem_replysync:   
clr ie.7	
        push 01
	    clr modem_cs                                                    ;This subroutine takes A as
        nop
		nop
		nop
		mov r1,#8                                                    ;address and brings data
CMX03:  clr modem_clk                                                   ;from addressed register to
        nop
		nop
		nop
		RLC A                                                        ;B
        mov modem_cmd,C                                                 ;
        setb modem_clk                                                  ;
        nop
		nop
		nop
		djnz r1,CMX03                                                ;
        
        mov r1,#8                                                    ;
        setb modem_reply                                                  ;
		nop
		nop
		nop
CMX01:  clr modem_clk                                                   ;
        nop
		nop
		nop
		nop
        setb modem_clk                                                  ;
        mov C,modem_reply                                                 ;
        RLC A                                                        ;
        djnz r1,CMX01                                                ;
        nop
		nop
		clr modem_clk                                                   ;
        nop
		nop
		nop
		setb modem_cs                                                   ;
        nop
		nop
		mov B,A 
		pop 01
setb ie.7	                                                     ;
ret                                  

;----------------------------------------------
load_pms_num_address:
mov addr_hi,#Phone_Group_addr_hi
mov addr_lo,#Phone_Group_addr_lo
lcall read_e2p_byte

	mov addr_lo,#072h  ;default 
	mov addr_hi,#017h  ;

seg1:
cjne a,#1,seg2
	mov addr_lo,#072h   
	mov addr_hi,#017h
jmp segout
seg2:
cjne a,#2,seg3
	mov addr_lo,#07eh   
	mov addr_hi,#017h
jmp segout
seg3:
cjne a,#3,seg4
	mov addr_lo,#08ah   
	mov addr_hi,#017h
jmp segout
seg4:
cjne a,#4,seg5
	mov addr_lo,#096h   
	mov addr_hi,#017h
jmp segout
seg5:
cjne a,#5,seg6
	mov addr_lo,#0A2h   
	mov addr_hi,#017h
jmp segout
seg6:
cjne a,#6,seg7
	mov addr_lo,#0aeh   
	mov addr_hi,#017h
jmp segout
seg7:
cjne a,#7,seg8
	mov addr_lo,#0bah   
	mov addr_hi,#017h
jmp segout
seg8:
cjne a,#8,seg9
	mov addr_lo,#0c6h   
	mov addr_hi,#017h
jmp segout
seg9:
cjne a,#9,seg10
	mov addr_lo,#0d2h   
	mov addr_hi,#017h
jmp segout
seg10:
cjne a,#10,seg11
	mov addr_lo,#0deh   
	mov addr_hi,#017h
jmp segout
seg11:
cjne a,#11,seg12
	mov addr_lo,#0eah   
	mov addr_hi,#017h
jmp segout
seg12:
cjne a,#12,seg13
	mov addr_lo,#0f6h   
	mov addr_hi,#017h
jmp segout
seg13:
cjne a,#13,seg14
	mov addr_lo,#02h   
	mov addr_hi,#018h
jmp segout
seg14:
cjne a,#14,seg15
	mov addr_lo,#0eh   
	mov addr_hi,#018h
jmp segout
seg15:
cjne a,#15,seg16
	mov addr_lo,#01ah   
	mov addr_hi,#018h
jmp segout
seg16:

segout:
ret
;----------------------------
dial_pms_number:

	lcall load_pms_num_address
		
		    mov	b, #20		; retry counter
		sf_1:
			mov	a, #PADDR	; programmable address
			lcall read_random	; try to read
			jnc	sf_2		; jump if read OK
			djnz	b, sf_1		; try again
		sf_2:
			cjne a,#00,sf_4
			mov a,#0ah
		sf_4:
			mov b,a
		    lcall CMXtonedial
		    
		sf_3:
			lcall read_current
			cjne a,#0ffh,sf_2
				    
ret
;----------------------------
;________________________________ Call ________________________________
call_pms:
mov t1_c2,#100
lcall  start_scheduling_guard_time

lcall CMXinit
// ;;;;;;;;;;;0AH = 0
//mov B,#02H
//lcall CMXtonedial
//mov B,#02H
//lcall CMXtonedial
//mov B,#02H
//lcall CMXtonedial
//mov B,#03H
//lcall CMXtonedial
//mov B,#02H
//lcall CMXtonedial
//mov B,#02H
//lcall CMXtonedial
//mov B,#01H
//lcall CMXtonedial
//mov B,#02H
//lcall CMXtonedial
		lcall dial_pms_number
		 clr ie.7
		 lcall Delay110m

		mov A,#0E0H      ;addressing SETUP register
		mov B,#01100011b ;0 & Relaybit & Detector Filter 2 Bits & No Loop Back & 11.0592 Mhz Xtal
		lcall CMXcmdsync ;
		 clr ie.7
		lcall Delay31m   ;
		 setb ie.7

		
		
		Hand00:          ;waiting for Answer Tone
		mov A,#0ECH
		lcall modem_replysync
		jnb B.3,Hand00
		mov A,#0E0H      ;addressing SETUP register
		mov B,#01000011b ;0 & Relaybit & Detector Filter 2 Bits & No Loop Back & 11.0592 Mhz Xtal
		lcall CMXcmdsync ;
		 clr ie.7
		lcall Delay31m   ;
		 setb ie.7
		Hand01:
		mov A,#0ECH      ;addressing Tones Detect register
		lcall modem_replysync ;
		jnb B.0,Hand01   ;waiting for Unscrambled Ones
		
		mov A,#0E8H      ;addressing Rx PSK mode register
		mov B,#01111111b ;0 & Call Progress BW & DeScramb Unlock & Rx DeScramb Y/N & EQ1 EQ0 & Rx Enable & Channel H/L
		lcall CMXcmdsync ;
		
		mov A,#0E7H      ;addressing Tx PSK mode register
		mov B,#01111100b ;0 & Tx DualOutput Y/N & Scramb Unlock & Tx Scramb & EQ1 EQ0 & Tx Output Enable & Channel H/L
		lcall CMXcmdsync ;
		
		mov A,#0E3H      ;addressing TX Data Byte register
		mov B,#0FFh      ;
		lcall CMXcmdsync ;transmiting Scrambled Ones
		
		mov A,#0E7H      ;addressing Tx PSK mode register
		mov B,#01111110b ;0 & Tx DualOutput Y/N & Scramb Unlock & Tx Scramb & EQ1 EQ0 & Tx Output Enable & Channel H/L
		lcall CMXcmdsync ;
		;lcall Delay110m
		Hand02:
		setb p3.3
		dizah:
		jb p3.3,dizah      ;waiting for a byte to come in
		
		mov A,#0EAH                      ;
		lcall modem_replysync                 ;
		mov A,B                          ;
		cjne A,#0FFH,Hand02                ;
		

		mov A,#0EFH                      ;
		lcall modem_replysync
			
		mov A,#0E8H      ;addressing Rx PSK mode register
		mov B,#01110011b ;0 & Call Progress BW & DeScramb Unlock & Rx DeScramb Y/N & EQ1 EQ0 & Rx Enable & Channel H/L
		lcall CMXcmdsync
		
		mov A,#0EAH                      ;
		lcall modem_replysync 
		
	   	;lcall Delay2s 
		lcall Delay2s 
		
		mov A,#0EFH                      ;
		lcall modem_replysync
		
	
		lcall Delay2s 
 		lcall Delay4s
   
ret                 ;

;________________________________________ Answer____________________________________
answer:                                                                             ;
mov t1_c2,#100
lcall  start_scheduling_guard_time
                                                                                   ;
		
		lcall CMXinit                                                                       ;
		mov r0,#20                                                                          ;
		sabr00:                                                                             ;
		lcall Delay110m                                                                     ;
		djnz r0,sabr00                                                                      ;
  	;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++	 
		 mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#10000011b    ;
         lcall CMXcmdsync    ;
		 
		 mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#11000011b    ;
         lcall CMXcmdsync    ;		
		
		mov r0,#35                                                                          ;
		sabr05:                                                                             ;
		lcall Delay110m                                                                     ;
		djnz r0,sabr05  
		
		mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#10000011b    ;
         lcall CMXcmdsync
		 
		 mov r0,#3                                                                          ;
		sabr06:                                                                             ;
		lcall Delay31m                                                                     ;
		djnz r0,sabr06  
	 ;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		mov A,#0E4H                                                                         ;
		mov B,#00000000b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#11000010b    ;
         lcall CMXcmdsync

		mov A,#0E7H                                                                         ;
		mov B,#01100001b                                                                   ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E3H                                                                         ;
		mov B,#0FFH                                                                         ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E7H                                                                         ;
		mov B,#01000011b ;01100011b                                                                  ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0EFH                                                                         ;
		lcall modem_replysync                                                                    ;
		mov A,#0ECH                                                                         ;
		lcall modem_replysync                                                                    ;
		mov A,#0EAH                                                                         ;
		lcall modem_replysync                                                                    ;
		
		mov A,#0E8H                                                                         ;
		mov B,#00                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E0H                                                                         ;
		mov B,#00000011b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		lcall Delay31m                                                                      ;
		lcall Delay31m;		
		dhx:                                                                                ;
		
		mov A,#0E8H                                                                         ;
		mov B,#00110010b;00                                                                    ;
		lcall CMXcmdsync                                                                    ;

; lcall set_safe_guard_timer;;;;;;;;;;;;;;;;;		
		sabr03:                                                                             ;
		mov A,#0EFH                                                                         ;
		lcall modem_replysync                                                                    ;
		;jb B.3,sabr04                                                                       ;
		;jb guard,gfrte1
		jnb B.3,sabr03                                                                      ;
		
		sabr04:                                                                             ;
		mov A,#0ECH                                                                         ;
		lcall modem_replysync                                                                    ;
		;jb guard,gfrte1
		jnb B.4,sabr04                                                                      ;
 
 ;lcall clear_safe_guard_timer
		mov A,#0E1H         ;addressing Tx TONES register
    	 mov B,#10000010b    ;
         lcall CMXcmdsync 

 		mov A,#0E7H                                                                         ;
		mov B,#01010011b                                                                   ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E1H                                                                         ;
		mov b,#11000010b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov r0,#7                                                                           ;
		sabr02:                                                                             ;
		lcall Delay110m                                                                     ;
		djnz r0,sabr02                                                                      ;
		
//		mov A,#0E1H                                                                         ;
//		mov b,#10000010b                                                                    ;
//		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E0H                                                                         ;
		mov B,#01110011b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		lcall Delay31m                                                                      ;
		
		mov A,#0E4H                                                                         ;
		mov B,#00101000b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0EAH                                                                         ;
		lcall modem_replysync                                                                    ;
		
		mov A,#0EFH                                                                         ;
		lcall modem_replysync                                                                    ;
		
		mov A,#0E8H                                                                         ;
		mov B,#01111110b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E3H                                                                         ;
		mov B,#0FFh                                                                         ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0E7H                                                                         ;
		mov B,#01111111b                                                                    ;
		lcall CMXcmdsync                                                                    ;
		
		mov A,#0EEH                                                                         ;
		mov B,#00001000b                                                                    ;
		lcall CMXcmdsync
		
    mov A,#0E2H         ;addressing GAIN CONTROL register
    mov B,#11110100b           	;jadid 
    lcall CMXcmdsync                                                                     ;
gfrte1:
RET                                                                                 ;
;----------------------------
CMXtonedial:                                                   ; This subroutine takes a number in register B and dials it
        ORL B,#11100000b                                       ;answer tone 2100 & Tone enabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
        lcall Delay110m                                        ;110ms Delay
        mov B,#10100000b                                       ;answer tone 2100 & Tone disabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
        lcall Delay110m                                        ;110ms Delay
RET                                
;----------------------------
CMXtonedial2:                                                   ; This subroutine takes a number in register B and dials it
        ORL B,#11100000b                                       ;answer tone 2100 & Tone enabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
        lcall Delay110m                                        ;110ms Delay
//        lcall Delay110m                                        ;110ms Delay

        mov B,#10100000b                                       ;answer tone 2100 & Tone disabled & DTMF tone & normal DTMF & XXXX
        mov A,#0E1H                                            ;addressing Tx TONES register
        lcall CMXcmdsync                                       ;
        lcall Delay31m                                        ;110ms Delay
RET                                
;----------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;comunication subs;;;;

emergency_report:
		push 07
		lcall send_preset

		mov send_buf,#00h
		lcall send_byte_i
		
		mov a,temp
		mov send_buf,a
		lcall send_byte_i
		
		mov addr_hi,#00h   ;phone serial address
		mov addr_lo,#01h
	   lcall read_e2p_byte
		mov send_buf,a
		lcall send_byte_i

		mov addr_hi,#00h   ;phone serial address
		mov addr_lo,#02h
	   lcall read_e2p_byte
		mov send_buf,a
		lcall send_byte_i

		mov addr_hi,#00h   ;phone serial address
		mov addr_lo,#03h
	   lcall read_e2p_byte
		mov send_buf,a
		lcall send_byte_i

		mov addr_hi,#00h   ;phone serial address
		mov addr_lo,#04h
	   lcall read_e2p_byte
		mov send_buf,a
		lcall send_byte_i
		lcall long_delay
pop 07
ret
;-------------------------------------------------------------------
report:
mov t1_c2,#100
lcall  start_scheduling_guard_time

	  	lcall clear_crc
	  	
	  	mov cmd_buf,#SOR
	  	lcall send_command_pack
	  
	  	lcall receive_command_pack
	  	 cjne a,#ACK,report_error_1
		 jmp wd_34
report_error_1:
jmp report_error	  	
	wd_34: 	
		
	  	mov dptr,#00
		lcall save_dptr
		
		lcall send_preset
	wd_0:
		mov addr_lo,#00
		mov addr_hi,#00
		
		mov b,#15    ;num of attempts 
	wd_1:
		mov a,#PADDR
		call read_random
		jnc wd_3         ;wd_2
		djnz b,wd_1
	wd_2:
		jmp wd_5
	wd_3:
		mov a,#PADDR
		call read_current
	wd_5:
		
		inc dptr
		call inc_e2p_counter
		

		lcall crc16
		mov send_buf,a
		lcall send_byte_i
	
		
		mov a,addr_hi
		cjne a,#03h,wd_3 
		mov a,addr_lo
		cjne a,#0e8h,wd_3
		
		lcall Delay110m
		lcall Delay110m

		mov send_buf,crc_hi
		lcall send_byte_i
		mov send_buf,crc_lo
		lcall send_byte_i
		
		lcall clear_crc 
		
		mov addr_hi,#00
		mov addr_lo,#00
			
		lcall receive_command_pack
		cjne a,#ACK,wd_6
		
		lcall send_preset
		lcall save_dptr
		mov a,dph
		cjne a,#017h,wd_3
		mov a,dpl
		cjne a,#070h,wd_3
		
		jmp wd_7
	wd_6:
	 	mov cmd_buf,#NACK
	 	lcall send_command_pack
	 	
	 	lcall receive_command_pack
	 	cjne a,#ACK,report_error
	 	
		lcall send_preset
	 	lcall previous_dptr
	 	jmp wd_0
	wd_7:
		mov cmd_buf,#EOR
		lcall send_command_pack
	    jmp report_normal_end
	report_error:
	                       
    setb R_error
	jmp wrqw1                       
	                       
	report_normal_end:
	clr R_error
 wrqw1:
ret	 	                                                                                      
;---------------------------------------
update:
mov t1_c2,#50
lcall  start_scheduling_guard_time

	;	 mov 08fh,#01h
		 mov dptr,#00h
		
		lcall receive_command_pack
		cjne a,#SOU,update_error
	    

		lcall receive_byte_i	 ;
		mov var_1,b				 ;  receive update policy
		lcall receive_byte_i	 ;
		mov a,b					 ;

 	;	 mov 08fh,#01h


	PMS_NUM:
		jnb acc.0,FREE_NUM
		lcall receive_PMS_NUM_table
	FREE_NUM:	
		jnb acc.1,CHARGING
		lcall receive_FREE_NUM_table
	CHARGING:
		jnb acc.2,CHARGE_SCHEDULER
		lcall receive_CHARGING_table
	CHARGE_SCHEDULER:
		jnb acc.3,DAY_TYPE
		lcall receive_CHARGE_SCHEDULER_table

	DAY_TYPE:
		jnb acc.4,BLACK_LIST
		lcall receive_DAY_TYPE_table

	BLACK_LIST:
		jnb acc.5,WHITE_LIST
		lcall receive_BLACK_LIST_table
	WHITE_LIST:
		jnb acc.6,SAM
		lcall receive_WHITE_LIST_table
	SAM:
		jnb acc.7,MESSAGE
		lcall receive_SAM_table
    MESSAGE:
		mov a,var_1
		jnb acc.0,SETTINGS
		lcall receive_MESSAGE_table
	
	SETTINGS:
		jnb acc.1,program_update
		lcall receive_SETTINGS_table
	
	program_update:
		jnb acc.2,Synchronize
		lcall receive_program_update

	Synchronize:
		jnb acc.3,Update_complete
		lcall receive_synchronization_update
		 lcall synchronize_rtc

	Update_complete:
		clr U_error
		mov cmd_buf,#READY
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#EOU,update_error
		jmp update_normal_end
	update_error:
    setb U_error
	jmp fghr1                   
	update_normal_end:
	clr U_error
fghr1:	                                                                                      

ret                                                                                          
;---------------------------------------
 ;------------------------------------------------
receive_PMS_NUM_table:
push acc
mov t1_c2,#40
lcall  end_scheduling_guard_time

		mov addr_hi,#017h;  ;first address of temp update map
		mov addr_lo,#070h; 
  		mov dptr,#00h
	PMS_NUM_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	PMS_NUM_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#0c2h,PMS_NUM_zx_0		;window size = 194
		mov a,dph
		cjne a,#00h,PMS_NUM_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,PMS_NUM_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,PMS_NUM_zx_3	; #0
		
		lcall save_PMS_NUM_to_e2p
		jmp PMS_NUM_zx_4

PMS_NUM_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,PMS_NUM_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp PMS_NUM_zx_01
PMS_NUM_zx_4:
	jmp PMS_NUM_update_normal_end
PMS_NUM_update_error:
    setb U_error
	jmp PMS_NUM_fghr1                   
PMS_NUM_update_normal_end:
	clr U_error
PMS_NUM_fghr1:
pop acc	                                                                                      
ret
;----------------------------------------------------
receive_FREE_NUM_table:
push acc
mov t1_c2,#40
lcall  end_scheduling_guard_time

		mov addr_hi,#018h;  ;first address of temp update map
		mov addr_lo,#032h; 
		mov dptr,#00h

	FREE_NUM_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	FREE_NUM_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#0f2h,FREE_NUM_zx_0		;window size = 242
		mov a,dph
		cjne a,#00h,FREE_NUM_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,FREE_NUM_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,FREE_NUM_zx_3	; #0
		
		lcall save_FREE_NUM_to_e2p
		jmp FREE_NUM_zx_4

FREE_NUM_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,FREE_NUM_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp FREE_NUM_zx_01
FREE_NUM_zx_4:
	jmp FREE_NUM_update_normal_end
FREE_NUM_update_error:
    setb U_error
	jmp FREE_NUM_fghr1                   
FREE_NUM_update_normal_end:
	clr U_error
FREE_NUM_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_CHARGING_table:
push acc
mov t1_c2,#200
lcall  end_scheduling_guard_time

		mov addr_hi,#019h; 2eh  ;first address of temp update map
		mov addr_lo,#026h; a1h
		mov dptr,#00h
	CHARGING_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	CHARGING_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#02ch,CHARGING_zx_0		;window size = 300
		mov a,dph
		cjne a,#01h,CHARGING_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,CHARGING_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,CHARGING_zx_3	; #0
		
		lcall save_CHARGING_to_e2p
		mov dptr,#00
		
		mov a,addr_hi
		cjne a,#02ah,CHARGING_zx_01	;2ah	   ; last address of update map
		mov a,addr_lo
		cjne a,#0bah,CHARGING_zx_01	;ba	   ;
		
		jmp CHARGING_zx_4
	CHARGING_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,CHARGING_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp CHARGING_zx_01
	CHARGING_zx_4:

		jmp CHARGING_update_normal_end
	CHARGING_update_error:
    setb U_error
	jmp CHARGING_fghr1                   
	CHARGING_update_normal_end:
	clr U_error
CHARGING_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_CHARGE_SCHEDULER_table:									    
push acc
mov t1_c2,#200
lcall  end_scheduling_guard_time

		mov addr_hi,#02ah;22h;  ;first address of temp update map
		mov addr_lo,#0bah;86h; 
		mov dptr,#00h

	CHARGE_SCHEDULER_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	CHARGE_SCHEDULER_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#052h,CHARGE_SCHEDULER_zx_0		;window size = 82
		mov a,dph
		cjne a,#00h,CHARGE_SCHEDULER_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,CHARGE_SCHEDULER_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,CHARGE_SCHEDULER_zx_3	; #0
		
		lcall save_CHARGE_SCHEDULER_to_e2p
		jmp CHARGE_SCHEDULER_zx_4

CHARGE_SCHEDULER_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,CHARGE_SCHEDULER_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp CHARGE_SCHEDULER_zx_01
CHARGE_SCHEDULER_zx_4:
	jmp CHARGE_SCHEDULER_update_normal_end
CHARGE_SCHEDULER_update_error:
    setb U_error
	jmp CHARGE_SCHEDULER_fghr1                   
CHARGE_SCHEDULER_update_normal_end:
	clr U_error
CHARGE_SCHEDULER_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_DAY_TYPE_table:									    
push acc
mov t1_c2,#100
lcall  end_scheduling_guard_time

		mov addr_hi,#02bh;  ;first address of temp update map
		mov addr_lo,#0ch ; 
		mov dptr,#00h

	DAY_TYPE_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	DAY_TYPE_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#06dh,DAY_TYPE_zx_0		;window size = 365
		mov a,dph
		cjne a,#01h,DAY_TYPE_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,DAY_TYPE_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,DAY_TYPE_zx_3	; #0
		
		lcall save_DAY_TYPE_to_e2p
		jmp DAY_TYPE_zx_4

DAY_TYPE_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,DAY_TYPE_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp DAY_TYPE_zx_01
DAY_TYPE_zx_4:
	jmp DAY_TYPE_update_normal_end
DAY_TYPE_update_error:
    setb U_error
	jmp DAY_TYPE_fghr1                   
DAY_TYPE_update_normal_end:
	clr U_error
DAY_TYPE_fghr1:	                                                                                      
pop acc
ret

;----------------------------------------------------
receive_BLACK_LIST_table:
push acc
mov t1_c2,#200
lcall  end_scheduling_guard_time

		mov addr_hi,#02ch;   ;first address of temp update map
		mov addr_lo,#079h; 
		mov dptr,#00h
	BLACK_LIST_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	BLACK_LIST_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#090h,BLACK_LIST_zx_0		;window size = 400
		mov a,dph
		cjne a,#01h,BLACK_LIST_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,BLACK_LIST_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,BLACK_LIST_zx_3	; #0
		
		lcall save_BLACK_LIST_to_e2p
		mov dptr,#00
		
		mov a,addr_hi
		cjne a,#031h,BLACK_LIST_zx_01	;	   ; last address of update map
		mov a,addr_lo
		cjne a,#029h,BLACK_LIST_zx_01	;	   ;
		
		jmp BLACK_LIST_zx_4
	BLACK_LIST_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,BLACK_LIST_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp BLACK_LIST_zx_01
	BLACK_LIST_zx_4:

		jmp BLACK_LIST_update_normal_end
	BLACK_LIST_update_error:
    setb U_error
	jmp BLACK_LIST_fghr1                   
	BLACK_LIST_update_normal_end:
	clr U_error
BLACK_LIST_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_WHITE_LIST_table:
push acc
mov t1_c2,#200
lcall  end_scheduling_guard_time

		mov addr_hi,#031h;   ;first address of temp update map
		mov addr_lo,#029h; 
		mov dptr,#00h
	WHITE_LIST_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	WHITE_LIST_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#090h,WHITE_LIST_zx_0		;window size = 400
		mov a,dph
		cjne a,#01h,WHITE_LIST_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,WHITE_LIST_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,WHITE_LIST_zx_3	; #0
		
		lcall save_WHITE_LIST_to_e2p
		mov dptr,#00
		
		mov a,addr_hi
		cjne a,#035h,WHITE_LIST_zx_01	;	   ; last address of update map
		mov a,addr_lo
		cjne a,#0d9h,WHITE_LIST_zx_01	;	   ;
		
		jmp WHITE_LIST_zx_4
	WHITE_LIST_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,WHITE_LIST_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp WHITE_LIST_zx_01
	WHITE_LIST_zx_4:

		jmp WHITE_LIST_update_normal_end
	WHITE_LIST_update_error:
    setb U_error
	jmp WHITE_LIST_fghr1                   
	WHITE_LIST_update_normal_end:
	clr U_error
WHITE_LIST_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_SAM_table:
push acc
mov t1_c2,#40
lcall  end_scheduling_guard_time

		mov addr_hi,#035h;  ;first address of temp update map
		mov addr_lo,#0d9h; 
		mov dptr,#00h

	SAM_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	SAM_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#056h,SAM_zx_0		;window size = 86
		mov a,dph
		cjne a,#00h,SAM_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,SAM_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,SAM_zx_3	; #0
		
		lcall save_SAM_to_e2p
		jmp SAM_zx_4

SAM_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,SAM_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp SAM_zx_01
SAM_zx_4:
	jmp SAM_update_normal_end
SAM_update_error:
    setb U_error
	jmp SAM_fghr1                   
SAM_update_normal_end:
	clr U_error
SAM_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_MESSAGE_table:
push acc
mov t1_c2,#50
lcall  end_scheduling_guard_time

		mov addr_hi,#036h;  ;first address of temp update map
		mov addr_lo,#02fh; 
		mov dptr,#00h
	MESSAGE_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	MESSAGE_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#00h,MESSAGE_zx_0		;window size = 256
		mov a,dph
		cjne a,#01h,MESSAGE_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,MESSAGE_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,MESSAGE_zx_3	; #0
		
		lcall save_MESSAGE_to_e2p
		mov dptr,#00
		
		mov a,addr_hi
		cjne a,#038h,MESSAGE_zx_01		   ; last address of update map
		mov a,addr_lo
		cjne a,#02fh,MESSAGE_zx_01		   ;
		
		jmp MESSAGE_zx_4
	MESSAGE_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,MESSAGE_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp MESSAGE_zx_01
	MESSAGE_zx_4:

		jmp MESSAGE_update_normal_end
	MESSAGE_update_error:
    setb U_error
	jmp MESSAGE_fghr1                   
	MESSAGE_update_normal_end:
	clr U_error
MESSAGE_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
receive_SETTINGS_table:
push acc
mov t1_c2,#40
lcall  end_scheduling_guard_time

		mov addr_hi,#038h;  ;first address of temp update map
		mov addr_lo,#02fh; 
		mov dptr,#00h

	SETTINGS_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	SETTINGS_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#02eh,SETTINGS_zx_0		;window size = 46	 ;2e
		mov a,dph
		cjne a,#00h,SETTINGS_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,SETTINGS_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,SETTINGS_zx_3	; #0
		
		lcall save_SETTINGS_to_e2p
		jmp SETTINGS_zx_4

SETTINGS_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,SETTINGS_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp SETTINGS_zx_01
SETTINGS_zx_4:
	jmp SETTINGS_update_normal_end
SETTINGS_update_error:
    setb U_error
	jmp SETTINGS_fghr1                   
SETTINGS_update_normal_end:
	clr U_error
SETTINGS_fghr1:	                                                                                      
pop acc
ret
;-------------------------------------
;----------------------------------------------------
save_PMS_NUM_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
PMS_NUM_kf_1:
	mov b,#120 ;retry count
PMS_NUM_kf_3:	
	call modem_write_byte
	jnc PMS_NUM_kf_2
	djnz b,PMS_NUM_kf_3

PMS_NUM_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#00h,PMS_NUM_kf_1
	mov a,dpl
	cjne a,#0c2h,PMS_NUM_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_FREE_NUM_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
FREE_NUM_kf_1:
	mov b,#120 ;retry count
FREE_NUM_kf_3:	
	call modem_write_byte
	jnc FREE_NUM_kf_2
	djnz b,FREE_NUM_kf_3

FREE_NUM_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#00h,FREE_NUM_kf_1
	mov a,dpl
	cjne a,#0f2h,FREE_NUM_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_CHARGING_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
CHARGING_kf_1:
	mov b,#120 ;retry count
CHARGING_kf_3:	
	call modem_write_byte
	jnc CHARGING_kf_2
	djnz b,CHARGING_kf_3

CHARGING_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#01h,CHARGING_kf_1
	mov a,dpl
	cjne a,#02ch,CHARGING_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_CHARGE_SCHEDULER_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
CHARGE_SCHEDULER_kf_1:
	mov b,#120 ;retry count
CHARGE_SCHEDULER_kf_3:	
	call modem_write_byte
	jnc CHARGE_SCHEDULER_kf_2
	djnz b,CHARGE_SCHEDULER_kf_3

CHARGE_SCHEDULER_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#00h,CHARGE_SCHEDULER_kf_1
	mov a,dpl
	cjne a,#050h,CHARGE_SCHEDULER_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_DAY_TYPE_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
DAY_TYPE_kf_1:
	mov b,#120 ;retry count
DAY_TYPE_kf_3:	
	call modem_write_byte
	jnc DAY_TYPE_kf_2
	djnz b,DAY_TYPE_kf_3

DAY_TYPE_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#01h,DAY_TYPE_kf_1
	mov a,dpl
	cjne a,#06dh,DAY_TYPE_kf_1

	mov 08fh,#01h

ret
;----------------------------------------------------
save_BLACK_LIST_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
BLACK_LIST_kf_1:
	mov b,#120 ;retry count
BLACK_LIST_kf_3:	
	call modem_write_byte
	jnc BLACK_LIST_kf_2
	djnz b,BLACK_LIST_kf_3

BLACK_LIST_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#01h,BLACK_LIST_kf_1
	mov a,dpl
	cjne a,#090h,BLACK_LIST_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_WHITE_LIST_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
WHITE_LIST_kf_1:
	mov b,#120 ;retry count
WHITE_LIST_kf_3:	
	call modem_write_byte
	jnc WHITE_LIST_kf_2
	djnz b,WHITE_LIST_kf_3

WHITE_LIST_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#01h,WHITE_LIST_kf_1
	mov a,dpl
	cjne a,#090h,WHITE_LIST_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_SAM_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
SAM_kf_1:
	mov b,#120 ;retry count
SAM_kf_3:	
	call modem_write_byte
	jnc SAM_kf_2
	djnz b,SAM_kf_3

SAM_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#00h,SAM_kf_1
	mov a,dpl
	cjne a,#056h,SAM_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_MESSAGE_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
MESSAGE_kf_1:
	mov b,#120 ;retry count	
MESSAGE_kf_3:	
	call modem_write_byte
	jnc MESSAGE_kf_2
	djnz b,MESSAGE_kf_3

MESSAGE_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#01h,MESSAGE_kf_1
	mov a,dpl
	cjne a,#00h,MESSAGE_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
save_SETTINGS_to_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
SETTINGS_kf_1:
	mov b,#120 ;retry count
SETTINGS_kf_3:	
	call modem_write_byte
	jnc SETTINGS_kf_2
	djnz b,SETTINGS_kf_3

SETTINGS_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#00h,SETTINGS_kf_1
	mov a,dpl
	cjne a,#02eh,SETTINGS_kf_1

	mov 08fh,#01h
ret
;---------------------------------------------------------
refresh_report_map:
push 02
 
lcall set_e2p_bus
lcall short_delay
		mov addr_lo,#00
		mov addr_hi,#00
 mov r2,#46
merght2:
		lcall fill_page
;;
clr c
mov a,addr_lo
add a,#128
mov addr_lo,a
mov a,addr_hi
addc a,#00h
mov addr_hi,a
;;		
djnz r2,merght2 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov addr_lo,#17h
		mov addr_hi,#00h
merght1:
		mov zdata,#0ffh
		lcall write_to_e2p
		lcall inc_e2p_counter
		
		mov a,addr_hi
		cjne a,#17h,merght1
		mov a,addr_lo
		cjne a,#6ch,merght1 
//ToDo : baghimandeye report map ta addresse 176ch fill shavad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lcall reload_serial_and_version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	    mov addr_hi,#00h
		mov addr_lo,#0ah
		mov zdata,#00h
		lcall write_to_e2p
	    mov addr_hi,#00h
		mov addr_lo,#0bh
		mov zdata,#0ch
		lcall write_to_e2p

	    mov addr_hi,#016h
		mov addr_lo,#0b4h
		mov zdata,#016h
		lcall write_to_e2p
	    mov addr_hi,#16h
		mov addr_lo,#0b5h
		mov zdata,#0b6h
		lcall write_to_e2p

		mov addr_hi,#017h
		mov addr_lo,#04ch
		mov zdata,#17h
		lcall write_to_e2p
	    mov addr_hi,#17h
		mov addr_lo,#04dh
		mov zdata,#04eh
		lcall write_to_e2p
pop 02
ret
;---------------------------------------
//
//refresh_report_map:
//lcall set_e2p_bus
//lcall short_delay
//		mov addr_lo,#05
//		mov addr_hi,#00
//merght1:
//		mov zdata,#0ffh
//		lcall write_to_e2p
//		lcall inc_e2p_counter
//		
//		mov a,addr_hi
//		cjne a,#17h,merght1
//		mov a,addr_lo
//		cjne a,#6ch,merght1 
//	  
//	    mov addr_hi,#00h
//		mov addr_lo,#0ah
//		mov zdata,#00h
//		lcall write_to_e2p
//	    mov addr_hi,#00h
//		mov addr_lo,#0bh
//		mov zdata,#0ch
//		lcall write_to_e2p
//
//	    mov addr_hi,#016h
//		mov addr_lo,#0b4h
//		mov zdata,#016h
//		lcall write_to_e2p
//	    mov addr_hi,#16h
//		mov addr_lo,#0b5h
//		mov zdata,#0b6h
//		lcall write_to_e2p
//
//		mov addr_hi,#017h
//		mov addr_lo,#04ch
//		mov zdata,#17h
//		lcall write_to_e2p
//	    mov addr_hi,#17h
//		mov addr_lo,#04dh
//		mov zdata,#04eh
//		lcall write_to_e2p
//ret
;---------------------------------------
refresh_update_map:
		mov addr_hi,#02ch;  
		mov addr_lo,#0ebh; 
sqfr1:	
		lcall read_e2p_byte
		
		lcall jump_up_e2p;;
	    mov zdata,a
		lcall write_to_e2p
		lcall jump_down_e2p;;
		lcall inc_e2p_counter
		
		mov a,addr_hi
		cjne a,#03eh,sqfr1		   
		mov a,addr_lo
		cjne a,#01ch,sqfr1 
ret
;---------------------------------------
send_command_pack:
		lcall send_preset
	 	mov send_buf,#10101010b
	 	lcall send_byte_i                                                                          
		
		lcall send_preset	    
	    mov a,cmd_buf
	    mov send_buf,a
	 	lcall send_byte_i
	 	
	 	lcall send_preset
	 	mov send_buf,#01010101b
	 	lcall send_byte_i                                                                                                                                                    
ret                                                                                          
;---------------------------------------
receive_command_pack:
	   lcall receive_preset
	   mov r3,#03
	   mov r1,#rcv_buf
	rp_1:
		lcall receive_byte_i
		inc r1
		djnz r3,rp_1
		
		mov r1,#rcv_buf
		mov a,@r1
		
		cjne a,#10101010b,command_error
		inc r1
		inc r1
		mov a,@r1
		cjne a,#01010101b,command_error
		
		mov r1,#rcv_buf
		inc r1
		mov a,@r1
		jmp end_rcv_cmd
	command_error:
		mov a,#0ffh
	end_rcv_cmd:
ret                                                                                          
;---------------------------------------
send_byte_x:   ;read byte from Xram & send
		mov a,#0efh
		lcall modem_replysync
		movx a,@dptr
	    mov b,a
	    mov a,#0e3h
	    lcall CMXcmdsync
		setb modem_INT
sg_1:   
		jb modem_INT,sg_1
ret
;---------------------------------------
send_byte_i:   ;get a byte in send_buf  & send
	 	mov a,#0efh
		lcall modem_replysync
		mov b,send_buf
	    mov a,#0e3h
	    lcall CMXcmdsync
		setb modem_INT
sm_1:   
		jb modem_INT,sm_1
ret
;---------------------------------------
receive_byte_i:           ; give a byte in rcv_buf at position r1
		setb modem_INT
	zfr_1:
		jb modem_INT,zfr_1
		
		mov a,#0efh
		lcall modem_replysync
	    
	    mov a,#0eah
		lcall modem_replysync
	    
	    mov @r1,b    
ret
;---------------------------------------
receive_byte_x:           ;save the received byte on Xram
		setb modem_INT
	zgr_2:
		jb modem_INT,zgr_2
		
		mov a,#0efh
		lcall modem_replysync
	    
	    mov a,#0eah
		lcall modem_replysync
	    
	    mov a,b
	    movx @dptr,a
ret
;---------------------------------------
send_preset:

		mov a,#0eeh
		mov b,#00000110b
		lcall CMXcmdsync
	   
	  	mov a,#0efh
	    lcall modem_replysync
ret  
;---------------------------------------
receive_preset:

		mov a,#0eah
		lcall modem_replysync
	    
	    mov a,#0efh
	    lcall modem_replysync
	    
	    mov a,#0eeh
	    mov b,#00001000b
	    lcall CMXcmdsync
ret
;---------------------------------------
;---------------------------------------
call_mode:
	 mov 08fh,#00h
	 mov ie,#00h
//	 mov sp,#080h ;05fh   	; initialize stack pointer
 	 mov 08eh,#00010000b									 
	
	
	 setb card_sw
	 setb lcd_sw ;*
	 lcall clear_lcd
	 lcall show_running
	 
	 
	// lcall send_antitap_signal
	 clr card_sw

	 mov state,#modem_condition
	 mov dptr,#00h  
	 lcall set_modem_bus
	 ;*clr card_sw
;	 setb lcd_sw ;*
	 setb voice_sw;*
	 setb modem_sw
	lcall delay2s


lcall call_pms
call_vx_0:	
mov cmd_buf,#HI
	lcall send_command_pack

call_vx_1:
	lcall receive_command_pack
	cjne a,#HI,call_vx_2
	
	mov cmd_buf,#ACK
	lcall send_command_pack
	jmp call_vx_3
call_vx_2:
lcall bye3
	  mov cmd_buf,#NACK
	lcall send_command_pack
	jmp call_vx_0
call_vx_3:
   	lcall report
	jb R_error,call_rthn1 
	 lcall update
		
	lcall  end_scheduling_guard_time
		lcall update_alarm
		lcall update_clock
		lcall update_date
	    lcall refresh_report_map
		lcall reload_payphone_serial_to_isp_e2p
	   lcall show_success_done
	   lcall delay1s
	   lcall clear_lcd
;;
 	lcall reset_alarm_interrupt
	lcall set_modem_bus
	lcall CMXinit
;;
	   lcall boot_loader
call_rthn1:

lcall bye3
ret
;----------------------------------------
answer_mode:
	 mov 08fh,#00h
	 mov ie,#00h
//	 mov sp,#080h ;05fh   	; initialize stack pointer
 	 mov 08eh,#00010000b									 
	 
	 setb card_sw
	 lcall send_antitap_signal
	 clr card_sw

	 mov state,#modem_condition
	 mov dptr,#00h  
	 lcall set_modem_bus
	 clr card_sw
	 clr lcd_sw
;pp;	 setb tel_sw
	 clr voice_sw
	 setb modem_sw

	lcall delay2s
	lcall answer
    lcall delay2s
    lcall delay2s
	lcall delay2s
    lcall delay2s
    lcall delay2s
	lcall delay2s

vx_0:	
mov cmd_buf,#HI
	lcall send_command_pack

vx_1:
	lcall receive_command_pack
	cjne a,#HI,vx_2
	
	mov cmd_buf,#ACK
	lcall send_command_pack
	jmp vx_3
vx_2:
lcall bye3
	  mov cmd_buf,#NACK
	lcall send_command_pack
	jmp vx_0
vx_3:
   	lcall report
	jb R_error,rthn1 
	 lcall update

	lcall  end_scheduling_guard_time
		
		lcall update_alarm
		lcall update_clock
		lcall update_date
	 lcall refresh_report_map
		lcall reload_payphone_serial_to_isp_e2p
;;
 	lcall reset_alarm_interrupt
	lcall set_modem_bus
	lcall CMXinit
;;
	 lcall boot_loader

rthn1:
lcall bye3
ret
 ;------------------------------------------------
emergency_mode:
//	 mov 08fh,#00h
//	 mov ie,#00h
//	 mov sp,#080h ;05fh   	; initialize stack pointer
// 	 mov 08eh,#00010000b									 
	 mov state,#modem_condition
	 mov dptr,#00h  
	 lcall set_modem_bus
	 clr card_sw
	 clr lcd_sw
;pp;	 setb tel_sw
	 clr voice_sw
	 setb modem_sw
	lcall delay2s
lcall call_pms
emergency_vx_0:	
mov cmd_buf,#HI
	lcall send_command_pack

emergency_vx_1:
	lcall receive_command_pack
	cjne a,#HI,emergency_vx_2
	
	mov cmd_buf,#its_emergency_report
	lcall send_command_pack
	jmp emergency_vx_3
emergency_vx_2:
;lcall bye3
	  mov cmd_buf,#NACK
	lcall send_command_pack
	jmp emergency_vx_0
emergency_vx_3:
   	lcall emergency_report
	lcall  end_scheduling_guard_time
emergency_rthn1:
lcall bye3
ret
 ;------------------------------------------------
 schedule_guard_time:
 	push 01
	push 02
	push psw
	                 mov TH1,#00h;03ch
                     mov TL1,#00h;afh
					 
					 ;setb TR1
					 mov r1,t1_c1
					 djnz r1,out_timer1_2_fff
					 mov r1,#10;20	
					 mov r2,t1_c2
					 djnz r2,out_timer1_1_fff

					lcall bye3
					
					jmp uytr1_fff
					out_timer1_1_fff:
					mov t1_c2,r2
					out_timer1_2_fff:
					mov t1_c1,r1

uytr1_fff:
	pop psw
	pop 02
	pop 01		
 ret
 ;------------------------------------------------
 start_scheduling_guard_time:
 mov state,#modem_condition
 push acc
 mov t1_c1,#10;20
 mov TH1,#00h;03ch
 mov TL1,#00h;0afh
 mov a,TMOD
 orl a,#00010000B	 
 mov TMOD,a
  setb ie.3
  setb ie.7	
  setb TR1
 pop acc
 ret
 ;------------------------------------------------
end_scheduling_guard_time:
clr  TR1
clr ie.3
clr ie.7																   
ret
;-------------------------------------------------
;----------------------------------------------------
receive_program_update:
push acc
mov t1_c2,#200
lcall  end_scheduling_guard_time	   ;;;///;;;

		mov addr_hi,#00h;   ;first address of temp update map
		mov addr_lo,#00h; 
		mov dptr,#00h
	program_update_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	program_update_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#00h,program_update_zx_0		;window size = 1024
		mov a,dph
		cjne a,#04h,program_update_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,program_update_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,program_update_zx_3	; #0
		
		lcall save_program_update_to_isp_e2p
		mov dptr,#00
		
		mov a,addr_hi
		cjne a,#0f0h,program_update_zx_01	;	   ; last address of update map
		mov a,addr_lo
		cjne a,#00h,program_update_zx_01	;	   ;
		
		jmp program_update_zx_4
	program_update_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,program_update_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp program_update_zx_01
	program_update_zx_4:

		jmp program_update_normal_end
	program_update_error:
    setb U_error
	////////////////////////
	mov addr_hi,#0ffh	  //
	mov addr_lo,#0f0h	  //
	mov zdata,#00h		  //  update unavailable 
	lcall isp_write_to_e2p//   
	////////////////////////

	jmp program_update_fghr1                   
	program_update_normal_end:

	 
	////////////////////////
	mov addr_hi,#0ffh	  //
	mov addr_lo,#0f0h	  //
	mov zdata,#0aah		  //  update available 
	lcall isp_write_to_e2p//   
	////////////////////////
						  
	clr U_error
program_update_fghr1:	                                                                                      
pop acc
ret
;----------------------------------------------------
save_program_update_to_isp_e2p:
	mov 08fh,#00h

 	mov dptr,#00h
program_update_kf_1:
	mov b,#255 ;retry count
program_update_kf_3:	
	call isp_write_byte
	jnc program_update_kf_2
	djnz b,program_update_kf_3

program_update_kf_2:
	inc dptr
	call inc_e2p_counter
	mov a,dph
	cjne a,#04h,program_update_kf_1
	mov a,dpl
	cjne a,#00h,program_update_kf_1

	mov 08fh,#01h
ret
;----------------------------------------------------
receive_synchronization_update:
push acc
mov t1_c2,#40
lcall  end_scheduling_guard_time

		mov addr_hi,#00h;
		mov addr_lo,#00h; 
		mov dptr,#00h

	synchronization_zx_01:
	
		lcall clear_crc
		mov cmd_buf,#READY
		lcall send_command_pack
		lcall receive_preset	 
	synchronization_zx_0:                  
		
		lcall receive_byte_x 
		lcall crc16
		
		inc dptr
		
		mov a,dpl
		cjne a,#06h,synchronization_zx_0		;window size = 6	 
		mov a,dph
		cjne a,#00h,synchronization_zx_0
						     	
		lcall receive_byte_i
		mov tmp_buf,b
		
		lcall receive_byte_i
		mov a,b
		
		cjne a,crc_lo,synchronization_zx_3	; #0
		mov a,tmp_buf
		cjne a,crc_hi,synchronization_zx_3	; #0
		
		//lcall synchronize_rtc
		jmp SETTINGS_zx_4

synchronization_zx_3:
		mov dptr,#00
		
		mov cmd_buf,#NACK
		lcall send_command_pack

		lcall receive_command_pack
		cjne a,#NACK,synchronization_error
	
		mov cmd_buf,#ACK
		lcall send_command_pack
		
		lcall send_preset
		 
		  lcall delay1s		 
		jmp synchronization_zx_01
synchronization_zx_4:
	jmp synchronization_normal_end
synchronization_error:
    setb U_error
	jmp synchronization_fghr1                   
synchronization_normal_end:
	clr U_error
synchronization_fghr1:	                                                                                      
pop acc

ret
;----------------------------------------
synchronize_rtc:

lcall set_rtc_bus
lcall short_delay

mov dptr,#00h
movx a,@dptr   //hour
mov  XmtDat+3,a

mov dptr,#01h
movx a,@dptr   //minute
mov  XmtDat+2,a

mov dptr,#02h
movx a,@dptr   //second
mov  XmtDat+1,a

MOV     XmtDat,#02h
MOV     R0,#XmtDat  
MOV     ByteCnt,#4 
MOV     SlvAdr,#I2CRTC   
lCALL   SendData   //set the new time


;;;;;;;;;;;;;;;;
mov dptr,#03h
movx a,@dptr   
mov  year,a

mov dptr,#04h
movx a,@dptr   
mov  month,a

mov dptr,#05h
movx a,@dptr   
mov  day,a

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
lCALL SendData   ;//set the new date
lcall set_modem_bus
ret