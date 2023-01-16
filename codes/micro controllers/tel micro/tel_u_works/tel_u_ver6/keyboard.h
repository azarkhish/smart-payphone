;--------------------------------------
check_key_row1:
test_key_1:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col1,refresh_key1
lcall key_1
jmp test_key_2
refresh_key1:
clr key1_pressed
;;;
test_key_2:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col2,refresh_key2
lcall key_2
jmp test_key_3
refresh_key2:
clr key2_pressed
;;;
test_key_3:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
;;;
jb col3,refresh_key3
lcall key_3
jmp test_key_vol
refresh_key3:
clr key3_pressed
;;;
test_key_vol:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col4,test_key_lang
lcall key_vol
test_key_lang:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col5,test_key_rtc
lcall key_lang
test_key_rtc:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
setb row2
setb row3
setb row4
jb col6,out_check_key_row1
lcall q_key_rtc
out_check_key_row1:
ret
;---------------------------------------
check_key_row2:
test_key_4:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col1,refresh_key4
lcall key_4
jmp test_key_5
refresh_key4:
clr key4_pressed
;;;
test_key_5:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col2,refresh_key5
lcall key_5
jmp test_key_6
refresh_key5:
clr key5_pressed
;;;
test_key_6:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
;;;
jb col3,refresh_key6
lcall key_6
jmp test_key_redial
refresh_key6:
clr key6_pressed
;;;
test_key_redial:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col4,test_key_police
lcall key_redial

test_key_police:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col5,test_key_door
lcall key_police
test_key_door:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
clr row2
setb row3
setb row4
jb col6,out_check_key_row2
lcall q_key_door

out_check_key_row2:
ret
;---------------------------------------
check_key_row3:
test_key_7:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col1,refresh_key7
lcall key_7
jmp test_key_8
refresh_key7:
clr key7_pressed
;;;
test_key_8:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col2,refresh_key8
lcall key_8
jmp test_key_9
refresh_key8:
clr key8_pressed
;;;
test_key_9:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
;;;
jb col3,refresh_key9
lcall key_9
jmp test_key_flash
refresh_key9:
clr key9_pressed
;;;
test_key_flash:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col4,test_key_fire
lcall key_flash

test_key_fire:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col5,test_key_hook
lcall key_fire

test_key_hook:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
clr row3
setb row4
jb col6,out_check_key_row3
lcall key_hook
out_check_key_row3:
ret
;---------------------------------------
check_key_row4:
test_key_star:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col1,test_key_0
lcall key_star
test_key_0:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
;;;
jb col2,refresh_key0
lcall key_0
jmp test_key_sharp
refresh_key0:
clr key0_pressed
;;;
test_key_sharp:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col3,test_key_help
lcall key_sharp
test_key_help:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col4,test_key_emergency 
lcall key_help

test_key_emergency:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col5,test_key_ring 
lcall key_urgent

test_key_ring:
setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
setb row1
setb row2
setb row3
clr row4
jb col6,out_check_key_row4 
lcall q_key_ring

out_check_key_row4:
ret
;---------------------------------------
scan_keyboard:
jb card_detect,no_card_detected
   lcall card_insertion
   jmp card_in
no_card_detected:
	lcall no_card
card_in:
       
test_row1:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row1,clear_key_status_row1
lcall check_key_row1
jmp test_row2 
clear_key_status_row1:
clr key1_pressed
clr key2_pressed
clr key3_pressed
;--------
test_row2:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row2,clear_key_status_row2
lcall check_key_row2
jmp test_row3 
clear_key_status_row2:
clr key4_pressed
clr key5_pressed
clr key6_pressed
;--------
test_row3:
setb row1
setb row2
setb row3
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row3,clear_key_status_row3
lcall check_key_row3
jmp test_row4 
clear_key_status_row3:
clr key7_pressed
clr key8_pressed
clr key9_pressed
;--------
test_row4:
setb row1
setb row2
setb row3 
setb row4
clr col1
clr col2
clr col3
clr col4
clr col5
clr col6
;-------
jb row4,clear_key_status_row4
lcall check_key_row4
jmp scan_keyboard 
clear_key_status_row4:
clr key0_pressed
;--------
jmp scan_keyboard
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;  
key_0:
clr ie.1
  mov a,state
// cjne a,#count_down_mode,yu0
// jmp out_of_key_0
// yu0:
;------
cjne a,#maintanence_card_ok,ys0

	lcall next_number
	mov DIAL_BUF,#0
    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_0 
ys0:
;------
    jnb ACCESS1,normal_key0
   maintenance_key0:
       jmp out_of_key_0
   normal_key0:
    jnb ACCESS0,normal_key0_0
 
   normal_key0_1:
   	jb FIRST_KEY,ur1
;	cjne DIALLED_COUNTER,#00,ur1
  	
	jb first_zerro,gnv0
	jmp ur2
  ur1:
   	cjne DIALLED_COUNTER,#01,ur2
  	mov a,30h
	cjne a,#16,ur2
	jb second_zerro,gnv0
  ur2:
    ;;;;;;;;;;;;;;;;;
	mov a,state
	cjne a,#normal_phone,sst0
	jb key0_pressed,gnv0
	mov DIAL_BUF,#16
    lcall dial
    
	lcall next_number
    lcall add_memory
    
    mov dptr,#520          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv0
