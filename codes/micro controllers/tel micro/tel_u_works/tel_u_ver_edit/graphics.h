;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;graphical themes;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------
clear_lcd:
    lcall set_lcd_bus
	mov LCD_COMMAND_BUF,#03eh
	lcall command_lcd
	mov LCD_COMMAND_BUF,#ROW_1
	
	mov TEXTURE_LENGTH,#8
  next_row:
	mov START_ROW,#64
	lcall command_lcd
  next_col:
    mov DISPLAY_BUF,#0
	setb LCD_CS1
	setb LCD_CS2
	lcall display_lcd
	djnz START_ROW,next_col
	inc LCD_COMMAND_BUF
	djnz TEXTURE_LENGTH,next_row
	
	mov LCD_COMMAND_BUF,#03fh
	lcall command_lcd
//	
	clr dial_num_sw
    lcall set_key_bus
ret
;-------------------------------
show_menu1:
mov dptr,#menu1_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu1_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu1_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu1_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu1_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu1_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu1_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu1_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu2:
mov dptr,#menu2_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu2_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu2_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu2_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu2_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu2_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu2_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu2_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu3:
mov dptr,#menu3_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu3_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu3_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu3_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu3_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu3_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu3_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu3_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu4:
mov dptr,#menu4_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu4_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu4_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu4_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu4_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu4_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu4_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu4_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu5:
mov dptr,#menu5_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu5_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu5_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu5_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu5_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu5_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu5_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu5_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu6:
mov dptr,#menu6_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu6_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu6_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu6_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu6_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu6_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu6_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu6_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu7:
mov dptr,#menu7_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu7_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu7_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu7_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu7_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu7_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu7_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu7_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
show_menu8:
mov dptr,#menu8_1_r
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu8_2_r
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu8_3_r
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu8_4_r
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern

mov dptr,#menu8_1_l
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu8_2_l
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu8_3_l
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern

mov dptr,#menu8_4_l
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

refresh_main_state_screen:
lcall clear_lcd
lcall retrive_dialed_nums
ret
;---------------------------------------------------
show_box:
setb sign
  push acc
  push 02
  mov b,STATUS_FLAGS
	
	mov dptr,#down_right                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#048h               ;lcd code  0
  	setb LCD_CS              
    lcall show_pattern 

	mov dptr,#down_left                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#112               ;lcd code  0
  	clr LCD_CS              
    lcall show_pattern 

	mov dptr,#up_right                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#048h               ;lcd code  0
  	setb LCD_CS              
    lcall show_pattern 

	mov dptr,#up_left                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#112               ;lcd code  0
  	clr LCD_CS              
    lcall show_pattern 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	 
	mov START_COL,#80
	mov START_ROW,#ROW_2
	mov r2,#06
	setb LCD_CS 
 line_sa1:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa1
   
	mov START_COL,#64
	mov START_ROW,#ROW_2
	mov r2,#06
	clr LCD_CS 
 line_sa2:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa2  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 	mov START_COL,#80
	mov START_ROW,#ROW_7
	mov r2,#06
	setb LCD_CS 
  line_sa3:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa3
   
	mov START_COL,#64
	mov START_ROW,#ROW_7
	mov r2,#06
	clr LCD_CS 
 line_sa4:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa4  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 mov r2,#4
 
   mov START_ROW,#ROW_3
 line_fa1:
  mov START_COL,#72
  mov TEXTURE_LENGTH,#08
  mov dptr,#right_line
  setb LCD_CS
  lcall show_pattern 
  
  mov START_COL,#112
  mov TEXTURE_LENGTH,#08
  mov dptr,#left_line
  clr LCD_CS
  lcall show_pattern 

  inc START_ROW

 djnz r2,line_fa1 

  mov STATUS_FLAGS,b 
  pop 02
  pop acc
clr sign
ret
;-------------------------------------
show_language_menu:
setb sign
	clr LCD_CS
	mov dptr,#lang_farsi;+8                                 ;clr line
    mov START_ROW,#ROW_3
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern
	
	mov dptr,#lang_english;+8                                 ;clr line
    mov START_ROW,#ROW_4
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern 
	
	mov dptr,#lang_arabic;+8                                 ;clr line
    mov START_ROW,#ROW_5
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern 
	
	mov dptr,#lang_deutsche;+8                                 ;clr line
    mov START_ROW,#ROW_6
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern
	clr sign  

