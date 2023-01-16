cal_account:

jb valid_card,uygeyfg1
jmp uygeyfg2
uygeyfg1:

//push ie
clr ie.7
;clr standby_sw	  ;"""""""""""""""""""""""""""""""""""""""""""""""""""
lcall set_card_bus
clr card_output
setb CARD_INPUT
lcall short_delay

;lcall atf_recovery	  baraye ghom
push START_COL
setb psw.3
clr  psw.4

lcall reset_card
lcall short_delay

mov r1,#0
mov r0,#72
n1:
lcall clock_card
djnz r0,n1
mov r0,#8
n2: 
jnb CARD_INPUT,n3
inc r1
n3:
lcall clock_card
djnz r0,n2
mov a,r1
mov b,#8
mul ab
mov b,#64
mul ab
mov r2,a
mov r3,b
mov r0,#8
mov r1,#0
n4:
jnb CARD_INPUT,n5
inc r1
n5:
lcall clock_card
djnz r0,n4
mov a,r1
mov b,#64
mul ab
clr c
addc a,r2
mov r2,a
mov a,b
addc a,r3
mov r3,a
mov r0,#8
mov r1,#0
n6:
jnb CARD_INPUT,n7
inc r1
n7:
lcall clock_card
djnz r0,n6
mov a,r1
mov b,#8
mul ab
clr c
addc a,r2
mov r2,a
mov a,#0
addc a,r3
mov r3,a  
mov r0,#8
mov r1,#0
n8:
jnb CARD_INPUT,n9
inc r1
n9:
lcall clock_card
djnz r0,n8
mov a,r1
clr c
addc a,r2
mov r2,a
mov a,#0
addc a,r3
mov r1,a  

;jmp valid_1
;;;;;;;;;;;;;;;;;;;;;;
cjne r1,#0,valid_0 
cjne r2,#0,valid_0   
 	lcall clear_line_5
	lcall clear_line_6
                 
lcall card_not_valid  ;<----inja mojoodie cart 0 ast
pop START_COL
clr psw.3                                         
clr psw.4
setb ie.7//pop ie 
;setb standby_sw	  ;"""""""""""""""""""""""""""""""""""""""""""""""""""
;setb card_sw
ret

valid_0:  
cjne r1,#18,valid_1
cjne r2,#72,valid_1  
	lcall clear_line_5
	lcall clear_line_6
                    
lcall card_not_detected  ;<----inja cart bar ax gozashte shode
pop START_COL
clr psw.3                                         
clr psw.4
setb ie.7//pop ie 
;setb standby_sw	  ;""""""""""""""""""""""""""""""""""""""""""""""""""
;setb card_sw
ret
valid_1:
clr CARD_STATUS
;;;;;;;;;;;;;;;;;;;;;;       

mov a,r1
mov r3,a
mov a,r2
mov r4,a
mov r0,#4
mul_five:
clr c
mov a,r2
addc a,r4
mov r2,a
mov a,r1
addc a,r3
mov r1,a
djnz r0,mul_five

www:
	   setb psw.3
       clr  psw.4
		;r1 MSByte 
		;r2 lsbyte
mov  current_account_hi,r1
mov  current_account_lo,r2
;+++++++++++++++++++++++++++++++++++++++++++++++
mov a,r1
mov r3,a
mov a,r2
mov r4,a
mov r0,#9
mul_ten:
clr c
mov a,r2
addc a,r4
mov r2,a
mov a,r1
addc a,r3
mov r1,a
djnz r0,mul_ten

jb initial_account,show_virtual_account
setb initial_account

mov virt_account_hi,r1
mov virt_account_lo,r2


show_virtual_account:                      
mov r1,virt_account_hi
mov r2,virt_account_lo

        mov r3,#00       
        mov r4,#00
        mov r5,#00
        mov r6,#00
        mov r7,#00
 
mov b,#10d
        mov a,r2
        div ab
        mov   r3,b              ;   
        mov   b,#10             ; r7,r6,r5,r4,r3
        div   ab
        mov   r4,b
        mov   r5,a
        cjne r1,#0h,high_byte   ; check for high byte
        sjmp endd
 
high_byte:
mov   a,#6
        add   a,r3
mov   b,#10
div   ab
        mov   r3,b
