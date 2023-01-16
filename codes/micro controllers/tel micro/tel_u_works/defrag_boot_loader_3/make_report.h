save_hour:
	;lcall bcd_to_dec
	mov hour,a
ret
;----------------------------
save_minute:
	;lcall bcd_to_dec
	mov minute,a
ret
;----------------------------
save_card_info:
clr ie.1
lcall set_card_bus
clr CARD_OUTPUT
lcall short_delay
push 01
		mov r1,#05fh
		
		setb CARD_INPUT
		lcall reset_card
	
fhyt1:
		clr a
		jnb CARD_INPUT,fh1
		setb acc.7
	fh1:
		lcall clock_card

		jnb CARD_INPUT,fh2
		setb acc.6
	fh2:
		lcall clock_card

		jnb CARD_INPUT,fh3
		setb acc.5
	fh3:
		lcall clock_card

		jnb CARD_INPUT,fh4
		setb acc.4
	fh4:
		lcall clock_card

		jnb CARD_INPUT,fh5
		setb acc.3
	fh5:
		lcall clock_card

		jnb CARD_INPUT,fh6
		setb acc.2
	fh6:
		lcall clock_card
	
		jnb CARD_INPUT,fh7
		setb acc.1
	fh7:
		lcall clock_card
	
		jnb CARD_INPUT,fh8
		setb acc.0
	fh8:
		lcall clock_card
	
		mov @r1,a
		inc r1
		cjne r1,#067h,fhyt1
pop 01
clr CARD_INPUT
setb ie.1
ret
;----------------------------                                
generate_comunication_code:
;/will generates a code according to dialled num and passes to acc
push 01
	    mov r1,#030h
		mov a,@r1
		cjne a,#016,city
		mov r1,#031h
		mov a,@r1
		cjne a,#016,country
	
	world:
	mov a,#WORLD_CALL
	jmp outzj
	
	country:
	mov a,#COUNTRY_CALL
	jmp outzj
	
	city:
	    mov a,free_call_status
		cjne a,#0ffh,check_free_2
		jmp free
check_free_2:
 	    mov a,free_call_status
		cjne a,#0f1h,not_free

		free:
		mov a,#FREE_CALL
		jmp outzj
		not_free:
		mov a,#CITY_CALL	
	outzj:
pop 01
ret
;----------------------------
load_report_table_current_addr:
	mov addr_hi,#REPORT_TABLE_ADDR_HI				  
	mov addr_lo,#REPORT_TABLE_ADDR_LO 			  
	lcall read_e2p_byte
	mov b,a
	lcall inc_e2p_counter 			  
	lcall read_e2p_byte
	mov addr_lo,a
	mov addr_hi,b
ret
;----------------------------
save_report:
	push 00
	push dpl
	push dph
	mov a,call_duration_lo;pulse_count_lo
	cjne a,#00,lets_save
	mov a,call_duration_hi;pulse_count_hi
	cjne a,#00,lets_save

	    mov a,free_call_status			 ;
		cjne a,#0ffh,chk_free_2	 ; save free_calls
		jmp lets_save					 ;

chk_free_2:	    
		mov a,free_call_status			 ;
		cjne a,#0f1h,sadf23	 ; save free_calls_dialled_by emergency keys
		jmp lets_save					 ;
 sadf23:

	jmp dont_need_to_save
	lets_save:
;	lcall check_call_report_table_address_validity
	lcall load_report_table_current_addr
	mov a,addr_hi
	cjne a,#016h,sfz_1
	mov a,addr_lo			  ;check if its end of table
	cjne a,#0b4h,sfz_1
	jmp	dont_need_to_save
	sfz_1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lcall generate_comunication_code ;
	mov zdata,a						 ;   call type
	lcall save_to_e2p				 ;
	lcall inc_e2p_counter			 ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
	mov a,hour						  ;
	mov zdata,a						  ;	 call hour
	lcall save_to_e2p				  ;
	lcall inc_e2p_counter			  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;
	mov a,minute					  ;
	mov zdata,a						  ;	 call minute
	lcall save_to_e2p				  ;
	lcall inc_e2p_counter			  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov r0,#063h			        ;
	mov zdata,#0;@r0		        ;
	lcall save_to_e2p				;
	lcall inc_e2p_counter	 ;      ;
	mov r0,#064h			        ;
	mov zdata,@r0			        ;
	lcall save_to_e2p		        ;
	lcall inc_e2p_counter		    ;   card serial
	mov r0,#065h				    ;
	mov zdata,@r0				    ;
	lcall save_to_e2p			    ;
	lcall inc_e2p_counter		    ;
	mov r0,#066h				    ;
	mov zdata,@r0				    ;
	lcall save_to_e2p	  		    ;
	lcall inc_e2p_counter			;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov zdata,call_duration_hi  				 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;	  call duration
	mov zdata,call_duration_lo					 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov a,primary_account_hi					 ;
	mov zdata,a									 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ; primary account
	mov a,primary_account_lo					 ;
	mov zdata,a									 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov a,day						 			;
	mov zdata,a						  			;	 call day
	lcall save_to_e2p				  			;
	lcall inc_e2p_counter			  			;
												;
	mov a,month						  			;
	mov zdata,a						  			;	 call month
	lcall save_to_e2p				  			;
	lcall inc_e2p_counter			  			;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov a,current_account_hi					 ;
	mov zdata,a									 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;	final account
	mov a,current_account_lo					 ;
	mov zdata,a									 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;--------									 ;
	mov r0,#30h									 ;
	mov r2,#12									 ;