ret
 ;-----------------------------------------
roll_indicator:	 
	setb sign
	setb LCD_CS 
	
	mov a,lang
	dec a
	add a,#ROW_3
	mov START_ROW,a

	mov dptr,#256                                 ;clr line
	mov TEXTURE_LENGTH,#8               ;tool
    mov START_COL,#100               ;lcd code  0										
    lcall show_pattern
   
   inc START_ROW
  	mov a,START_ROW
	cjne a,#ROW_7,go_up
   	mov START_ROW,#ROW_3
   
   go_up:
    mov dptr,#indicate                                 ;clr line
	;mov START_ROW,#ROW_6
	mov TEXTURE_LENGTH,#8               ;tool
    mov START_COL,#100               ;lcd code  0           
    lcall show_pattern
	clr sign
ret
;-------------------------------------
show_indicator:
    setb sign
	setb LCD_CS 
	
	mov a,lang
	dec a
	add a,#ROW_3
	mov START_ROW,a

	mov dptr,#indicate                                 ;clr line
	;mov START_ROW,#ROW_6
	mov TEXTURE_LENGTH,#8               ;tool
    mov START_COL,#100               ;lcd code  0           
    lcall show_pattern
	clr sign
ret
;------------------------------------	  
show_dial_num:
push acc
mov a,state
cjne a,#00h,vndf1
jmp vndf2
vndf1:
cjne a,#normal_phone,out_frg34

vndf2:
mov a,call_type
cjne a,#no_call,out_frg34
lcall clear_line_7
    setb dial_num_sw
    mov dptr,#dial_num_r          
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#dial_num_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b
	out_frg34: 
pop acc
ret
;---------------------------------------
show_fma_logo:
 mov dptr,# fma1_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma1_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern
    ;;  
    mov dptr,# fma2_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma2_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern 
    ;;  
    mov dptr,# fma3_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma3_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern
    ;;  
    mov dptr,# fma4_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma4_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern
    ;;  
    mov dptr,# fma5_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma5_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern 
    ;;  
    mov dptr,# fma6_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma6_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern
    ;;  
    mov dptr,# fma7_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma7_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern 
    ;;  
    mov dptr,# fma8_r            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    setb LCD_CS              
    lcall show_pattern 
    mov dptr,# fma8_l           
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    clr LCD_CS              
    lcall show_pattern 
ret
;-----------------------------------------------
show_atleast_balance_to_start:
push acc
push start_row
push START_COL

    mov dptr,#atleast            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS

    mov a,lang
	jb acc.0,right_to_left_ds1
left_to_right_ds1:
	clr LCD_CS
	    lcall show_pattern 
    mov STATUS_FLAGS,b
	 
mov a,paytol_lo
lcall dec_to_bcd
mov r1,a
rr a						   ;			  ;
rr a						   
rr a						   
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#120	

	mov START_ROW,#ROW_3               
    setb LCD_CS              

lcall show_digit_m			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#112		   ;			  ;
	mov START_ROW,#ROW_3               
    setb LCD_CS              
lcall show_digit_m			   ;;;;;;;;;;;;;;;;

mov dptr,# 1740                                   ;
    mov TEXTURE_LENGTH,#24               ;tool              ;
    mov START_ROW,#ROW_3               ;lcd code  4     ;
    mov START_COL,#80               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    setb LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

jmp out_vbgds15
right_to_left_ds1:
	setb LCD_CS
	    lcall show_pattern 
    mov STATUS_FLAGS,b
	 
mov a,paytol_lo
lcall dec_to_bcd
mov r1,a
rr a						   ;			  ;
rr a						   
rr a						   
rr a						   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#48h	

	mov START_ROW,#ROW_3               
    clr LCD_CS              

