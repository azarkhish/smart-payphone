//;;;;;;;;;;;;;;PayPhone Serial;;;;;;;;;;;;;;;;;;;;;;;;;
//PhoneSerial_1	equ 00h
//PhoneSerial_2	equ 010h
//PhoneSerial_3	equ 0f4h
//PhoneSerial_4	equ 047h
//;;;;;;;;;;;;;;PayPhone software version;;;;;;;;;;;;;;;
//SofwareVersion	equ 01h
;;;;;;;;;;;;;;Defenitions;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FIRST_KEY	  		 BIT	078H	;
LCD_CS    			 BIT 	079H	;
READER_STATUS 		 BIT 	07BH	;  byte:2fh
ACCESS0				 BIT 	07CH	;
ACCESS1				 BIT 	07DH	;
CARD_STATUS			 BIT 	07EH	;

card_check_policy	bit		070h	;
initial_account		bit		071h	; save cal_account to virtual account indicator
out_of_service1		 BIT	072H	;
out_of_service2		 BIT	073H	;	byte:2eh
latch_up_pulse_duration bit 074h	;
need_to_alert			bit 075h	;
chargging_routine	 BIT	076h	;
guard				 BIT	077h	;

kolang				 bit	068h	;	
count_down_sw		 bit    069h	;
tone_dialing		 bit    06ah	;
black_white			 bit	06bh   	;	byte:2dh
first_zerro			 BIT 	06ch	;
second_zerro		 BIT 	06dh	;
valid_card			 BIT	06fh	;

search_table_failed	 BIT 	060h	;
online_chargging	 BIT    061h	;
key1_pressed		 BIT    062h	;
key2_pressed		 BIT    063h	;	byte:2ch
key3_pressed		 BIT    064h	;
key4_pressed		 BIT    065h	;
key5_pressed		 BIT    066h	;
key6_pressed		 BIT    067h	;

R_error    		bit      063h
U_error    		bit      064h

key7_pressed		 BIT    058h	;
key8_pressed		 BIT    059h	;
key9_pressed		 BIT    05ah	;
key0_pressed		 BIT    05bh	;	byte:2bh
answer_received		 BIT	05ch	;
show_time_sw		 BIT	05dh	;
pre_charge			 BIT	05eh	;
invalid_sw			 BIT	05fh	;

insert_card_sw	 	 BIT	050h	;
wait_sw     		 BIT	051h	;
dial_num_sw			 BIT	052h	;
sign				 BIT	053h	;	byte:2ah
error			     BIT	054h	;
time_set_h_m		 BIT	055h	;
alarm_set_h_m		 BIT	056h	;
date_set_d_m		 bit    056h    ;
push_to_talk		 BIT	057h	;

row1 bit p0.0
row2 bit p0.1
row3 bit p0.2
row4 bit p0.3

col1 bit p0.4
col2 bit p0.5
col3 bit p0.6
col4 bit p0.7

addr1_0			BIT	P1.0	
addr1_1			BIT	P1.1	
tel_sw			BIT	P1.2
lcd_sw			BIT	p1.3	
voice_sw		BIT	P1.4
card_sw			BIT p1.4	
standby_sw		BIT	P1.5
volume1			bit p1.5	
modem_sw		BIT	P1.6	
line_sw			BIT	P1.7	

antitap_CLK		BIT	P2.0   
antitap_com		BIT	P2.1   
antitap_csn		BIT	P2.2   
volume0			bit p2.3   
KEYBOARD_CLK	BIT	P2.4 
col5	bit p2.4
col6	bit p2.5
card_detect bit p2.6  
KEYBOARD_RST	BIT	P2.5   
KEYBOARD_INPUT	BIT	P2.6   
mic_mute		BIT	P2.7   

SAM_RX			BIT	P3.0
SDA				BIT	P3.0
handset_chk_out	BIT	P3.0
rtc_SDA			BIT	P3.0

SAM_TX			BIT	P3.1
SCL				BIT	P3.1
antitap_reply	BIT	P3.1
rtc_SCL			BIT	P3.1

SPM_INT			BIT	P3.2
modem_INT		BIT	P3.3

modem_reply		BIT	p3.4
SAM_RESET	    BIT p3.4
CARD_INPUT		BIT	P3.4
LCD_RS			BIT P3.4

modem_cs		BIT	p3.5 
BUZZER			BIT	P3.5
CARD_OUTPUT	    BIT p3.5
LCD_E			BIT	P3.5
 