wmsj1:											 ;	distination phone number
	mov a,@r0									 ;
	clr c										 ;
	subb a,#16									 ;
   	mov zdata,a									 ;
	inc r0										 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
	djnz r2,wmsj1								 ;
	;--------									 ;
	mov a,pulse_count_hi						 ;
	mov zdata,a									 ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
	mov a,pulse_count_lo						 ;
	mov zdata,a									  ;
	lcall save_to_e2p							 ;
	lcall inc_e2p_counter						 ;
												 ;
	mov a,addr_hi								 ;
	mov dph,a									 ;
	mov a,addr_lo								 ;
	mov dpl,a									  ;
												  ;;
	mov addr_hi,#00								  ;
	mov addr_lo,#10								  ;
	mov a,dph									  ;
	mov zdata,a									  ;
	lcall save_to_e2p							  ;
	mov addr_hi,#00								  ;
	mov addr_lo,#11								   ;
	mov a,dpl									   ;;
	mov zdata,a									   ;
	lcall save_to_e2p							   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;												   
	dont_need_to_save:							   
	pop dph
	pop dpl
	pop 00
ret
;--------------------------------------------
save_other_event_report:
lcall load_other_report_table_current_addr
mov a,addr_hi
cjne a,#other_table_end_addr_hi,sfqkt1
mov a,addr_lo
cjne a,#other_table_end_addr_lo,sfqkt1
jmp armft1

sfqkt1:
;lcall check_other_report_table_address_validity
mov a,temp
mov zdata,a
lcall save_to_e2p
lcall inc_e2p_counter
mov a,hour
mov zdata,a
lcall save_to_e2p
lcall inc_e2p_counter
mov a,minute
mov zdata,a
lcall save_to_e2p
lcall inc_e2p_counter

lcall refresh_other_report_table_current_addr
armft1:
ret
;--------------------------------------------
load_other_report_table_current_addr:
 push acc
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall read_e2p_byte
 mov b,a
 lcall inc_e2p_counter 			  
 lcall read_e2p_byte
 mov addr_lo,a 
 mov addr_hi,b
 pop acc
ret
;--------------------------------------------
refresh_other_report_table_current_addr:
 mov b,addr_lo
 mov a,addr_hi
 mov zdata,a
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall save_to_e2p
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall inc_e2p_counter
  mov zdata,b
 lcall save_to_e2p
ret
;--------------------------------------------
;-----------------------------
check_other_report_table_address_validity:
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall read_e2p_byte
 
 mov b,#other_report_addr_hi
 clr c
 subb a,b
  jc other_report_addr_is_not_valid
 check_o_v_1:

 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall read_e2p_byte
  mov b,a
 mov a,#other_table_end_addr_hi
 clr c
 subb a,b
  jc other_report_addr_is_not_valid
 check_o_v_2:

 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
 lcall inc_e2p_counter
 lcall read_e2p_byte
 
 mov b,#04eh
 clr c
 subb a,b
  jc other_report_addr_is_not_valid
 check_o_v_3:
 
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
  lcall inc_e2p_counter
 lcall read_e2p_byte
  mov b,a
 mov a,#other_table_end_addr_lo
 clr c
 subb a,b
  jc other_report_addr_is_not_valid
 check_o_v_4:
 other_report_addr_is_valid:
 jmp tfwekj2
 other_report_addr_is_not_valid:
 mov addr_hi,#other_report_addr_hi
 mov addr_lo,#other_report_addr_lo
mov zdata,#other_report_addr_hi
lcall save_to_e2p 
lcall inc_e2p_counter
mov zdata,#other_report_addr_lo+2
lcall save_to_e2p 
tfwekj2:
ret
;-----------------------------
check_call_report_table_address_validity:
 mov addr_hi,#REPORT_TABLE_ADDR_HI
 mov addr_lo,#REPORT_TABLE_ADDR_LO
 lcall read_e2p_byte
 
 mov b,#REPORT_TABLE_ADDR_HI
 clr c
 subb a,b
  jc report_addr_is_not_valid
 check_c_v_1:

 mov addr_hi,#REPORT_TABLE_ADDR_HI
 mov addr_lo,#REPORT_TABLE_ADDR_LO
 lcall read_e2p_byte
  mov b,a
 mov a,#other_report_addr_hi
 clr c
 subb a,b
  jc report_addr_is_not_valid
 check_c_v_2:

 mov addr_hi,#REPORT_TABLE_ADDR_HI
 mov addr_lo,#REPORT_TABLE_ADDR_LO
 lcall inc_e2p_counter
 lcall read_e2p_byte
 
 mov b,#REPORT_TABLE_ADDR_LO+2 
 clr c
 subb a,b
  jc report_addr_is_not_valid
 check_c_v_3:
 
 mov addr_hi,#REPORT_TABLE_ADDR_HI
 mov addr_lo,#REPORT_TABLE_ADDR_LO
  lcall inc_e2p_counter
 lcall read_e2p_byte
  mov b,a
 mov a,#other_report_addr_lo
 clr c
 subb a,b
  jc report_addr_is_not_valid
 check_c_v_4:
 report_addr_is_valid:
 jmp tfwekj234
 report_addr_is_not_valid:
 mov addr_hi,#REPORT_TABLE_ADDR_HI
 mov addr_lo,#REPORT_TABLE_ADDR_LO
mov zdata,#REPORT_TABLE_ADDR_HI
lcall save_to_e2p 
lcall inc_e2p_counter
mov zdata,#REPORT_TABLE_ADDR_LO+2
lcall save_to_e2p 
tfwekj234:
ret