sst0:	
	lcall return_to_main_state
jmp out_of_key_0
gnv0:
setb key0_pressed	 
jmp out_of_key_0

normal_key0_0:
jb key0_pressed,wsfd20
mov DIAL_BUF,#16 

mov call_type,#start_free_call
lcall next_number

;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#520          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd10
lcall dial_all_in_memory
jmp out_of_key_0
wsfd10:
cjne a,#00,wsfd20
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd20:
setb key0_pressed	 
out_of_key_0:
ret 
;-------------------------------                       
key_1:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu1
// jmp out_of_key_1
// yu1:
;------
cjne a,#maintanence_card_ok,ys1

	lcall next_number
	mov DIAL_BUF,#1

 lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_1 
ys1:
;------

jnb ACCESS1,normal_key1
   maintenance_key1:

   jmp out_of_key_1
   normal_key1:
    jnb ACCESS0,normal_key1_0
   normal_key1_1:
   	mov a,state
	cjne a,#normal_phone,sst1
	jb key1_pressed,gnv1
	
	mov DIAL_BUF,#17
    lcall dial
    
	lcall next_number
    lcall add_memory
    
    mov dptr,#430          ;adrese 1
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv1
sst1:
    lcall return_to_main_state
 jmp out_of_key_1
gnv1:
 setb key1_pressed
 jmp out_of_key_1
   normal_key1_0:
   jb key1_pressed,wsfd21
mov DIAL_BUF,#17 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#430          ;adrese 1
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd11
lcall dial_all_in_memory
jmp out_of_key_1
wsfd11:
cjne a,#00,wsfd21
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd21:
setb key1_pressed	 
out_of_key_1:
ret                       
;-------------------------------
key_2:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu2
// jmp out_of_key_2
// yu2:
 ;------
cjne a,#maintanence_card_ok,ys2

	lcall next_number
	mov DIAL_BUF,#2

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_2 
ys2:
;------
		 
jnb ACCESS1,normal_key2
   maintenance_key2:
        jmp out_of_key_2
   normal_key2:
    jnb ACCESS0,normal_key2_0
   normal_key2_1:
    mov a,state
	cjne a,#normal_phone,sst2
	jb key2_pressed,gnv2
	mov DIAL_BUF,#18
    lcall dial
    
	lcall next_number
    lcall add_memory
    
    mov dptr,#440          ;adrese 2
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv2
sst2:
    lcall return_to_main_state

	jmp out_of_key_2
gnv2:
setb key2_pressed
jmp out_of_key_2
normal_key2_0:                    
jb key2_pressed,wsfd22
mov DIAL_BUF,#18 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
  mov dptr,#440          ;adrese 2
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd12
lcall dial_all_in_memory
jmp out_of_key_2
wsfd12:
cjne a,#00,wsfd22
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd22:
setb key2_pressed	 
out_of_key_2:
ret                        
;-------------------------------
key_3:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu3
// jmp out_of_key_3
// yu3:
;------
cjne a,#maintanence_card_ok,ys3

	lcall next_number
	mov DIAL_BUF,#3

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_3 
ys3:
;------
jnb ACCESS1,normal_key3
   maintenance_key3:
        jmp out_of_key_3
   normal_key3:
    jnb ACCESS0,normal_key3_0
   normal_key3_1:
    mov a,state
	cjne a,#normal_phone,sst3
	jb key3_pressed,gnv3
	mov DIAL_BUF,#19
    lcall dial
;mov call_type,#start_free_call
	lcall next_number
    lcall add_memory
    
    mov dptr,#450          ;adrese 3
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv3
sst3:
    lcall return_to_main_state
	
jmp out_of_key_3
 
gnv3:
setb key3_pressed 
jmp out_of_key_3

normal_key3_0:
jb key3_pressed,wsfd23        
mov DIAL_BUF,#19 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER

lcall add_memory
    mov dptr,#450          ;adrese 3
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd13
lcall dial_all_in_memory
jmp out_of_key_3
wsfd13:
cjne a,#00,wsfd23
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd23:
setb key3_pressed	 
out_of_key_3:
ret                     
;-------------------------------
key_4:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu4
// jmp out_of_key_4
// yu4:
 ;------
cjne a,#maintanence_card_ok,ys4

	lcall next_number
	mov DIAL_BUF,#4

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_4 
ys4:
;------

jnb ACCESS1,normal_key4
   maintenance_key4:
        jmp out_of_key_4
   normal_key4:
    jnb ACCESS0,normal_key4_0
   normal_key4_1:
    mov a,state
	cjne a,#normal_phone,sst4
	jb key4_pressed,gnv4
	mov DIAL_BUF,#20
    lcall dial
    
	lcall next_number
    lcall add_memory
    
    mov dptr,#460          ;adrese 4
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
   ; lcall mid_delay
	jmp gnv4
sst4:
    lcall return_to_main_state
	
jmp out_of_key_4
gnv4:
setb key4_pressed
jmp out_of_key_4
normal_key4_0:                   
jb key4_pressed,wsfd24
mov DIAL_BUF,#20 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER

lcall add_memory
    mov dptr,#460          ;adrese 4
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd14
lcall dial_all_in_memory
jmp out_of_key_4
wsfd14:
cjne a,#00,wsfd24
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd24:
setb key4_pressed	 
out_of_key_4:
ret                      
;-------------------------------
key_5:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu5
// jmp out_of_key_5
// yu5:
;------
cjne a,#maintanence_card_ok,ys5

	lcall next_number
	mov DIAL_BUF,#5

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_5 
ys5:
;------

jnb ACCESS1,normal_key5
   maintenance_key5:
        jmp out_of_key_5
   normal_key5:
    jnb ACCESS0,normal_key5_0
   normal_key5_1:
   mov a,state
	cjne a,#normal_phone,sst5
    jb key5_pressed,gnv5
	mov DIAL_BUF,#21
	lcall dial
	
    lcall next_number
    lcall add_memory
    
    mov dptr,#470          ;adrese 5
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv5
sst5:
    lcall return_to_main_state
	
jmp out_of_key_5
 				  
 gnv5:
setb key5_pressed
jmp out_of_key_5

normal_key5_0:                   
jb key5_pressed,wsfd25
mov DIAL_BUF,#21 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#470          ;adrese 5
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd15
lcall dial_all_in_memory
jmp out_of_key_5
wsfd15:
cjne a,#00,wsfd25
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd25:
setb key5_pressed	 
out_of_key_5:
ret                      
;-------------------------------
key_6:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu6
// jmp out_of_key_6
// yu6:
;------
cjne a,#maintanence_card_ok,ys6

	lcall next_number
	mov DIAL_BUF,#6

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_6 
ys6:
;------

jnb ACCESS1,normal_key6
   maintenance_key6:
       jmp out_of_key_6
   normal_key6:
    jnb ACCESS0,normal_key6_0
   normal_key6_1:
   mov a,state
	cjne a,#normal_phone,sst6
    jb key6_pressed,gnv6
	mov DIAL_BUF,#22
	lcall dial
	
    lcall next_number
    lcall add_memory
    
    mov dptr,#480          ;adrese 6
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv6
sst6:
    lcall return_to_main_state
	
	jmp out_of_key_6
gnv6:
setb key6_pressed
jmp out_of_key_6
 
normal_key6_0:                   
jb key6_pressed,wsfd26
mov DIAL_BUF,#22 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#480          ;adrese 6
    mov TEXTURE_LENGTH,#6
    lcall show_pattern

lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd16
lcall dial_all_in_memory
jmp out_of_key_6
wsfd16:
cjne a,#00,wsfd26
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd26:
setb key6_pressed	 
out_of_key_6:
ret                       
;-------------------------------
key_7:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu7
// jmp out_of_key_7
// yu7:
;------
cjne a,#maintanence_card_ok,ys7

	lcall next_number
	mov DIAL_BUF,#7

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_7 
ys7:
;------

jnb ACCESS1,normal_key7
   maintenance_key7:
        jmp out_of_key_7
   normal_key7:
    jnb ACCESS0,normal_key7_0
   normal_key7_1:
   mov a,state
	cjne a,#normal_phone,sst7
    jb key7_pressed,gnv7
	mov DIAL_BUF,#23
	lcall dial
	
    lcall next_number
    lcall add_memory
    
    mov dptr,#490          ;adrese 7
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv7
sst7:
    lcall return_to_main_state
	
jmp out_of_key_7
gnv7:   
setb key7_pressed
jmp out_of_key_7

normal_key7_0:
jb key7_pressed,wsfd27
mov DIAL_BUF,#23 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#490          ;adrese 7
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd17
lcall dial_all_in_memory
jmp out_of_key_7
wsfd17:
cjne a,#00,wsfd27
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd27:
 setb key7_pressed	 
  
out_of_key_7:
ret                      
;-------------------------------
key_8:
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu8
// jmp out_of_key_8
// yu8:
;------
cjne a,#maintanence_card_ok,ys8

	lcall next_number
	mov DIAL_BUF,#8

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_8
 
ys8:
;------

jnb ACCESS1,normal_key8
   maintenance_key8:
        jmp out_of_key_8
   normal_key8:
    jnb ACCESS0,normal_key8_0
   normal_key8_1:
   mov a,state
	cjne a,#normal_phone,sst8
    jb key8_pressed,gnv8
	mov DIAL_BUF,#24
	lcall dial
	
    lcall next_number
    lcall add_memory
    
    mov dptr,#500          ;adrese 8
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    ;lcall mid_delay
	jmp gnv8
sst8:
    lcall return_to_main_state
	
jmp out_of_key_8
gnv8:    
setb key8_pressed
jmp out_of_key_8

normal_key8_0:
	jb key8_pressed,wsfd28

mov DIAL_BUF,#24 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#500          ;adrese 8
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd18
lcall dial_all_in_memory
jmp out_of_key_8
wsfd18:
cjne a,#00,wsfd28
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd28:
setb key8_pressed	 
out_of_key_8:
ret                       
;-------------------------------
key_9: 
clr ie.1
 mov a,state