lcall show_digit_m			   ;			  ;
mov a,r1					   ;			  ;
anl a,#15					   ;			  ;
    mov TEXTURE_LENGTH,#6      ;              ;         
    mov START_COL,#40h		   ;			  ;
	mov START_ROW,#ROW_3               
    clr LCD_CS              
lcall show_digit_m			   ;;;;;;;;;;;;;;;;

mov dptr,# 1740                                   ;
    mov TEXTURE_LENGTH,#24               ;tool              ;
    mov START_ROW,#ROW_3               ;lcd code  4     ;
    mov START_COL,#050h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    clr LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;


out_vbgds15:
    

pop START_COL
pop start_row
pop acc

ret
;-----------------------------------------------
show_insert_card_pls:
push acc
push start_row
push START_COL
mov a,state
cjne a,#normal_phone,out_tyhhh
jmp llj1
out_tyhhh:
mov a,state
cjne a,#00h,out_tyh5


llj1:
;lcall clear_line_6
;lcall clear_line_4
    mov dptr,# 1640            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,# 1690            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 

out_tyh5:
pop START_COL
pop start_row
pop acc
ret
;-------------------------------------------
show_please_wait:
push acc
mov a,state
cjne a,#normal_phone,out_tyh7
mov dptr,#1820                                 ;lotfan sabr konid
    mov TEXTURE_LENGTH,#48               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#050h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#1770            
    mov TEXTURE_LENGTH,#48               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b
out_tyh7:
	 
pop acc
ret
;-------------------------------------------
show_dont_forget_ur_card:
lcall exit_to_main_state
mov dptr,# 1870            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,# 1940            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;;
    mov dptr,# 2010            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,# 2080            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
ret
;-----------------------------------------------
show_handset_damaged:
lcall exit_to_main_state
mov dptr,#handset1_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#handset1_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;;
    mov dptr,#handset2_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#handset2_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 

ret
;-----------------------------------------------
show_door_open:
lcall exit_to_main_state
mov dptr,#door1_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#door1_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;;
    mov dptr,#door2_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#door2_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
ret

;-----------------------------------------------
show_out_of_order:
lcall exit_to_main_state
mov dptr,#outorder1_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#outorder1_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;;
    mov dptr,#outorder2_r            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#outorder2_l            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
ret

;-----------------------------------------------
show_card_invalid:
push acc
mov a,state
cjne a,#normal_phone,out_gbj8
	lcall clear_line_6
    lcall clear_line_4
    
	mov dptr,#invalid_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#invalid_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
out_gbj8:
pop acc
ret
;---------------------------------------------------
show_no_balance:
push acc
mov a,state
cjne a,#normal_phone,out_gbju
	lcall clear_line_6
    lcall clear_line_4
    
	mov dptr,#no_balance_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#no_balance_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
out_gbju:
pop acc

ret
;-----------------------------------------------
show_redial:
   push acc
    mov a,lang
	jb acc.0,right_to_left_1
left_to_right_1:
	clr LCD_CS
jmp out_vbg15
right_to_left_1:
	setb LCD_CS
	
	out_vbg15:
	mov dptr,#2150            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    lcall show_pattern        
    mov STATUS_FLAGS,b
  pop acc
ret
;----------------------------------------------------
clear_line_1:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
clear_line_2:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_2               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
clear_line_3:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
	mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
clear_line_4:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
clear_line_5:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
clear_line_6:
    clr dial_num_sw
	mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b
ret
;----------------------------------------------------
clear_line_7:
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b
	
	clr dial_num_sw    
ret
;----------------------------------------------------
clear_line_8:
clr show_time_sw
mov dptr,#256                                  ;clr line
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#256            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    
ret
;----------------------------------------------------
retrive_dialed_nums:
	;;;;;;;;;;;;;;;;;;;;;;;;;

cjne DIALLED_COUNTER,#00,valid_display
jmp no_digit_to_display
valid_display:
jnb  FIRST_KEY,no_digit_to_display
   lcall clear_line_6
   lcall clear_line_7
   mov START_ROW,#ROW_7 ;satre 5om
  mov START_COL,#128 
  clr LCD_CS  ; left
  mov r1,#00h
 
 next_digit_23:
    inc r1
    mov a,#02fh
    add a,r1
    mov r0,a
    mov a,@r0
