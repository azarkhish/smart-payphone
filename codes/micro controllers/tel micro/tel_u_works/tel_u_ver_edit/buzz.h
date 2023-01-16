test_buzz:
 	lcall set_buzzer_bus
	setb BUZZER
	lcall delay1s
	clr BUZZER

lcall set_key_bus
ret
;---------------------------------------
jick_buzz:
;clr voice_sw
 	lcall set_buzzer_bus
	setb BUZZER
	lcall mid3_delay
	clr BUZZER
;setb voice_sw
lcall set_key_bus
ret
;---------------------------------------
attention_buzz:
 	lcall set_buzzer_bus
	push 06
	mov r6,#4 

buzz0:
	setb BUZZER
	lcall mid3_delay
	clr BUZZER
	lcall mid2_delay
	djnz r6,buzz0
	nop
	pop 06
lcall set_key_bus
ret 
;-----------------------------------------------
notice_buzz:
	lcall set_buzzer_bus
	push 06
	mov r6,#2
	buzz2:
	setb BUZZER
	lcall mid2_delay
	clr BUZZER
	lcall mid_delay
	djnz r6,buzz2

	mov r6,#40
	buzz11:
	setb BUZZER
	lcall short_delay
	clr BUZZER
	lcall mid_delay
	djnz r6,buzz11 
	

	pop 06
lcall set_key_bus
ret
;-------------------------------------------
alarm_buzz:
	lcall set_buzzer_bus
	push 06
	mov r6,#03
	buzz24:
	setb BUZZER
	lcall mid2_delay
	clr BUZZER
	lcall mid3_delay
	djnz r6,buzz24
	pop 06
lcall set_key_bus
ret
;-------------------------------------------