// cjne a,#count_down_mode,yu9
// jmp out_of_key_9
// yu9:
;------
cjne a,#maintanence_card_ok,ys9

	lcall next_number
	mov DIAL_BUF,#9

    lcall add_memory
    
    mov dptr,#star          ;adrese 0
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
    lcall long_delay
;	jmp gnv0


jmp out_of_key_9 
ys9:
;------

jnb ACCESS1,normal_key9
   maintenance_key9:
        jmp out_of_key_9
   normal_key9:
    jnb ACCESS0,normal_key9_0
   normal_key9_1:
   mov a,state
	cjne a,#normal_phone,sst9
	jb key9_pressed,gnv9
    mov DIAL_BUF,#25
    lcall dial

    lcall next_number
    lcall add_memory
    
    mov dptr,#510          ;adrese 9
    mov TEXTURE_LENGTH,#6
    lcall show_pattern
   	;lcall mid_delay
	jmp gnv9
sst9:
    lcall return_to_main_state
    
jmp out_of_key_9
gnv9:
setb key9_pressed
jmp out_of_key_9

normal_key9_0:                  
	jb key9_pressed,wsfd29
mov DIAL_BUF,#25 
mov call_type,#start_free_call
lcall next_number
;	inc DIALLED_COUNTER
lcall add_memory
    mov dptr,#510          ;adrese 9
    mov TEXTURE_LENGTH,#6
    lcall show_pattern

lcall search_in_free_nums
mov a,free_call_status
cjne a,#0ffh,wsfd19
lcall dial_all_in_memory
jmp out_of_key_9
wsfd19:
cjne a,#00,wsfd29
mov dialled_counter,#00h
clr first_key
lcall clear_line_7
wsfd29:
setb key9_pressed	 
out_of_key_9:
ret 
;-------------------------------------                   
key_star:

jb answer_received,gvuyhv65
jnb push_to_talk,gvuyhv65
jnb first_key,gvuyhv65
lcall start_auto_charge
jmp out_of_key_star
gvuyhv65:


clr ie.1
 mov a,state
// cjne a,#count_down_mode,yustar
// jmp out_of_key_star
// yustar:

jnb ACCESS1,normal_keystar
   maintenance_keystar:
       ret
   normal_keystar:
    jnb ACCESS0,normal_keystar_0
   normal_keystar_1:
    mov DIAL_BUF,#30
    lcall dial
	lcall mid4_delay
    ret 
    normal_keystar_0:
	out_of_key_star:                   
ret                      
;-------------------------------------
key_sharp:

clr ie.1
 mov a,state
// cjne a,#count_down_mode,yusharp
// jmp out_of_key_sharp
// yusharp:

jnb ACCESS1,normal_keysharp
   maintenance_keysharp:
       ret
   normal_keysharp:
    jnb ACCESS0,normal_keysharp_0
   normal_keysharp_1:
    mov DIAL_BUF,#31
    lcall dial
	lcall mid4_delay
    ret 
    normal_keysharp_0:
	out_of_key_sharp:                             
ret  
;-------------------------------------
key_redial:
 mov a,state
 //cjne a,#count_down_mode,yuredial
  cjne a,#maintanence_card_ok,yuredial
 jmp out_of_key_redial
 yuredial:

jnb ACCESS1,normal_redial
   maintenance_redial:
       ret
   normal_redial:
    jnb ACCESS0,normal_redial_0
   normal_redial_1:
    cjne DIALLED_COUNTER,#0,over_no_mem
    ret
 over_no_mem:
    jnb FIRST_KEY,over_key_dialed
    ret
 over_key_dialed:  
 ;;;;;;;;;;;;;;;;;;;;;;;;;;
 clr ie.1
 ;lcall start_scheduling_answer_time
mov call_type,#common_call
 mov a,state
	cjne a,#normal_phone,redsst1

	lcall end_scheduling_dial_wait_time
	lcall start_scheduling_answer_time
	lcall start_online_chargging

 lcall clear_message
 lcall clear_line_8
 
 lcall retrive_dialed_nums2
 lcall show_redial
  ;;;;;;;;;;;;;;;;;;;;;;;;;;   
    mov r1,#00h
 next_digit:
    inc r1
    mov a,#02fh
    add a,r1
    mov r0,a
    mov a,@r0
    mov DIAL_BUF,a
    lcall dial 
    lcall mid2_delay 
    lcall mid2_delay
;
   	mov a,DIALLED_COUNTER
	clr c
	subb a,#16
	jb acc.7,fcx_12
	jmp fcx_11
;	
fcx_12:
    mov a,r1
    cjne a,06h,next_digit   ;r1  o  r6
	jmp  fcx_10
fcx_11:
	mov a,r1
    cjne a,#16,next_digit   ;r1  o  r6
fcx_10:		  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    lcall long_delay
    lcall long_delay
    
	setb FIRST_KEY ;;;;;;;;;;;;;;;;;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
   
   lcall clear_line_6
ret
   redsst1:
    lcall return_to_main_state
    ret
 normal_redial_0:

out_of_key_redial:

ret    
;-------------------------------------
key_flash:
 
mov a,state
 cjne a,#normal_phone,flashsst1 
  
lcall flash                  
ret       
flashsst1:
lcall return_to_main_state 
lcall flash   
             