;
;
;
cjne a,#16,zx1
mov dptr,#num0
zx1:    
cjne a,#17,zx2
mov dptr,#num1
zx2:
cjne a,#18,zx3
mov dptr,#num2
zx3:
cjne a,#19,zx4
mov dptr,#num3
zx4:
cjne a,#20,zx5
mov dptr,#num4
zx5:
cjne a,#21,zx6
mov dptr,#num5
zx6:
cjne a,#22,zx7
mov dptr,#num6
zx7:
cjne a,#23,zx8
mov dptr,#num7
zx8:
cjne a,#24,zx9
mov dptr,#num8
zx9:
cjne a,#25,zxout
mov dptr,#num9
zxout:

	mov a,START_COL
	clr c
	subb a,#8
	mov START_COL,a
	cjne a,#56,same_pos_23
	cpl LCD_CS ;right
	mov START_COL,#120
  same_pos_23:
   mov TEXTURE_LENGTH,#6
  lcall show_pattern

    mov a,r1
    cjne a,06h,next_digit_23   ;r1  o  r6
;jmp out_yr3	;;;;;;;;;;;;;;;;;;;;;;
no_digit_to_display:

mov a,call_type
cjne a,#free_call,trgd1
lcall show_free_call
jmp	str30
trgd1:
setb  card_status
lcall cal_account
lcall long_delay
jnb show_time_sw,out_yr32
lcall show_time
out_yr32:

jb card_status,out_yr3
;jnb dial_num_sw,out_yr3
mov a,call_type
cjne a,#no_call,out_yr3
lcall show_dial_num

out_yr3:

mov a,call_timer_minute
cjne a,#00h,drt32
jmp str30
drt32:
lcall show_call_time
str30:

ret
;----------------------------------------------------
retrive_dialed_nums2:
	;;;;;;;;;;;;;;;;;;;;;;;;;


;cjne DIALLED_COUNTER,#00,evalid_display
;jmp eno_digit_to_display
;evalid_display:
;jnb  FIRST_KEY,eno_digit_to_display
   lcall clear_line_6
   lcall clear_line_7
   mov START_ROW,#ROW_7 ;satre 5om
  mov START_COL,#128 
  clr LCD_CS  ; left
  mov r1,#00h
 
 enext_digit_23:
    inc r1
    mov a,#02fh
    add a,r1
    mov r0,a
    mov a,@r0
;
;
;
cjne a,#16,ezx1
mov dptr,#num0
ezx1:    
cjne a,#17,ezx2
mov dptr,#num1
ezx2:
cjne a,#18,ezx3
mov dptr,#num2
ezx3:
cjne a,#19,ezx4
mov dptr,#num3
ezx4:
cjne a,#20,ezx5
mov dptr,#num4
ezx5:
cjne a,#21,ezx6
mov dptr,#num5
ezx6:
cjne a,#22,ezx7
mov dptr,#num6
ezx7:
cjne a,#23,ezx8
mov dptr,#num7
ezx8:
cjne a,#24,ezx9
mov dptr,#num8
ezx9:
cjne a,#25,ezxout
mov dptr,#num9
ezxout:

	mov a,START_COL
	clr c
	subb a,#8
	mov START_COL,a
	cjne a,#56,esame_pos_23
	cpl LCD_CS ;right
	mov START_COL,#120
  esame_pos_23:
   mov TEXTURE_LENGTH,#6
  lcall show_pattern

    mov a,r1
    cjne a,06h,enext_digit_23   ;r1  o  r6
;jmp out_yr3	;;;;;;;;;;;;;;;;;;;;;;
eno_digit_to_display:
mov a,call_type
cjne a,#free_call,etrgd1
lcall show_free_call
jmp	estr30
etrgd1:
clr card_status
lcall cal_account

jnb dial_num_sw,eout_yr3
mov a,call_type
cjne a,#no_call,eout_yr3

lcall show_dial_num
lcall long_delay
lcall long_delay
lcall long_delay