add   a,#5
        add   a,r4
mov   b,#10
div   ab
        mov   r4,b
add   a,#2
        add   a,r5
mov   b,#10
div   ab
        mov   r5,b
        cjne r6,#00,add_it
        sjmp continue
add_it:
        add a,r6
continue:
        mov r6,a
        djnz r1,high_byte
        mov b, #10
        mov a,r6
        div ab
        mov r6,b
        mov r7,a
endd:
;;
lcall set_lcd_bus
;;;;;;;;;;;;;;;;;;
	lcall clear_line_5
	lcall clear_line_6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov TEXTURE_LENGTH,#6
mov START_ROW,#ROW_5
mov START_COL,#120

zerro_0: 
 cjne r7,#0,one_0 
   mov dptr,#530
one_0:
 cjne r7,#1,two_0
   mov dptr,#430
two_0:
 cjne r7,#2,three_0
   mov dptr,#440
three_0:
 cjne r7,#3,four_0
   mov dptr,#450
four_0:
 cjne r7,#4,five_0
  mov dptr,#460
five_0:
 cjne r7,#5,six_0
  mov dptr,#470
six_0:     
 cjne r7,#6,seven_0
  mov dptr,#480
seven_0:
 cjne r7,#7,eight_0
  mov dptr,#490
eight_0:
 cjne r7,#8,nine_0
 mov dptr,#500
nine_0:
cjne r7,#9,out_0
 mov dptr,#510
out_0: 
mov b,STATUS_FLAGS
setb LCD_CS
lcall show_pattern
mov STATUS_FLAGS,b

;;;;;;;;;;;;;;;;;;
mov TEXTURE_LENGTH,#6
mov START_ROW,#ROW_5
mov START_COL,#112

zerro_1:
 cjne r6,#0,one_1
  cjne r7,#0,no_blank_1 
  mov dptr,#530
  jmp one_2
no_blank_1:     
     mov dptr,#520
one_1:
 cjne r6,#1,two_1
   mov dptr,#430
two_1:
 cjne r6,#2,three_1
   mov dptr,#440
three_1:
 cjne r6,#3,four_1
   mov dptr,#450
four_1:
 cjne r6,#4,five_1
  mov dptr,#460
five_1:
 cjne r6,#5,six_1
  mov dptr,#470
six_1:     
 cjne r6,#6,seven_1
  mov dptr,#480
seven_1:
 cjne r6,#7,eight_1
  mov dptr,#490
eight_1:
 cjne r6,#8,nine_1
 mov dptr,#500
nine_1:
cjne r6,#9,out_1
 mov dptr,#510
out_1: 
mov b,STATUS_FLAGS
setb LCD_CS
lcall show_pattern
mov STATUS_FLAGS,b

mov TEXTURE_LENGTH,#6
mov START_ROW,#ROW_5
mov START_COL,#104
zerro_2: 
 cjne r5,#0,one_2
 cjne r7,#0,no_blank_2
 cjne r6,#0,no_blank_2
 mov dptr,#530
 jmp one_2 
no_blank_2:    
    mov dptr,#520
one_2:
 cjne r5,#1,two_2
     mov dptr,#430
two_2:
 cjne r5,#2,three_2
     mov dptr,#440
three_2:
 cjne r5,#3,four_2
     mov dptr,#450
four_2:
 cjne r5,#4,five_2
     mov dptr,#460
five_2:
 cjne r5,#5,six_2
     mov dptr,#470
six_2:     
 cjne r5,#6,seven_2
     mov dptr,#480
seven_2:
 cjne r5,#7,eight_2
    mov dptr,#490
eight_2:
 cjne r5,#8,nine_2
    mov dptr,#500

nine_2:
 cjne r5,#9,out_2
    mov dptr,#510
out_2:
mov b,STATUS_FLAGS
setb LCD_CS
lcall show_pattern
mov STATUS_FLAGS,b
mov TEXTURE_LENGTH,#6
mov START_ROW,#ROW_5
mov START_COL,#96
zerro_3: 
;;;;;;;;;;;;;;;;;
 cjne r4,#0,one_3
 cjne r7,#0,no_blank_3
 cjne r6,#0,no_blank_3
 cjne r5,#0,no_blank_3
 mov dptr,#530
 jmp one_3 