ret       
;-------------------------------------
key_lang:
mov a,state
chk_lang_menu1:
cjne a,#maintanence_menu1,chk_lang_menu2
lcall clear_lcd
lcall show_menu2
mov state,#maintanence_menu2
lcall long_delay
jmp out_of_key_lang
chk_lang_menu2:
cjne a,#maintanence_menu2,chk_lang_menu3
lcall clear_lcd
lcall show_running
lcall software_update
lcall bye3
jmp out_of_key_lang
chk_lang_menu3:
cjne a,#maintanence_menu3,chk_lang_menu4
lcall show_menu4
mov state,#maintanence_menu4
lcall long_delay
jmp out_of_key_lang
chk_lang_menu4:
cjne a,#maintanence_menu4,chk_lang_menu5
lcall manual_time_setting
mov state,#maintanence_menu5
lcall show_menu5
jmp out_of_key_lang

chk_lang_menu5:
cjne a,#maintanence_menu5,chk_lang_menu6
jnb time_set_h_m,change_new_minute
change_new_hour:
inc new_hour 
mov a,new_hour
cjne a,#24,uherfuh23
mov new_hour,#00h
uherfuh23:
jmp out_change_new_time
change_new_minute:	 
inc new_minute
mov a,new_minute
cjne a,#60,uherfuh25
mov new_minute,#00h
uherfuh25:
out_change_new_time:
lcall manual_time_setting
lcall mid3_delay
jmp out_of_key_lang


chk_lang_menu6:
cjne a,#maintanence_menu6,chk_lang_menu7
jnb alarm_set_h_m,change_new_minute2
change_new_hour2:
inc new_alarm_hour 
mov a,new_alarm_hour
cjne a,#24,uherfuh26
mov new_alarm_hour,#00h
uherfuh26:
jmp out_change_new_alarm
change_new_minute2:	 
inc new_alarm_minute
mov a,new_alarm_minute
cjne a,#60,uherfuh27
mov new_alarm_minute,#00h
uherfuh27:

out_change_new_alarm:
lcall manual_alarm_setting
lcall mid3_delay
jmp out_of_key_lang


chk_lang_menu7:
cjne a,#maintanence_menu7,chk_lang_menu8
jnb date_set_d_m,change_new_day2
change_new_month2:
inc new_month 
mov a,new_month
cjne a,#13,terfuh26
mov new_month,#01h
terfuh26:
jmp out_change_new_date
change_new_day2:	 
inc new_day
mov a,new_day
cjne a,#32,terfuh27
mov new_day,#01h
terfuh27:

out_change_new_date:
lcall manual_date_setting
lcall mid3_delay
jmp out_of_key_lang

chk_lang_menu8:
cjne a,#maintanence_menu8,chk_lang_menu9
lcall clear_lcd
lcall show_menu7
mov state,#maintanence_menu9
lcall long_delay
jmp out_of_key_lang

chk_lang_menu9:
cjne a,#maintanence_menu9,chk_lang_menu10
;;;
 mov zdata,#100
 mov addr_hi,#flash_delay_addr_hi
 mov addr_lo,#flash_delay_addr_lo
 lcall save_to_e2p
;;;
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_lang

chk_lang_menu10:
cjne a,#maintanence_menu10,chk_lang_menu11
;;;
/////
 mov zdata,#push_to_talk_charge
 mov addr_hi,#chargging_routine_addr_hi
 mov addr_lo,#chargging_routine_addr_lo
 lcall save_to_e2p

 mov zdata,#offline_charge
 mov addr_hi,#chargging_type_addr_hi
 mov addr_lo,#chargging_type_addr_lo
 lcall save_to_e2p
 //setare dar active
/////
;;;
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_lang

chk_lang_menu11:
cjne a,#maintanence_menu11,chk_lang_other
;;;
//

 mov zdata,#160
 mov addr_hi,#dialing_type_addr_hi
 mov addr_lo,#dialing_type_addr_lo
 lcall save_to_e2p

//tone shavad
//
;;;
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_lang


chk_lang_other:

//cjne a,#count_down_mode,yulang
cjne a,#maintanence_card_ok,yulang
//
jmp out_of_key_lang
yulang:
//
push acc
//;;;;;;;;;;;;;;;;;
//mov t0_c1,#20
//mov TH0,#00h
//mov TL0,#00h
//;clr antitap_timer_sw
//mov a,TMOD
//orl a,#00000001B
//mov TMOD,a
//
//setb ie.1
//setb TR0
//;;;;;;;;;;;;;;;;;
//mov a,state
//cjne a,#language_menu,welcome_to_lang_menu
//jmp your_in_lang_menu
//welcome_to_lang_menu:
//lcall clear_lcd
//lcall show_language_menu
//lcall show_box
//mov state,#language_menu
//lcall show_indicator
//jmp osd_4
//your_in_lang_menu:
//lcall roll_indicator
inc lang
mov a,lang
cjne a,#5,osd_4
mov lang,#1
osd_4:
 lcall refresh_main_state_screen
//
lcall mid4_delay
pop acc
out_of_key_lang:
ret                         
;-------------------------------------
key_vol:
// ;;;;;;;;
 mov a,state