modem_clk		BIT	P3.6
sam_addr_0		BIT	P3.6
CARD_CLOCK		BIT	P3.6
LCD_CS1			BIT	P3.6
Maintenance_SDA	BIT	P3.6

modem_cmd		BIT	P3.7   
sam_addr_1		BIT	P3.7   
CARD_RESET		BIT	P3.7   
LCD_CS2			BIT	P3.7 
Maintenance_SCL	BIT	P3.7
;------------------------------------------
pre_1			data	019h			  ;;
pre_2			data	01ah			  ;;
pre_3			data	01bh			  ;;
pre_4			data	01ch			  ;;
pre_5			data	01dh			  ;;	Register Bank 2
pre_6			data	01eh			  ;;
 										  ;;
										  ;;
;------------------------------------------
	  									  ;;
charge_level			data	010h	  ;;
R2_BANK3			 	DATA	011H	  ;;
R3_BANK3			 	DATA	012H 	  ;;
kount				 	data	013h	  ;;  Register Bank 3
zone				 	data	014h	  ;;
phone_access_level	 	data	015h	  ;;
call_type			 	data	016h	  ;;
;-------------------------------------------

LCD_COMMAND_BUF		 DATA 	020H
DIAL_BUF			 DATA	021H
DISPLAY_BUF			 DATA	022H
TEXTURE_LENGTH		 DATA	023H
START_ROW			 DATA	024H
START_COL			 DATA	025H
VOLUME_LEVEL		 DATA	026H
msg_addr_hi			data 	027h
msg_addr_lo			data 	028h
card_alarm_counter	data 	029h
							; :
							; :	 bit defenitions
							; :
STATUS_FLAGS		 DATA 	02FH


//dial_memory      data   30h <---->3fh 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

crc_lo    data 30h 
crc_hi    data 31h
tmp       data 32h 
cmd_buf   data 33h
tmp_buf   data 34h
send_buf  data 35h //35h-37h
rcv_buf   data 38h //38h-3ah
var_1		data	03bh

new_hour			data	03ch
new_minute			data	03dh
new_alarm_hour		data	03eh
new_alarm_minute	data	03fh

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
paytemp_lo 			 DATA 	40h
paytemp_hi 			 DATA 	41h
paytol_lo  			 DATA 	42h
paytol_hi  			 DATA 	43h
overload   			 DATA 	44h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
current_alarm_hour		 data   40h
current_alarm_minute	 data   41h
new_day					data    42h
new_month				data    43h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
temp 	   			 DATA 	45h   
addr_lo	  			 DATA 	4bh		; 2-byte address register
addr_hi	 			 DATA 	4ch
dp_h	  			 DATA 	4dh
dp_l	  			 DATA 	4eh
zdata	  			 DATA 	4fh
	
lang	   			 DATA	50h
state       		 DATA	51h
t0_c1		 		 DATA	52h
t0_c2				 DATA	53h
t1_c1				 DATA	54h
t1_c2				 DATA	55h

free_call_status     DATA   56h
free_call_num_index  DATA   57h

t1_c3       	     DATA	58h
//pre_f_2		 		 DATA	59h
time_slot_hi			 	 DATA	5ah
time_slot_lo			 	 DATA	5bh

pulse_coef			 DATA	5ch

hour              	 DATA	5dh
minute        	     DATA	5eh	

card_info			 DATA	5fh	  ;8bytes
primary_account_hi   DATA	67h	  
primary_account_lo   DATA	68h	  
current_account_hi   DATA	69h	  		
current_account_lo   DATA	6ah
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
date_index_hi        data   67h
date_index_lo		 data   68h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
virt_account_hi		data	6bh
virt_account_lo		data	6ch
flash_delay			data	6dh
dtmf_delay			data	6eh
dtmf_db				data	6fh

pulse_count_hi		 DATA   71h
pulse_count_lo		 DATA   72h
answer_time			 DATA   73h
call_timer_hour		 data   74h
call_timer_minute	 data   75h

t2_c1				 data   76h
t2_c2				 data   77h 
pulse_duration		 data   78h
down_counter		 data   79h