no_blank_3:    
    mov dptr,#520

;;;;;;;;;;;;;
one_3:
 cjne r4,#1,two_3
    mov dptr,#430
two_3:
 cjne r4,#2,three_3
    mov dptr,#440
three_3:
 cjne r4,#3,four_3
    mov dptr,#450
four_3:
 cjne r4,#4,five_3
    mov dptr,#460
five_3:
 cjne r4,#5,six_3
    mov dptr,#470
six_3:     
 cjne r4,#6,seven_3
    mov dptr,#480
seven_3:
 cjne r4,#7,eight_3
    mov dptr,#490
eight_3:
 cjne r4,#8,nine_3
    mov dptr,#500

nine_3:
 cjne r4,#9,out_3
    mov dptr,#510
  
out_3:
mov b,STATUS_FLAGS
setb LCD_CS
lcall show_pattern
mov STATUS_FLAGS,b     
mov TEXTURE_LENGTH,#6
mov START_ROW,#ROW_5
mov START_COL,#88
zerro_4: 
 cjne r3,#0,one_4 
    mov dptr,#520
one_4:
 cjne r3,#1,two_4
    mov dptr,#430
two_4:
 cjne r3,#2,three_4
    mov dptr,#440
three_4:
 cjne r3,#3,four_4
    mov dptr,#450
four_4:
 cjne r3,#4,five_4
    mov dptr,#460
five_4:
 cjne r3,#5,six_4
    mov dptr,#470
six_4:     
 cjne r3,#6,seven_4
    mov dptr,#480
seven_4:
 cjne r3,#7,eight_4
    mov dptr,#490
eight_4:
 cjne r3,#8,nine_4
    mov dptr,#500
nine_4:
 cjne r3,#9,out_4
    mov dptr,#510  
out_4:   
mov b,STATUS_FLAGS
setb LCD_CS
lcall show_pattern  
//mov TEXTURE_LENGTH,#6
//mov START_ROW,#ROW_5
//mov START_COL,#88
//mov dptr,#520 
//setb LCD_CS
//lcall show_pattern 
//mov STATUS_FLAGS,b                                        ;
mov dptr,# 1740                                   ;
    mov TEXTURE_LENGTH,#24               ;tool              ;
    mov START_ROW,#ROW_5               ;lcd code  4     ;
    mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    clr LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;
