set_e2p_bus:
clr p3.0
clr p3.1
clr p3.4
clr p3.5
clr p3.6
clr p3.7

	clr  addr1_0
	clr  addr1_1
;	lcall short_delay
ret
;----------------------------------
set_handset_check_bus:
//clr p3.0
//clr p3.1
//clr p3.4
//clr p3.5
//clr p3.6
//clr p3.7

	clr  addr1_0
	setb  addr1_1
	lcall short_delay
ret
;----------------------------------
set_modem_bus:
clr modem_reply
clr modem_cs
clr modem_cmd
clr modem_clk
	clr  addr1_0
	clr  addr1_1
;	lcall short_delay
ret	
;---------------------------------
set_card_bus:
//clr p3.0
//clr p3.1
//clr p3.4
//clr p3.5
//clr p3.6
//clr p3.7

	clr  addr1_0
	setb   addr1_1
;	lcall short_delay
ret
;---------------------------------
set_lcd_bus:

clr lcd_rs
clr lcd_e
clr lcd_cs1
clr lcd_cs2
    setb  addr1_0
	setb addr1_1
ret
;---------------------------------
set_key_bus:

	clr  addr1_0
	setb  addr1_1
ret
;---------------------------------
set_rtc_bus:
				    
    setb  addr1_0
	setb addr1_1
	lcall short_delay
ret
;---------------------------------
set_sam_bus:
    setb addr1_0

	clr addr1_1
	clr buzzer
	lcall short_delay
ret
;---------------------------------
set_buzzer_bus:
//clr p3.0
//clr p3.1
//clr p3.4
//clr p3.5
//clr p3.6
//clr p3.7

    setb addr1_0
	clr addr1_1
	lcall short_delay
ret
;---------------------------------
