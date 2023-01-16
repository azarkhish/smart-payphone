 ;_____________ recieving sync reply from CMX to B addressed by A _____
antitap_replysync: 
lcall set_handset_check_bus
 
clr ie.7	
        push 01
	    clr antitap_csn                                                    ;This subroutine takes A as
        nop
		nop
		nop
		mov r1,#8                                                    ;address and brings data
at_CMX03:  clr antitap_clk                                                   ;from addressed register to
        nop
		nop
		nop
		RLC A                                                        ;B
        mov antitap_com,C                                                 ;
        setb antitap_clk                                                  ;
        nop
		nop
		nop
		djnz r1,at_CMX03                                                ;
        
        mov r1,#8                                                    ;
        setb antitap_reply                                                  ;
		nop
		nop
		nop
at_CMX01:  clr antitap_clk                                                   ;
        nop
		nop
		nop
		nop
        setb antitap_clk                                                  ;
        mov C,antitap_reply                                                 ;
        RLC A                                                        ;
        djnz r1,at_CMX01                                                ;
        nop
		nop
		clr antitap_clk                                                   ;
        nop
		nop
		nop
		setb antitap_csn                                                   ;
        nop
		nop
		mov B,A 
		pop 01
setb ie.7	                                                     ;
ret                                  

;----------------------------------------------

;----------------------------------------------------
encrypt_pack:
	mov dptr, #anti_tap_value 
	movc a, @a+dptr 
ret
;----------------------------------
send_sync:
push acc
 mov A,#0D0H         ;addressing SETUP register
    mov B,#01000000b    ;
    lcall at_CMXcmdsync    ;
lcall send_one
;lcall send_one
;lcall send_one
;lcall send_zerro
;lcall send_zerro
lcall send_zerro
lcall send_one
lcall send_zerro
pop acc
ret
;--------------------------------
send_pack:
clr ie.7
	lcall delay110m
	lcall delay110m
//	lcall delay110m
//	lcall delay110m
//	lcall delay110m
;	 lcall delay1s

lcall send_sync

mov a,zdata	 ;#10

jb acc.0,mv0
lcall send_zerro
jmp xc0
mv0:
lcall send_one
xc0:
jb acc.1,mv1
lcall send_zerro
jmp xc1
mv1:
lcall send_one
xc1:
jb acc.2,mv2
lcall send_zerro
jmp xc2
mv2:
lcall send_one
xc2:
jb acc.3,mv3
lcall send_zerro
jmp xc3
mv3:
lcall send_one
xc3:
jb acc.4,mv4
lcall send_zerro
jmp xc4
mv4:
lcall send_one
xc4:
jb acc.5,mv5
lcall send_zerro
jmp xc5
mv5:
lcall send_one
xc5:
jb acc.6,mv6
lcall send_zerro
jmp xc6
mv6:
lcall send_one
xc6:
jb acc.7,mv7
lcall send_zerro
jmp xc7
mv7:
lcall send_one
xc7:
 	 
    mov A,#0D1H         ;addressing SETUP register
    mov B,#00h    ;	 
	lcall at_CMXcmdsync
    mov A,#0D0H         ;addressing SETUP register
    mov B,#00h    ;	 
	lcall at_CMXcmdsync
	
	lcall delay110m
	lcall delay110m
setb ie.7
ret
;--------------------------------
send_one:
push acc

	 mov A,#0D1H         ;addressing MODE register
    mov B,#10000000b    ;
    lcall at_CMXcmdsync    ;
	 mov A,#0D0H         ;addressing SETUP register
    mov B,#01000000b    ;
    lcall at_CMXcmdsync    ;

	lcall delay_pulse_rise
pop acc
ret
;--------------------------------
send_zerro:
push acc
	 mov A,#0D1H         ;addressing MODE register
    mov B,#00h    ;
    lcall at_CMXcmdsync    ;
	 mov A,#0D0H         ;addressing SETUP register
    mov B,#00H    ;
    lcall at_CMXcmdsync    ;

	lcall delay_pulse_fall
pop acc
ret
;--------------------------------
//set_safe_guard_timer:
//push acc
//mov t0_c1,#140
//mov TH0,#00h
//mov TL0,#00h
// mov a,TMOD
// orl a,#00000001B
// mov TMOD,a
//setb ie.1
//setb ie.7
//setb TR0
//clr guard
//setb ip.1
//pop acc
//ret
;--------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//clear_safe_guard_timer:
//	clr  TR0
//	clr ie.1
//    clr guard
//    clr ip.1
//
//ret
;--------------------------------
//activate_guard:
//setb guard
//	clr  TR0
//	clr ie.1
//    clr ip.1
//ret
;--------------------------------
recieve_pack:
;clr lcd_bl
push ie
mov ie,#00h
clr ip.2
setb p3.3
mov a,#00h
;lcall set_safe_guard_timer