// cjne a,#count_down_mode,yuvol
   cjne a,#maintanence_card_ok,yuvol

 jmp out_of_key_vol
 yuvol:
               
    inc VOLUME_LEVEL
    inc VOLUME_LEVEL 
    mov r4,VOLUME_LEVEL
    cjne r4,#18,go_ahead
    mov VOLUME_LEVEL,#10
 go_ahead:  
    
    ;;;;;;;;;;;;;;;;;;;
    mov dptr,# 2440
    mov r4,VOLUME_LEVEL            
    mov TEXTURE_LENGTH,r4               ;tool
    mov START_ROW,#ROW_8
    mov r4,START_COL               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS     
    setb LCD_CS             
    lcall show_pattern
    mov START_COL,r4
    mov STATUS_FLAGS,b 
    ;;;;;;;;;;;;;;;;;;;
    mov r4,VOLUME_LEVEL
volume_level_1:
    cjne r4,#10,volume_level_2
	clr volume0
	clr volume1
	jmp out_volume_level
volume_level_2:
    cjne r4,#12,volume_level_3
	setb volume0
	clr volume1
	jmp out_volume_level
volume_level_3:
    cjne r4,#14,volume_level_4
	clr volume0
	setb volume1
	jmp out_volume_level
volume_level_4:
    cjne r4,#16,out_volume_level
	setb volume0
	setb volume1
out_volume_level:   
   ;;;;;;;;;;;;;;;;;;;;;
    lcall long_delay
    mov dptr,#256            
    mov TEXTURE_LENGTH,#16               ;tool
    mov START_ROW,#ROW_8
    mov r4,START_COL               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS          
   lcall show_pattern
    mov START_COL,r4
    mov STATUS_FLAGS,b 
    ;;;;;;;;;;;;;;;;;;;;;

	out_of_key_vol:
ret    
;-------------------------------------
key_police:
mov a,state
chk_police_menu1:
cjne a,#maintanence_menu1,chk_police_menu2
lcall mini_flash
lcall call_mode
lcall bye3
jmp out_of_key_police
chk_police_menu2:
cjne a,#maintanence_menu2,chk_police_menu3
   lcall run_eep_update_with_progress_show
		lcall update_alarm
		lcall update_clock
		lcall update_date
	lcall clear_lcd
	lcall show_success_done
	lcall long_delay
	lcall long_delay
lcall bye3
jmp out_of_key_police
chk_police_menu3:
cjne a,#maintanence_menu3,chk_police_menu4
lcall initialize_eep
lcall bye3
jmp out_of_key_police

chk_police_menu4:
cjne a,#maintanence_menu4,chk_police_menu5
mov state,#maintanence_menu6
lcall show_menu5
lcall manual_alarm_setting
jmp out_of_key_police

chk_police_menu5:
cjne a,#maintanence_menu5,chk_police_menu6
cpl time_set_h_m
lcall long_delay
jmp out_of_key_police

chk_police_menu6:
cjne a,#maintanence_menu6,chk_police_menu7
cpl alarm_set_h_m
lcall long_delay
jmp out_of_key_police

chk_police_menu7:
cjne a,#maintanence_menu7,chk_police_menu8
cpl date_set_d_m
lcall long_delay
jmp out_of_key_police

chk_police_menu8:
cjne a,#maintanence_menu8,chk_police_menu9
lcall clear_lcd
lcall show_menu8
mov state,#maintanence_menu10
lcall long_delay
jmp out_of_key_police

chk_police_menu9:
cjne a,#maintanence_menu9,chk_police_menu10
;;;
 mov zdata,#80
 mov addr_hi,#flash_delay_addr_hi
 mov addr_lo,#flash_delay_addr_lo
 lcall save_to_e2p
;;;
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_police

chk_police_menu10:
cjne a,#maintanence_menu10,chk_police_menu11
;;;
//do nothing
//
lcall long_delay
jmp out_of_key_police

chk_police_menu11:
cjne a,#maintanence_menu11,chk_police_other
;;;
// do nothing
lcall long_delay
jmp out_of_key_police


chk_police_other:
mov a,phone_access_level
cjne a,#full_but_no_emergency_key,rhpolice1
 jmp out_of_key_police
rhpolice1:
 ;;;;;;;;;;;;;
 mov a,state
 cjne a,#maintanence_card_ok,uoher1
 jmp out_of_key_police
 uoher1:
// cjne a,#count_down_mode,yupolice
// jmp out_of_key_police
// yupolice:

lcall exit_to_main_state
lcall imidiate_flash

mov call_type,#free_call
lcall clear_line_8
lcall clear_line_7
lcall clear_line_5 
lcall clear_line_6
lcall mid4_delay
mov dptr,# 2220            
    mov TEXTURE_LENGTH,#40               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;
mov DIAL_BUF,#17
lcall dial
lcall mid2_delay                          
mov DIAL_BUF,#17
lcall dial
lcall mid2_delay
mov DIAL_BUF,#16
lcall dial
	mov 30h,#17 
 	mov 31h,#17 
	mov 32h,#16 
mov free_call_status,#0f1h

setb mic_mute ;

lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time
mov call_type,#free_call
setb access1
setb access0