eout_yr3:
 	jnb show_time_sw,eout_yr32
lcall show_time
eout_yr32:

mov a,call_timer_minute
cjne a,#00h,edrt32
jmp estr30
edrt32:
lcall show_call_time
estr30:
ret
;----------------------------------------------------
load_time:
mov addr_hi,#00				   ; ;;;;;;;;;;;;;
mov addr_lo,#hour_addr_lo	   ;			  ;
lcall read_e2p_byte			   ;			  ;
mov r1,a
lcall save_hour				   ;			  ;

mov addr_hi,#00				   
mov addr_lo,#minute_addr_lo 			   
lcall read_e2p_byte			   
mov r1,a
lcall save_minute				   

ret
;----------------------------------------------------
show_time:
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

 
pop 01
pop acc
pop START_COL
ret
;----------------------------------------------------

show_digit:
cjne a,#0,tzx1
mov dptr,#num0
tzx1:    
cjne a,#1,tzx2
mov dptr,#num1
tzx2:
cjne a,#2,tzx3
mov dptr,#num2
tzx3:
cjne a,#3,tzx4
mov dptr,#num3
tzx4:
cjne a,#4,tzx5
mov dptr,#num4
tzx5:
cjne a,#5,tzx6
mov dptr,#num5
tzx6:
cjne a,#6,tzx7
mov dptr,#num6
tzx7:
cjne a,#7,tzx8
mov dptr,#num7
tzx8:
cjne a,#8,tzx9
mov dptr,#num8
tzx9:
cjne a,#9,tzxout
mov dptr,#num9
tzxout:

 
;	mov START_ROW,#ROW_8               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    

ret
;----------------------------------------------------
show_digit_x:
mov dptr,#num9

cjne a,#0,xtzx1
mov dptr,#num0
xtzx1:    
cjne a,#1,xtzx2
mov dptr,#num1
xtzx2:
cjne a,#2,xtzx3
mov dptr,#num2
xtzx3:
cjne a,#3,xtzx4
mov dptr,#num3
xtzx4:
cjne a,#4,xtzx5
mov dptr,#num4
xtzx5:
cjne a,#5,xtzx6
mov dptr,#num5
xtzx6:
cjne a,#6,xtzx7
mov dptr,#num6
xtzx7:
cjne a,#7,xtzx8
mov dptr,#num7
xtzx8:
cjne a,#8,xtzx9
mov dptr,#num8
xtzx9:
cjne a,#9,xtzxout
mov dptr,#num9
xtzxout:


 	clr sign
	mov START_ROW,#ROW_2               ;lcd code  0
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b    

ret
;------------------------------------------------------------------
show_digit_m:
mov dptr,#num9

cjne a,#0,mxtzx1
mov dptr,#num0
mxtzx1:    
cjne a,#1,mxtzx2
mov dptr,#num1
mxtzx2:
cjne a,#2,mxtzx3
mov dptr,#num2
mxtzx3:
cjne a,#3,mxtzx4
mov dptr,#num3
mxtzx4:
cjne a,#4,mxtzx5
mov dptr,#num4
mxtzx5:
cjne a,#5,mxtzx6
mov dptr,#num5
mxtzx6:
cjne a,#6,mxtzx7
mov dptr,#num6
mxtzx7:
cjne a,#7,mxtzx8
mov dptr,#num7
mxtzx8:
cjne a,#8,mxtzx9
mov dptr,#num8
mxtzx9:
cjne a,#9,mxtzxout
mov dptr,#num9
mxtzxout:

    mov b,STATUS_FLAGS
    lcall show_pattern 
    mov STATUS_FLAGS,b    

