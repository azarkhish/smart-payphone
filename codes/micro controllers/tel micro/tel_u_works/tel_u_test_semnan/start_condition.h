 	clr line_sw
	clr card_sw	
	clr mic_mute ;
	clr lcd_sw
	
	setb tel_sw
	clr modem_sw
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lcall set_key_bus
// check_alarm_condition:
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
jb row1,no_alarm

setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
clr row2
clr row3
clr row4
jb col6,no_alarm
lcall its_rtc_alarm
 no_alarm:
//;++++++++++++++++++++++++++++++++++
lcall set_key_bus
check_ring_condition:
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
jb row4,no_ring

setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
clr row2
clr row3
clr row4
jb col6,no_ring
lcall manage_incomming_call
no_ring:	
//// ;++++++++++++++++++++++++++++
lcall set_key_bus
check_door_condition:
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
jb row2,no_door

setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
clr row2
clr row3
clr row4
jb col6,no_door
lcall door_is_open
no_door:
// ;++++++++++++++++++++++++++++++
lcall set_key_bus
 check_hook_condition:
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
jnb row3,hooked

setb col1
setb col2
setb col3
setb col4
setb col5
setb col6
clr row1
clr row2
clr row3
clr row4
jb col6,no_hook
hooked:
	lcall bye3
no_hook:
	lcall phone
lcall bye3
//