call_duration_hi	 data   7ah
call_duration_lo	 data   7bh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
day	 				 data   7ch
month	 			 data   7dh
year				 data   7eh
second               data   7fh
;------------------------------------------
NoAck      	BIT     Flags.0        ;I2C no acknowledge flag.
BusFault   	BIT     Flags.1        ;I2C bus fault flag.
I2CBusy    	BIT     Flags.2        ;I2C busy flag.
BitCnt     	DATA    8h             ;Bit counter for I2C routines.
ByteCnt    	DATA    9h             ;Byte counter for I2C routines.
SlvAdr     	DATA    0Ah            ;Slave address for I2C routines.
XmtDat     	DATA    0bh            ;I2C transmit buffer, 8 bytes max.
RcvDat     	DATA    015h            ;I2C receive buffer, 8 bytes max.
Flags      	DATA    020h            ;Location for bit flags
;------------------------------------------
ROW_1			     			EQU		0B8H
ROW_2				 			EQU		0B9H
ROW_3				 			EQU		0BAH
ROW_4				 			EQU		0BBH
ROW_5				 			EQU		0BCH
ROW_6				 			EQU		0BDH
ROW_7				 			EQU		0BEH
ROW_8				 			EQU		0BFH

DIALLED_COUNTER		 			EQU	    R6
KEYBOARD_SCANNER	 			EQU	    R7

lang_offset_hi 		 			EQU		01bh
lang_offset_lo 		 			EQU		058h

FADDR				 			EQU		0a0h		; fixed address for AT24Cxx EEPROMs
PADDR				 			EQU		0		; programmable address (0..7)
PADDR2				 			EQU		1		; programmable address (0..7)
default_lang         			EQU 	1 
UPDATE_MASK			 			EQU		161	   

//FREE_CALL			 			EQU		160
CITY_CALL			 			EQU		161
COUNTRY_CALL		 			EQU		162
WORLD_CALL			 			EQU		163
FAILLED_CALL	     			EQU		170

online_charge		 			equ		170
offline_charge		 			equ 	160
auto_charge 		 			equ		160
manual_charge   	 			equ     170 	

PAYTOL_ADDR_HI	     			EQU		038H
PAYTOL_ADDR_LO	     			EQU		03aH

BL_TIME_ADDR_HI	     			EQU		038H
BL_TIME_ADDR_LO	     			EQU		04cH
	   
OFF_CHARGE_TABLE_HI  			EQU 019H
OFF_CHARGE_TABLE_LO	 			EQU 026H

charge_level_table_addr_hi		equ	028h
charge_level_table_addr_lo		equ	062h


REPORT_TABLE_ADDR_HI 			EQU 00H
REPORT_TABLE_ADDR_LO 			EQU 0AH

chargging_type_addr_hi  		EQU		038h
chargging_type_addr_lo  		EQU		03eh

chargging_routine_addr_hi 		equ   038h
chargging_routine_addr_lo 		equ   03fh

answer_time_addr_hi 			equ   038h
answer_time_addr_lo 			equ   040h

zerro_prevent_addr_hi 			equ   038h
zerro_prevent_addr_lo 			equ   044h

AntiTapActivate_addr_hi			equ 	038h
AntiTapActivate_addr_lo			equ 	057h

other_report_addr_hi		 	equ 	017h
other_report_addr_lo		 	equ 	04ch

other_table_end_addr_hi 	 	equ 	017h
other_table_end_addr_lo		 	equ 	06ch

free_nums_table_addr_hi			equ	018h	
free_nums_table_addr_lo			equ	034h	

software_version_addr_hi			equ	017h	
software_version_addr_lo			equ	06ch	

hour_addr_lo					equ  08h
minute_addr_lo					equ  09h

handset_addr_hi					equ 038h
handset_addr_lo					equ 0a5h

dial_wait_addr_hi				equ	 038h
dial_wait_addr_lo				equ	 049h

card_change_wait_time_addr_hi	equ	038h
card_change_wait_time_addr_lo	equ	04ah

phone_activity_level_addr_hi	equ 038h	
phone_activity_level_addr_lo	equ 046h

charge_priority_addr_hi			equ 038h	
charge_priority_addr_lo			equ 051h

dialing_type_addr_hi			equ 038h	
dialing_type_addr_lo			equ	047h

default_lang_addr_hi			equ 038h
default_lang_addr_lo			equ	04fh

message_addr_hi					equ 036h 
message_addr_lo					equ	02fh

WHITE_LIST_ADDR_HI				equ	031h
WHITE_LIST_ADDR_LO				equ	029h

BLACK_LIST_ADDR_HI				equ	02ch
BLACK_LIST_ADDR_LO				equ	079h

black_list_ram_addr				equ 00h
white_list_ram_addr				equ 03e8h

card_check_policy_addr_hi		equ 038h
card_check_policy_addr_lo		equ 04bh

hour_update_mask_addr_hi	 equ    038h
hour_update_mask_addr_lo	 equ    02fh