ret
;;;
;-----------------------------------------------------------------
show_large_box:
 setb sign
  push acc
  push 02
  mov b,STATUS_FLAGS
	lcall clear_lcd
	
	mov dptr,#down_right                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
  	setb LCD_CS              
    lcall show_pattern 

	mov dptr,#down_left                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_1               ;lcd code  4
    mov START_COL,#120               ;lcd code  0
  	clr LCD_CS              
    lcall show_pattern 

	mov dptr,#up_right                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
  	setb LCD_CS              
    lcall show_pattern 

	mov dptr,#up_left                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_8               ;lcd code  4
    mov START_COL,#120               ;lcd code  0
  	clr LCD_CS              
    lcall show_pattern 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	 
	mov START_COL,#048h
	mov START_ROW,#ROW_1
	mov r2,#07
	setb LCD_CS 
 xline_sa1:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,xline_sa1
   
	mov START_COL,#64
	mov START_ROW,#ROW_1
	mov r2,#07
	clr LCD_CS 
 xline_sa2:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,xline_sa2  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 	mov START_COL,#048h
	mov START_ROW,#ROW_8
	mov r2,#07
	setb LCD_CS 
  xline_sa3:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,xline_sa3
   
	mov START_COL,#64
	mov START_ROW,#ROW_8
	mov r2,#07
	clr LCD_CS 
 xline_sa4:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,xline_sa4  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 mov r2,#6
 
   mov START_ROW,#ROW_2
 xline_fa1:
  mov START_COL,#040h
  mov TEXTURE_LENGTH,#08
  mov dptr,#right_line
  setb LCD_CS
  lcall show_pattern 
  
  mov START_COL,#120
  mov TEXTURE_LENGTH,#08
  mov dptr,#left_line
  clr LCD_CS
  lcall show_pattern 

  inc START_ROW

 djnz r2,xline_fa1 

  mov STATUS_FLAGS,b 
  pop 02
  pop acc
clr sign

ret
;-----------------------------------------------------------------
show_change_card:
lcall exit_to_main_state
mov dptr,#change1_r            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#048h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#change1_l            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;;
    mov dptr,#change2_r            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#048h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
mov dptr,#change2_l            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_6               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
	;;;;;;;
	    mov dptr,#change3_r            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#048h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
	mov dptr,#change3_l            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
	;;;;;;;
	mov dptr,#change4_r            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#048h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
	mov dptr,#change4_l            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_4               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
ret
;--------------------------------------------------------------
;-----------------------------------------------
show_free_call:
push START_COL
lcall clear_line_5
mov dptr,#2500            
    mov TEXTURE_LENGTH,#64               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
pop START_COL
ret
;-----------------------------------------------
;-----------------------------------------------
show_incomming_call:
    mov dptr,#incom_r          
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#incom_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b

ret
;-----------------------------------------------
show_progress_bar:
setb sign
  push acc
  push 02
  mov b,STATUS_FLAGS
	
	mov dptr,#right_line                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#048h               ;lcd code  0
  	setb LCD_CS              
    lcall show_pattern 

	mov dptr,#left_line                                 ;clr line
    mov TEXTURE_LENGTH,#8               ;tool
    mov START_ROW,#ROW_3               ;lcd code  4
    mov START_COL,#112               ;lcd code  0
  	clr LCD_CS              
    lcall show_pattern 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 	 
	mov START_COL,#72  ;80
	mov START_ROW,#ROW_2
	mov r2,#07
	setb LCD_CS 
 line_sa1j:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa1j
   
	mov START_COL,#64
	mov START_ROW,#ROW_2
	mov r2,#07
	clr LCD_CS 
 line_sa2j:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#upperline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa2j  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 	mov START_COL,#72 ;80
	mov START_ROW,#ROW_4
	mov r2,#07
	setb LCD_CS 
  line_sa3j:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa3j
   
	mov START_COL,#64
	mov START_ROW,#ROW_4
	mov r2,#07
	clr LCD_CS 
 line_sa4j:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#underline
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;lcall mid_delay
	djnz r2,line_sa4j  

  mov STATUS_FLAGS,b 
  pop 02
  pop acc
clr sign
ret
;-----------------------------
show_bar:
	mov START_COL,#80
	mov START_ROW,#ROW_3
	mov r2,#06
	setb LCD_CS 
 line_sa1jk:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	djnz r2,line_sa1jk
   
	mov START_COL,#64
	mov START_ROW,#ROW_3
	mov r2,#06
	clr LCD_CS 
 line_sa2jk:  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	lcall long_delay
	djnz r2,line_sa2jk 