clr psw.3                                         
clr psw.4 
//lcall check_if_need_to_alert
pop START_COL
setb ie.7//pop ie
;setb standby_sw	  ;"""""""""""""""""""""""""""""""""""""""""""""""""""
uygeyfg2:
;setb card_sw
lcall set_key_bus
ret
;-----------------------------
authenticate:
mov a,phone_access_level
cjne a,#free_call,rhka1
	clr ACCESS0
	clr ACCESS1
	clr CARD_STATUS
	jmp rhka2 
rhka1:

	setb ACCESS0
	clr ACCESS1
	clr CARD_STATUS
jb valid_card,rhka2
	lcall card_not_detected
rhka2:

lcall test_sam
ret
;-----------------------------
card_not_detected:
lcall clear_lcd
clr mic_mute   ;

lcall show_card_invalid				 
    clr ACCESS0
    clr ACCESS1 
    setb CARD_STATUS  
	
	lcall notice_buzz
	lcall notice_buzz
	
	jnb FIRST_KEY,srp11
	lcall flash 
srp11:	 

ret
;-------------------------------
card_not_valid:
lcall clear_lcd
clr mic_mute ;
	lcall notice_buzz
	lcall notice_buzz
lcall end_scheduling_answer_time
lcall end_scheduling_dial_wait_time
lcall end_scrolling_message
lcall show_no_balance 				 
lcall show_atleast_balance_to_start
    clr ACCESS0
    clr ACCESS1 
    setb CARD_STATUS  
	jnb FIRST_KEY,srp12
	lcall flash 
srp12:	 
ret
;-----------------------------------

//check_if_need_to_alert:
//push 00
//push 01
//push 02
//push 03
//push 04
//push 05
//push 06
//push 07
//push acc
//push b
//push dpl
//push dph
//
//jb latch_up_pulse_duration,kjgd1
//jmp dont_need_to_alert
//
//kjgd1:
//
//mov r1,current_account_hi
//mov r0,current_account_lo
//
//mov r3,#00h
//mov r2,#10;change to rials
//;====================================================================
//; subroutine UMUL16
//; 16-Bit x 16-Bit to 32-Bit Product Unsigned Multiply
//;
//; input:    r1, r0 = multiplicand X
//;           r3, r2 = multiplier Y
//;
//; output:   r3, r2, r1, r0 = product P = X x Y
//;
//; alters:   acc, C
//;====================================================================
//
//               mov     a, r0
//               mov     b, r2
//               mul     ab              ; multiply XL x YL
//               push    acc             ; stack result low byte
//               push    b               ; stack result high byte
//               mov     a, r0
//               mov     b, r3
//               mul     ab              ; multiply XL x YH
//               pop     00H
//               add     a, r0
//               mov     r0, a
//               clr     a
//               addc    a, b
//               mov     dpl, a
//               mov     a, r2
//               mov     b, r1
//               mul     ab              ; multiply XH x YL
//               add     a, r0
//               mov     r0, a
//               mov     a, dpl
//               addc    a, b
//               mov     dpl, a
//               clr     a
//               addc    a, #0
//               push    acc             ; save intermediate carry
//               mov     a, r3
//               mov     b, r1
//               mul     ab              ; multiply XH x YH
//               add     a, dpl
//               mov     r2, a
//               pop     acc             ; retrieve carry
//               addc    a, b
//               mov     r3, a
//               mov     r1, 00H
//               pop     00H             ; retrieve result low byte
//
//cjne r2,#00,tyew1
//jmp tyew2 
//tyew1:
//jmp dont_need_to_alert
//tyew2:
//
//cjne r3,#00,tyew3
//jmp tyew4 
//tyew3:
//jmp dont_need_to_alert
//tyew4:
//
//
//mov r3,paytol_hi
//mov r2,paytol_lo
//;8888888888888888888888888888888888888888 
//
//;====================================================================
//; subroutine UDIV16
//; 16-Bit / 16-Bit to 16-Bit Quotient & Remainder Unsigned Divide
//;
//; input:    r1, r0 = Dividend X
//;           r3, r2 = Divisor Y
//;
//; output:   r1, r0 = quotient Q of division Q = X / Y
//;           r3, r2 = remainder 
//;
//; alters:   acc, B, dpl, dph, r4, r5, r6, r7, flags
//;====================================================================
//       
//			   mov     r7, #0          ; clear partial remainder
//               mov     r6, #0
//               mov     B, #16          ; set loop count
//
//div_loop:      clr     C               ; clear carry flag
//               mov     a, r0           ; shift the highest bit of
//               rlc     a               ; the dividend into...
//               mov     r0, a
//               mov     a, r1
//               rlc     a
//               mov     r1, a
//               mov     a, r6           ; ... the lowest bit of the
//               rlc     a               ; partial remainder
//               mov     r6, a
//               mov     a, r7
//               rlc     a
//               mov     r7, a
//               mov     a, r6           ; trial subtract divisor
//               clr     C               ; from partial remainder
//               subb    a, r2
//               mov     dpl, a
//               mov     a, r7
//               subb    a, r3
//               mov     dph, a
//               cpl     C               ; complement external borrow
//               jnc     div_1           ; update partial remainder if
//                                       ; borrow
//               mov     r7, dph         ; update partial remainder
//               mov     r6, dpl
//div_1:         mov     a, r4           ; shift result bit into partial
//               rlc     a               ; quotient
//               mov     r4, a
//               mov     a, r5
//               rlc     a
//               mov     r5, a
//               djnz    B, div_loop
//               mov     a, r5           ; put quotient in r0, and r1
//               mov     r1, a
//               mov     a, r4
//               mov     r0, a
//               mov     a, r7           ; get remainder, saved before the
//               mov     r3, a           ; last subtraction
//               mov     a, r6
//               mov     r2, a
//
//cjne r1,#00h,weoir1
//cjne r2,#01h,weoir1
//jmp need_to_alert_account_free
//weoir1:
//
//mov r3,#00h
//mov r2,#200;pulse_duration
//;====================================================================
//; subroutine UMUL16
//; 16-Bit x 16-Bit to 32-Bit Product Unsigned Multiply
//;
//; input:    r1, r0 = multiplicand X
//;           r3, r2 = multiplier Y
//;
//; output:   r3, r2, r1, r0 = product P = X x Y
//;
//; alters:   acc, C
//;====================================================================
//
//               mov     a, r0
//               mov     b, r2
//               mul     ab              ; multiply XL x YL
//               push    acc             ; stack result low byte
//               push    b               ; stack result high byte
//               mov     a, r0
//               mov     b, r3
//               mul     ab              ; multiply XL x YH
//               pop     00H
//               add     a, r0
//               mov     r0, a
//               clr     a
//               addc    a, b
//               mov     dpl, a
//               mov     a, r2
//               mov     b, r1
//               mul     ab              ; multiply XH x YL
//               add     a, r0
//               mov     r0, a
//               mov     a, dpl
//               addc    a, b
//               mov     dpl, a
//               clr     a
//               addc    a, #0
//               push    acc             ; save intermediate carry
//               mov     a, r3
//               mov     b, r1
//               mul     ab              ; multiply XH x YH
//               add     a, dpl
//               mov     r2, a
//               pop     acc             ; retrieve carry
//               addc    a, b
//               mov     r3, a
//               mov     r1, 00H
//               pop     00H             ; retrieve result low byte
//
//cjne r3,#00h,dont_need_to_alert
//cjne r2,#00h,dont_need_to_alert
//cjne r1,#00h,dont_need_to_alert
//
//clr c
//mov a,r0
//subb a,#10  ;card change wait in seconds 
//jnc	dont_need_to_alert
//
//need_to_alert_account_free:
//setb need_to_alert
//jmp cgyew1
//dont_need_to_alert:
//clr  need_to_alert
//cgyew1:
//pop dph
//pop dpl
//pop b
//pop acc
//pop 07
//pop 06
//pop 05
//pop 04
//pop 03
//pop 02
//pop 01
//pop 00
//ret
//;====================================================================
//alert_account_free:
//lcall show_box
//ret
//;;;;
//count_down:
//;push STATUS_FLAGS
//mov state,#count_down_mode
//push START_COL
//push acc
//push 01
//push 02
//clr sign
//;lcall jick_buzz
//
//mov a,down_counter
//rr a						   ;			  ;
//rr a						   ;			  ;
//rr a						   ;	hour	  ;
//rr a 						   ;			  ;
//anl a,#15					   ;			  ;
//mov TEXTURE_LENGTH,#6   	   ;              ;         
//mov START_COL,#048h			   ;			  ;
//lcall show_digit_x			   ;			  ;
//mov a,down_counter		   ;			  ;
//anl a,#15					   ;			  ;
//mov TEXTURE_LENGTH,#6   	   ;              ;         
//mov START_COL,#040h		   		;			  ;
//lcall show_digit_x
//
//mov a,down_counter
//
//mov r1,#99
//sdfer1:
//clr c
//clr ac
//inc a
//da a
//djnz r1,sdfer1
//cjne a,#00h,drtw1
//mov down_counter,#010h
//lcall flash
//jmp vuyuy1
//drtw1:
//mov down_counter,a
//vuyuy1:
//pop 02
//pop 01
//pop acc
//pop START_COL
//;pop STATUS_FLAGS			  
//ret
//;--------------------------------------------------------------
//start_count_down:
//jb count_down_sw,q34 
//setb count_down_sw
//lcall clear_card_account
//lcall show_large_box
//lcall show_change_card
//mov down_counter,#010h
//q34:
//ret
//;--------------------------------------------------------------
//stop_count_down:
//ret
//;--------------------------------------------------------------
;--------------------------------
decrease_virtual_account:
push acc
  	clr c
	mov a,virt_account_lo
	subb a,paytol_lo
	mov virt_account_lo,a
	mov a,virt_account_hi
	subb a,#00h
	mov virt_account_hi,a
	clr c
pop acc
ret
;----------------------------------
check_black_list:
;black_white=1 --> white
;black_white=0 --> black

push dph
push dpl
push 01
	lcall set_card_bus
;   clr search_table_failed 
mov r1,#100
again_black: 
movx a,@dptr
cjne a,060h,its_not_black_0 //f1 	  f1 = 8 bit 
inc dptr
movx a,@dptr
cjne a,061h,its_not_black_1	//f2f3 	  f2 = 4 bit  ,  f3 = 4 bit
inc dptr
movx a,@dptr
cjne a,062h,its_not_black_2	//f4f5	  f4 = 3 bit  ,  f5 = 5 bit
inc dptr
movx a,@dptr
cjne a,063h,its_not_black_3	//f6f7	  f6 = 3 bit  ,  f7 = 5 bit
inc dptr
jmp u_check1
its_not_black_0:
inc dptr
its_not_black_1:
inc dptr
its_not_black_2:
inc dptr
its_not_black_3:
inc dptr
inc dptr
inc dptr
inc dptr
inc dptr
inc dptr
jmp its_not_black

u_check1:
movx a,@dptr
clr c
subb a,064h   
jc d_check1_a
jz u_check2
jmp its_not_black_a
d_check1_a:
inc dptr
inc dptr
inc dptr
jmp d_check1
its_not_black_a:
inc dptr
inc dptr
inc dptr
inc dptr
inc dptr
jmp its_not_black
//
u_check2:
inc dptr
movx a,@dptr
clr c
subb a,065h   
jc d_check1_b
jz u_check3
jmp its_not_black_b
d_check1_b:
inc dptr
inc dptr
jmp d_check1
its_not_black_b:
inc dptr
inc dptr
inc dptr
inc dptr
jmp its_not_black
//
u_check3:
inc dptr
movx a,@dptr
clr c
subb a,066h   
jc d_check1_c
jz its_black
jmp its_not_black_c
//
d_check1_c:
inc dptr
jmp d_check1
its_not_black_c:
inc dptr
inc dptr
inc dptr
jmp its_not_black

d_check1:
movx a,@dptr
clr c
subb a,064h   
jz d_check2
jnc its_black
inc dptr
inc dptr
jmp its_not_black

//
d_check2:
inc dptr
movx a,@dptr
clr c
subb a,065h   
jz d_check3
jnc its_black
inc dptr
jmp its_not_black
   
d_check3:
inc dptr
movx a,@dptr
clr c
subb a,066h   
jnc its_black

its_not_black:

inc dptr
djnz r1,again_black_mid
jmp all_checked_no_black 
again_black_mid:
jmp again_black
all_checked_no_black:

setb valid_card
jnb black_white,out_of_black_list_check
clr valid_card
jmp out_of_black_list_check
its_black:
clr valid_card
jnb black_white,out_of_black_list_check
setb valid_card
out_of_black_list_check:
pop 01
pop dpl
pop dph
ret
;;////////////
//;-------------------------------------
check_black_white_condition:
//;card_check_policy=1 --> white & black list check
//;card_check_policy=0 --> just black list check
jnb card_check_policy,just_check_black_list

setb black_white	;check white list
mov dptr,#white_list_ram_addr
lcall check_black_list	
jnb valid_card,its_not_valid_card
just_check_black_list:
clr black_white		;check black list
mov dptr,#black_list_ram_addr
lcall check_black_list	
its_not_valid_card:
ret
;---------------------------------------------
check_card_account_limit:
push acc
jnb valid_card,out_check_card_account_limit  // baraye inke karti ke dar marhale ghabli 
											// invalid shode dar in marhale 2bare valid nashavad

 mov a,063h
 anl a,#11100000b
chk_2000_tomani: 
cjne a,#10000000b,chk_5000_tomani
//2000 = 7d0 h
mov a,#07h
clr c
subb a,current_account_hi   
jnc out_check_card_account_limit

clr valid_card
jmp out_check_card_account_limit
chk_5000_tomani:
cjne a,#01000000b,chk_10000_tomani	
//5000 = 1388 h
mov a,#013h
clr c
subb a,current_account_hi   
jnc out_check_card_account_limit

jmp out_check_card_account_limit
chk_10000_tomani:
cjne a,#11000000b,out_check_card_account_limit	
//10000 = 2710 h
mov a,#027h
clr c
subb a,current_account_hi   
jnc out_check_card_account_limit

out_check_card_account_limit:
pop acc
ret