minute_update_mask_addr_hi	 equ    038h
minute_update_mask_addr_lo	 equ    031h

alarm_update_mask_addr_hi	 equ    038h
alarm_update_mask_addr_lo	 equ    033h

day_update_mask_addr_hi	 	 equ    038h
day_update_mask_addr_lo		 equ    036h

month_update_mask_addr_hi	 equ    038h
month_update_mask_addr_lo	 equ    038h

ring_manage_addr_hi	 	     equ    038h
ring_manage_addr_lo	 		 equ    042h

day_type_table_addr_hi	 	equ		02bh
day_type_table_addr_lo 		equ     0ch

CharggingScheduller_table_addr_hi	 	equ		02ah
CharggingScheduller_table_addr_lo	 	equ		0bch

flash_delay_addr_hi			equ		050h
flash_delay_addr_lo			equ		00h

dtmf_delay_addr_hi			equ		050h
dtmf_delay_addr_lo			equ		01h

dtmf_db_addr_hi			equ		050h
dtmf_db_addr_lo			equ		02h

emergency_map_addr_hi equ	038h
emergency_map_addr_lo equ	045h
;;
door_mask	equ	1
handset_mask	equ	2
line_mask	equ	4
sam_mask	equ	8
spm_mask	equ	16
battery_mask	equ	32
card_mask	equ	64
rtc_mask	equ	128

;;

sam1_addr_hi	equ	035h
sam1_addr_lo	equ 0efh

sam2_addr_hi	equ	036h
sam2_addr_lo	equ 04h

sam3_addr_hi	equ	036h
sam3_addr_lo	equ 019h

sam4_addr_hi	equ	036h
sam4_addr_lo	equ 02eh

t2con 							equ 0c8h
tr2 							equ t2con.2
tf2								equ t2con.7
exf2 							equ t2con.6 
t2mod 							equ 0c9h
tl2								equ 0cch
th2	 							equ 0cdh
rcap2h							equ 0cbh
rcap2l							equ 0cah

;call satets
wait_for_dial					equ 1
dialed							equ 2
;call type
;free_call	equ 160
no_call		equ	0
common_call equ 200
start_free_call equ 30


no_event 					 equ 	0
ring_event					 equ 	1
line_sw_event  				 equ 	2
alarm_event 				 equ 	3
door_event  		 		 equ 	4
handset_event				 equ    5
sam_event					 equ	6
line_event					 equ    7	
rtc_corrupt_event			 equ    8
no_charge_pulse_event		 equ	9
emergency_event				 equ    10
low_battery_event			 equ	11
incomming_call_event		 equ	12
card_reader_event			 equ	13


Im_AntiTap_Agent equ 70
its_emergency_report equ 80

index		EQU	r0		; buffer pointer
;kount		EQU	r1		; byte count register

I2CRTC    					 EQU    0a2h           ;Slave address for PCF8593 rtc

AUXR1 						 equ    0a2h
//phone access level
full_access equ 0
free_call equ 160  
no_access equ 170
no_free_call equ 180
full_but_no_emergency_key equ 190
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ACK    	equ  10000101b 
NACK   	equ  10100101b
HI     	equ  10000001b
BYE   	equ  10111101b
EOU	  	equ  10001101b
EOR  	equ  10010001b
SOU  	equ  10010101b
SOR  	equ  10011001b
READY  	equ  10011101b
AUTHEN 	equ  10100001b


Phone_Group_addr_hi			equ 038h
Phone_Group_addr_lo			equ	050h
		
;;;;;;;;;;;;;;state defenitions;;;;;;;;;;;;;;;;;;;
normal_phone    equ 11
language_menu	equ 12
count_down_mode equ 13
modem_condition	equ 15
sam_check		equ 16
showing_message	equ 17
maintanence_card_ok 	equ 129
maintanence_password_ok equ 130
maintanence_menu1 		equ 131 ; main maitenance menu
maintanence_menu2 		equ 132 ; maintenance card
maintanence_menu3 		equ 133 ; payphone settings
maintanence_menu4 		equ 134 ; RTC setting selection
maintanence_menu5 		equ 135 ; time setting
maintanence_menu6 		equ 136 ; alarm setting
maintanence_menu7 		equ 137 ; date setting
maintanence_menu8 		equ 138 ; manual settings 
maintanence_menu9 		equ 139 ; flash delay  
maintanence_menu10 		equ 140 ; tone delay 
maintanence_menu11 		equ 141 ; tone db 