wait_for_sync:
;jb guard,out_of_antitap_wait
jnb p3.3,wait_for_sync

wait_for_start:
;jb guard,out_of_antitap_wait
jb p3.3,wait_for_start

wait_for_trigger:
;jb guard,out_of_antitap_wait
jnb p3.3,wait_for_trigger

;lcall clear_safe_guard_timer

lcall delay_mid_pulse

jb p3.3,cb1
setb acc.0
cb1:
;
lcall delay_pulse_width
jb p3.3,cb2
setb acc.1
cb2:
lcall delay_pulse_width
jb p3.3,cb3
setb acc.2
cb3:
lcall delay_pulse_width
jb p3.3,cb4
setb acc.3
cb4:
lcall delay_pulse_width
jb p3.3,cb5
setb acc.4
cb5:
lcall delay_pulse_width
jb p3.3,cb6
setb acc.5
cb6:
lcall delay_pulse_width
jb p3.3,cb7
setb acc.6
cb7:
lcall delay_pulse_width
jb p3.3,cb8
setb acc.7
cb8:

lcall encrypt_pack

mov zdata,a
lcall delay110m
lcall send_pack
lcall delay110m
;lcall delay110m
;lcall delay110m
;lcall delay110m

out_of_antitap_wait:
;lcall clear_safe_guard_timer
;lcall set_lcd_back_light
pop ie
ret
;----------------------------
;_____________ sending sync command from B to CMX addressed by A ____
at_CMXcmdsync:
push acc                                                         ;
        push 01
		clr antitap_csn
		nop
		nop
		nop                                                   ;This subroutine takes A as
        mov r1,#8                                                   ;address and B as data then
at_CMX00:  clr antitap_clk                                                  ;sends the data to addressed
        nop
		nop
		nop
		RLC A                                                       ;register in CMX modem
        mov antitap_com,C                                                ;
        setb antitap_clk                                                 ;
        djnz r1,at_CMX00                                               ;

        mov A,B                                                     ;
        mov r1,#8                                                   ;
at_CMX02:  clr antitap_clk                                                  ;
        nop
		nop
		nop
		RLC A                                                       ;
        mov antitap_com,C                                                ;
        setb antitap_clk                                                 ;
        djnz r1,at_CMX02                                               ;
        clr antitap_clk                                                  ;
        nop
		nop
		nop
		setb antitap_csn
		nop
		nop
		nop
		pop 01
pop acc                                                  ;
RET                                           
;----------------------------
;----------------------------
send_dtmf:
clr ie.7
	lcall delay110m
	lcall delay110m   

    mov A,#0D0H         ;addressing SETUP register
    mov B,#01000000b    ;01000000b
    lcall at_CMXcmdsync    ;
	 mov A,#0D1H         ;addressing MODE register
    mov B,#01011110b    ;
    lcall at_CMXcmdsync    ;
	 mov A,#0D4H         ;addressing MODE register
    mov B,#11001100b    ;
    lcall at_CMXcmdsync    ;

				lcall delay110m
					lcall delay110m
				lcall delay110m

    mov A,#0D0H         ;addressing SETUP register
    mov B,#00h    ;
    lcall at_CMXcmdsync 
	lcall delay110m  
setb ie.7

ret
;--------------
send_antitap_signal:
clr ie.7
mov addr_hi,#AntiTapActivate_addr_hi
mov addr_lo,#AntiTapActivate_addr_lo
lcall read_e2p_byte

cjne a,#160,out_send_antitap_signal

	lcall delay110m

    	mov A,#0D0H         ;addressing SETUP register
    mov B,#01000000b    ;01000000b
    lcall at_CMXcmdsync    ;
	 mov A,#0D1H         ;addressing MODE register
    mov B,#10000000b    ;
    lcall at_CMXcmdsync    ;

				lcall delay110m
					lcall delay110m

;;;;;;;;;;;;;;;;;
    mov A,#0D0H         ;addressing SETUP register
    mov B,#00h    ;
    lcall at_CMXcmdsync 
	lcall delay110m  
out_send_antitap_signal:
setb ie.7
 ret
;------------------------------------
initialize_antitap:

lcall delay110m

    mov A,#01h           ;applying General Reset
    mov B,#00h            ;
    lcall at_CMXcmdsync 

    mov A,#0d0h           ;
    mov B,#00h            ;
    lcall at_CMXcmdsync 

    mov A,#0d1h           ;
    mov B,#00h            ;
    lcall at_CMXcmdsync 

ret