ret
;;;
show_maintenance1_menu:
setb sign
	clr LCD_CS
	mov dptr,#lang_farsi;+8                                 ;clr line
    mov START_ROW,#ROW_3
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern
	
	mov dptr,#lang_english;+8                                 ;clr line
    mov START_ROW,#ROW_4
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern 
	
	mov dptr,#lang_arabic;+8                                 ;clr line
    mov START_ROW,#ROW_5
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern 
	
	mov dptr,#lang_deutsche;+8                                 ;clr line
    mov START_ROW,#ROW_6
	mov TEXTURE_LENGTH,#56               ;tool
    mov START_COL,#64               ;lcd code  0           
    lcall show_pattern
	clr sign  

ret
;---------------------------------------------------
show_enter_password:
    
	mov dptr,#enter_pass_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#enter_pass_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 

ret
;---------------------------------------------------
show_wrong_password:
    
	mov dptr,#wrong_pass_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#wrong_pass_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 

ret
;-----------------------------------------------
;---------------------------------------------------
show_running:
    
	mov dptr,#running_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#running_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 

ret
;---------------------------------------------------
show_success_done:
    
	mov dptr,#success_r             
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#058h               ;lcd code  24
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    mov dptr,#success_l            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_5               ;lcd code  4
    mov START_COL,#040h               ;lcd code  24
    mov b,STATUS_FLAGS
    clr LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
ret
;-----------------------------------
show_manual_time_labels:
mov dptr,#current_time                                   ;
    mov TEXTURE_LENGTH,#48               ;tool              ;
    mov START_ROW,#ROW_8               ;lcd code  4     ;
    mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    setb LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

mov dptr,#new_time                                   ;
    mov TEXTURE_LENGTH,#48               ;tool              ;
    mov START_ROW,#ROW_6               ;lcd code  4     ;
    mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    setb LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

ret

show_manual_alarm_labels:
mov dptr,#current_alarm                                   ;
    mov TEXTURE_LENGTH,#48               ;tool              ;
    mov START_ROW,#ROW_8               ;lcd code  4     ;
    mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    setb LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

mov dptr,#new_alarm                                   ;
    mov TEXTURE_LENGTH,#48               ;tool              ;
    mov START_ROW,#ROW_6               ;lcd code  4     ;
    mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
    setb LCD_CS                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

ret
;------------------------------------
show_char:
push acc
setb sign
;; a : character code
;;;;;;;;
mov dptr,#l1a
mov b,#20
mul ab 
clr c
add a,dpl
mov dpl,a
mov a,b
addc a,dph
mov dph,a
;;;;;;;;;;
                               ;
    mov TEXTURE_LENGTH,#10               ;tool              ;
    mov START_ROW,#ROW_3               ;lcd code  4     ;
  ;  mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
                                  ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b                                    ;                                            ;

	mov TEXTURE_LENGTH,#10               ;tool              ;
    mov START_ROW,#ROW_2               ;lcd code  4     ;
   ; mov START_COL,#040h               ;lcd code  24    ;
    mov b,STATUS_FLAGS                                    ;
                                      ;
    lcall show_pattern                            ;
    mov STATUS_FLAGS,b
	clr sign                                    ;                                            ;
pop acc
ret
;------------------------------------------------------
next_char:
push acc 
mov a,START_COL
add a,#10
jnb LCD_CS,chk_left 
chk_right:
cjne a,#128,right_w
mov a,#64
jmp left_w
chk_left:
cjne a,#124,left_w
;lcall clear_line_2
;lcall clear_line_3
mov a,#68
jmp right_w
right_w:
mov START_COL,a
setb LCD_CS
jmp out_next_char 
left_w:
mov START_COL,a
clr LCD_CS
out_next_char:
pop acc
ret
;-------------------------------------------------------
show_text_message:
push acc
push 02
push msg_addr_lo
push msg_addr_hi