out_of_key_police:
ret       
;-------------------------------------
key_urgent:
mov a,state
chk_urgent_menu1:
cjne a,#maintanence_menu1,chk_urgent_menu2
lcall long_delay
lcall bye3
jmp out_of_key_urgent

chk_urgent_menu2:
cjne a,#maintanence_menu2,chk_urgent_menu3
lcall clear_lcd
lcall show_menu1
mov state,#maintanence_menu1
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu3:
cjne a,#maintanence_menu3,chk_urgent_menu4
lcall clear_lcd
lcall show_menu1
mov state,#maintanence_menu1
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu4:
cjne a,#maintanence_menu4,chk_urgent_menu5
lcall clear_lcd
lcall show_menu3
mov state,#maintanence_menu3
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu5:
cjne a,#maintanence_menu5,chk_urgent_menu6
lcall clear_lcd
lcall show_menu4
mov state,#maintanence_menu4
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu6:
cjne a,#maintanence_menu6,chk_urgent_menu7
lcall clear_lcd
lcall show_menu4
mov state,#maintanence_menu4
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu7:
cjne a,#maintanence_menu7,chk_urgent_menu8
lcall clear_lcd
lcall show_menu4
mov state,#maintanence_menu4
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu8:
cjne a,#maintanence_menu8,chk_urgent_menu9
lcall clear_lcd
lcall show_menu3
mov state,#maintanence_menu3
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu9:
cjne a,#maintanence_menu9,chk_urgent_menu10
;;;
 mov zdata,#30
 mov addr_hi,#flash_delay_addr_hi
 mov addr_lo,#flash_delay_addr_lo
 lcall save_to_e2p
;;;
lcall clear_lcd
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu10:
cjne a,#maintanence_menu10,chk_urgent_menu11
;;
//
 mov zdata,#manual_charge
 mov addr_hi,#chargging_routine_addr_hi
 mov addr_lo,#chargging_routine_addr_lo
 lcall save_to_e2p

 mov zdata,#online_charge
 mov addr_hi,#chargging_type_addr_hi
 mov addr_lo,#chargging_type_addr_lo
 lcall save_to_e2p


//setare dar inactive
//
;;
lcall clear_lcd
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_urgent

chk_urgent_menu11:
cjne a,#maintanence_menu11,chk_urgent_other
;;
//

 mov zdata,#170
 mov addr_hi,#dialing_type_addr_hi
 mov addr_lo,#dialing_type_addr_lo
 lcall save_to_e2p

//pulse shaved
//
;;
lcall clear_lcd
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_urgent

chk_urgent_other:
mov a,phone_access_level
cjne a,#full_but_no_emergency_key,rhurgent1
 jmp out_of_key_urgent
rhurgent1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 mov a,state
 cjne a,#maintanence_card_ok,xiuefh1
 jmp out_of_key_urgent
 xiuefh1:
// cjne a,#count_down_mode,yuurgent
// jmp out_of_key_urgent
// yuurgent:

lcall exit_to_main_state
lcall imidiate_flash
mov call_type,#free_call
lcall clear_line_8
lcall clear_line_7
lcall clear_line_5 
lcall clear_line_6
lcall mid4_delay
mov dptr,# 2261            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;
mov DIAL_BUF,#17
lcall dial
lcall mid2_delay                          
mov DIAL_BUF,#17
lcall dial
lcall mid2_delay
mov DIAL_BUF,#21 
lcall dial  
	mov 30h,#17 
 	mov 31h,#17 
	mov 32h,#21 
mov free_call_status,#0f1h
 
setb mic_mute ;

lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time
mov call_type,#free_call
setb access1
setb access0
out_of_key_urgent:               
ret       
;-------------------------------------
key_fire:
mov a,state
chk_fire_menu1:
cjne a,#maintanence_menu1,chk_fire_menu2
lcall clear_lcd 
lcall show_menu3
mov state,#maintanence_menu3
lcall long_delay
jmp out_of_key_fire
chk_fire_menu2:
cjne a,#maintanence_menu2,chk_fire_menu3
   lcall send_reports_to_e2p_with_progress_show
	lcall clear_lcd
	lcall show_success_done
	lcall long_delay
	lcall long_delay
lcall bye3
jmp out_of_key_fire
chk_fire_menu3:
cjne a,#maintanence_menu3,chk_fire_menu4
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_fire

chk_fire_menu4:
cjne a,#maintanence_menu4,chk_fire_menu5
mov state,#maintanence_menu7
lcall show_menu5
lcall manual_date_setting
lcall long_delay
jmp out_of_key_fire

chk_fire_menu5:
cjne a,#maintanence_menu5,chk_fire_menu6
mov a,new_hour
lcall dec_to_bcd
mov hour,a
mov a,new_minute
lcall dec_to_bcd
mov minute,a
lcall set_clock
lcall set_clock
lcall long_delay
jmp out_of_key_fire


chk_fire_menu6:
cjne a,#maintanence_menu6,chk_fire_menu7
mov a,new_alarm_hour
lcall dec_to_bcd
mov current_alarm_hour,a
mov a,new_alarm_minute
lcall dec_to_bcd
mov current_alarm_minute,a
lcall set_new_alarm
lcall long_delay
jmp out_of_key_fire