mov r2,#00h
mov START_COL,#68
setb LCD_CS
show_text_i2:
lcall read_char
cjne a,#0ffh,show_text_i3
mov a,#115 ;115= " "code
lcall show_char
lcall next_char
jmp show_text_i4
show_text_i3:
lcall show_char
lcall next_char
lcall inc_msg_addr
inc r2
cjne r2,#12,show_text_i2
show_text_i4:
pop msg_addr_hi
pop msg_addr_lo 
pop 02
pop acc
ret
;----------------------------------------------
show_scrolling_message:
hjbrt21:
mov t0_c2,#2
lcall show_text_message
lcall inc_msg_addr
mov a,msg_addr_hi
cjne a,#038h,hjbrt22
mov a,msg_addr_lo
cjne a,#02eh,hjbrt22

mov msg_addr_hi,#message_addr_hi
mov msg_addr_lo,#message_addr_lo
lcall clear_line_2
lcall clear_line_3
hjbrt22:
ret
;------------------------------------------------
start_scrolling_message:
mov msg_addr_hi,#message_addr_hi
mov msg_addr_lo,#message_addr_lo
mov state,#normal_phone

push acc
mov t0_c1,#5
mov t0_c2,#2
mov TH0,#00h
mov TL0,#00h
 mov a,TMOD
 orl a,#00000001B
 mov TMOD,a
setb ie.1
setb ie.7
setb TR0
setb ip.1
pop acc
 ret
 ;------------------------------------------------
end_scrolling_message:
	clr  TR0
	clr ie.1
    clr ip.1
ret
 ;------------------------------------------------
 ;------------------------------------------------
 schedule_message_scroll_time:
 	push 01
	push 02
	push psw
	                 mov TH0,#00
                     mov TL0,#00
					 
					 ;setb TR1
					 mov r1,t0_c1
					 djnz r1,msg_scr_out_timer1_2_fff
					 mov r1,#5	
					 mov r2,t0_c2
					 djnz r2,msg_scr_out_timer1_1_fff

					lcall show_scrolling_message
					
					jmp msg_scr_uytr1_fff
					msg_scr_out_timer1_1_fff:
					mov t0_c2,r2
					msg_scr_out_timer1_2_fff:
					mov t0_c1,r1

msg_scr_uytr1_fff:
	pop psw
	pop 02
	pop 01		
 ret
;------------------------------------------------
inc_msg_addr:
push dpl
push dph
mov dpl,msg_addr_lo
mov dph,msg_addr_hi
 inc dptr
 mov msg_addr_lo,dpl
 mov msg_addr_hi,dph
pop dph
pop dpl
ret
;------------------------------------------
show_message:
mov dptr,#00h
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern_x

mov dptr,#64
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern_x

mov dptr,#128
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern_x

mov dptr,#192
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
setb LCD_CS 
lcall show_pattern_x

mov dptr,#256
mov START_COL,#64
mov START_ROW,#ROW_1
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern_x

mov dptr,#320
mov START_COL,#64
mov START_ROW,#ROW_2
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern_x

mov dptr,#384
mov START_COL,#64
mov START_ROW,#ROW_3
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern_x

mov dptr,#448
mov START_COL,#64
mov START_ROW,#ROW_4
mov TEXTURE_LENGTH,#64
clr LCD_CS 
lcall show_pattern_x

ret
;----------------------------------------------------
show_pattern_x:
    lcall set_lcd_bus
    mov r0,START_ROW
    mov LCD_COMMAND_BUF,r0
    lcall command_lcd
    mov r0,START_COL
    mov LCD_COMMAND_BUF,r0 
    lcall command_lcd
    jb LCD_CS,right_x
   left_x:
    setb LCD_CS2
    clr LCD_CS1
    jmp over_right_x
   right_x:
    setb LCD_CS1
    clr LCD_CS2
    over_right_x:
  next_byte_x:
 movx a,@dptr
  mov DISPLAY_BUF,a
  lcall display_lcd
  inc dptr
  djnz TEXTURE_LENGTH,next_byte_x
      lcall set_key_bus    
ret
;----------------------------------------------------
clear_message:
lcall clear_line_1
lcall clear_line_2
lcall clear_line_3
lcall clear_line_4
ret
;----------------------------------------------------
;----------------------------------------
tmr_00:
lcall schedule_message_scroll_time
ret
;-------------------------------------