chk_fire_menu7:
cjne a,#maintanence_menu7,chk_fire_menu8
mov a,new_month
lcall dec_to_bcd
mov month,a
mov a,new_day
lcall dec_to_bcd
mov day,a
lcall set_date 
lcall long_delay
jmp out_of_key_fire

chk_fire_menu8:
cjne a,#maintanence_menu8,chk_fire_menu9
lcall clear_lcd 
lcall show_menu8
mov state,#maintanence_menu11
lcall long_delay
jmp out_of_key_fire

chk_fire_menu9:
cjne a,#maintanence_menu9,chk_fire_menu10
;;;
 mov zdata,#40
 mov addr_hi,#flash_delay_addr_hi
 mov addr_lo,#flash_delay_addr_lo
 lcall save_to_e2p
;;;
lcall clear_lcd 
lcall show_menu6
mov state,#maintanence_menu8
lcall long_delay
jmp out_of_key_fire

chk_fire_menu10:
cjne a,#maintanence_menu10,chk_fire_menu11
;;;
// do nothing
lcall long_delay
jmp out_of_key_fire

chk_fire_menu11:
cjne a,#maintanence_menu11,chk_fire_other
;;;
// do nothing
lcall long_delay
jmp out_of_key_fire


chk_fire_other:
 mov a,phone_access_level
cjne a,#full_but_no_emergency_key,rhfire1
 jmp out_of_key_fire
rhfire1:

;;;;;;;;;;;;;;;;;
 mov a,state
// cjne a,#count_down_mode,yufire
// jmp out_of_key_fire
// yufire:
lcall exit_to_main_state
lcall imidiate_flash
mov call_type,#free_call
//lcall clear_lcd
lcall clear_line_8
lcall clear_line_7
lcall clear_line_5 
lcall clear_line_6
lcall mid4_delay
mov dptr,# 2318            
    mov TEXTURE_LENGTH,#56               ;tool
    mov START_ROW,#ROW_7               ;lcd code  4
    mov START_COL,#040h               ;lcd code  0
    mov b,STATUS_FLAGS
    setb LCD_CS              
    lcall show_pattern 
    mov STATUS_FLAGS,b 
    ;;
mov DIAL_BUF,#17
lcall dial
lcall mid2_delay                          
mov DIAL_BUF,#18
lcall dial
lcall mid2_delay
mov DIAL_BUF,#21
lcall dial
	mov 30h,#17 
 	mov 31h,#18
	mov 32h,#21 
mov free_call_status,#0f1h

setb mic_mute ;

lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time
mov call_type,#free_call
setb access1
setb access0
out_of_key_fire:
//            
ret     
;--------------------------------------
key_help:
// clr ie.7
//lcall check_dial_tone
//jnb dial_tone,yyuuyy
//lcall attention_buzz
//yyuuyy:
//setb ie.7
;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov a,state
cjne a,#maintanence_menu1,kjhga1
jmp kjhga2
kjhga1:
mov a,state
cjne a,#maintanence_card_ok,out_key_help
;
lcall check_maintanence_password
mov a,state
cjne a,#maintanence_password_ok,wrong_main_pass1
 ;
kjhga2:
lcall end_scheduling_dial_wait_time
lcall end_scheduling_answer_time

setb time_set_h_m
mov new_minute,#00h
mov new_hour,#00h 
mov new_alarm_hour,#00h 
mov new_alarm_minute,#00h 
mov new_day,#01h
mov new_month,#01h

 lcall clear_lcd
 lcall show_menu1
 mov state,#maintanence_menu1
 jmp out_key_help
;

wrong_main_pass1:
lcall clear_lcd
lcall show_wrong_password
lcall long_delay
lcall long_delay
lcall long_delay
lcall bye3
out_key_help:
lcall set_key_bus
ret 
;-------------------------------------
key_hook: 
clr ie.7
lcall exit_to_main_state
lcall clear_lcd
clr mic_mute  ;
clr voice_sw;;;;;;;;;;;;;;;;;;;;;;;;;;;
lcall show_please_wait
lcall imidiate_flash
lcall clear_line_2
;lcall long_delay
;lcall long_delay
;lcall long_delay
setb row1
setb row2
setb row3
setb row4
clr col6
setb col1
setb col2
setb col3
setb col4
setb col5
jnb row3,metf1
ret
metf1:	
mov ie,#00h
lcall stop_tic_tac
lcall clear_lcd
lcall save_report
setb card_detect
jnb card_detect,dforg
lcall bye3
dforg:
lcall show_dont_forget_ur_card  
;;;;;;;;;;;;;;;;;;;;;;;;
;clr lcd_bl
clr mic_mute   ;

alarm_card_again:
lcall attention_buzz
lcall long_delay
lcall long_delay  
;lcall long_delay
;lcall long_delay
;lcall long_delay

setb card_detect
jb card_detect,out_card_alarm
;;;;;;;;;;
djnz card_alarm_counter,alarm_card_again

;;;;;;;;;;
out_card_alarm:
clr card_sw
lcall bye3
ret
;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------
;---------------------------------------------
q_key_rtc:
lcall its_rtc_alarm
ret                       
;-------------------------------
q_key_door:					  
lcall door_is_open
ret                       
;-------------------------------
q_key_ring:
//
ret                       
