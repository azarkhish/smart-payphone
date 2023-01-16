		 short_delay:
    
    mov R2_BANK3,#50
 short:
	nop
	djnz R2_BANK3,short
	
ret
;-------------------------------------
short2_delay:
    
    mov R2_BANK3,#100
 short2:
	nop
	djnz R2_BANK3,short2
	
ret

;-------------------------------------
mid5_delay:
    
	mov R3_BANK3,#0ffh
 mid52: 
	mov R2_BANK3,#10
 mid51: 
	djnz R2_BANK3,mid51
	djnz R3_BANK3,mid52
    ret
;-------------------------------------
mid2_delay:
    
	mov R3_BANK3,#0ffh
 mid22: 
	mov R2_BANK3,#22
 mid21: 
	djnz R2_BANK3,mid21
	djnz R3_BANK3,mid22
    ret
;-------------------------------------
mid3_delay:
    
	mov R3_BANK3,#0ffh
 mid222: 
	mov R2_BANK3,#210
 mid211: 
	djnz R2_BANK3,mid211
	djnz R3_BANK3,mid222
    ret
;-------------------------------------
mid4_delay:
    
	mov R3_BANK3,#0ffh
 mid2222: 
	mov R2_BANK3,#200
 mid2111: 
	mov 01ch,#2
 mid2121:
	djnz 01ch,mid2121
	djnz R2_BANK3,mid2111
	djnz R3_BANK3,mid2222
    ret
;-------------------------------------
mid_delay:
    
	mov R3_BANK3,#0ffh
 mid2: 
	mov R2_BANK3,#03h
 mid1: 
	djnz R2_BANK3,mid1
	djnz R3_BANK3,mid2
    ret
;-------------------------------------
long_delay:
    mov R3_BANK3,#0ffh
 long2: 
	mov R2_BANK3,#0ffh
 long1: 
	nop
	nop
	nop
	djnz R2_BANK3,long1
	nop
	nop
	nop
	djnz R3_BANK3,long2
    ret   
;-------------------------------------    
card_delay:
    
	mov R3_BANK3,#10;20;15
card_del2: 
	mov R2_BANK3,#10
 card_del1: 
	djnz R2_BANK3,card_del1
	djnz R3_BANK3,card_del2
    ret
;---------------------------------------
w_delay:
	mov R3_BANK3,#250
card_dewl2: 
	mov R2_BANK3,#250;140;40
 card_dewl1: 
	djnz R2_BANK3,card_dewl1
	djnz R3_BANK3,card_dewl2
    ret
ret
;----------------------------------------
;---------------------------------
delay_flash:
push 06   
;30--40--80--100;                     ;r4=45 --> 1s delay by 11.592
          mov  r4,flash_delay                          ;
   back15_flash:mov  r6,#111                       ; Using R5 & R6
   back16_flash:mov  r5,#100                       ;
   back17_flash:djnz r5,back17_flash                  ;
          djnz r6,back16_flash                     ;
          djnz r4,back15_flash                     ;
pop 06
ret                                             ;
;-----------------------------------
delay_dtmf:
 push acc
 mov a,dtmf_delay
cjne a,#01,chk_delay_dtmf_2
			lcall delay31m
			lcall delay110m
			jmp out_delay_dtmf
chk_delay_dtmf_2:
cjne a,#02,chk_delay_dtmf_3
			lcall delay31m
			lcall delay31m
			lcall delay110m
			jmp out_delay_dtmf
chk_delay_dtmf_3:
cjne a,#03,chk_delay_dtmf_4
			lcall delay31m
			lcall delay31m
			lcall delay31m
			lcall delay110m
			jmp out_delay_dtmf
chk_delay_dtmf_4:
			lcall delay31m
			lcall delay110m
			lcall delay110m
out_delay_dtmf:
 pop acc
ret
;----------------------------
delay_mid_pulse:
push 06
                                 ; 31.25 ms delay by 11.592
          mov  r6,#100;50;220;119;200                           ; Using R5 & R6
   de8:mov  r5,#200                          ;
   de9:djnz r5,de9                          ;
          djnz r6,de8 


          mov  r6,#200;238                           ; Using R5 & R6
   de8s:mov  r5,#200                          ;
   de9s:djnz r5,de9s                          ;
          djnz r6,de8s 


pop 06
ret
;------------------------------
Delay_pulse_width:
push 06
                                         ; 31.25 ms delay by 11.592
          mov  r6,#200;255;238                            ; Using R5 & R6
   de2:mov  r5,#200;128;255;200                          ;
   de1:djnz r5,de1                          ;
          djnz r6,de2 
		  
pop 06		                     ;;
ret                       
;----------------------------
;__________________________ 25m pulse rise Delay ___________
Delay_pulse_rise:
push 06
                                         ; 31.25 ms delay by 11.592
          mov  r6,#200;255;238                            ; Using R5 & R6
   de3:mov  r5,#200;128;255;200                           ;
   de4:djnz r5,de4                          ;
          djnz r6,de3                          ;
pop 06
ret                       
;----------------------------
;__________________________5m pulse fall Delay ___________
Delay_pulse_fall: 
push 06
                                      ; 31.25 ms delay by 11.592
          mov  r6,#200;255;238                            ; Using R5 & R6
   de5:mov  r5,#200;255;200                           ;
   de6:djnz r5,de6                          ;
          djnz r6,de5                          ;
pop 06
ret                       
;----------------------------
;__________________________ 31ms Delay ___________
Delay31m:
push 06
                                        ; 31.25 ms delay by 11.592
          mov  r6,#125                            ; Using R5 & R6
   back10:mov  r5,#125                            ;
   back11:djnz r5,back11                          ;
          djnz r6,back10                          ;
pop 06
ret                       
;----------------------------
;__________________________ 4s Delay ___________
Delay4s:
push 06
          mov  r4,#180                           ;
   back15:mov  r6,#111                          ; Using R5 & R6
   back16:mov  r5,#100                          ;
   back17:djnz r5,back17                        ;
          djnz r6,back16                        ;
          djnz r4,back15                        ;
pop 06
ret                                             ;
;----------------------------
;__________________________ 2s Delay ___________
Delay2s:
push 06
          mov  r4,#90                           ;
   back15_zz:mov  r6,#111                       ; Using R5 & R6
   back16_zz:mov  r5,#100                       ;
   back17_zz:djnz r5,back17_zz                  ;
          djnz r6,back16_zz                     ;
          djnz r4,back15_zz                     ;
pop 6
ret                                             ;
;----------------------------
;__________________________ 1s Delay ___________
Delay1s:
push 06                                       ; 1s delay by 11.592
          mov  r4,#45                           ;
   back15_yy:mov  r6,#111                       ; Using R5 & R6
   back16_yy:mov  r5,#100                       ;
   back17_yy:djnz r5,back17_yy                  ;
          djnz r6,back16_yy                     ;
          djnz r4,back15_yy                     ;
pop 06
ret                                             ;
;----------------------------
;__________________________ 110m Delay ___________
Delay110m:
 push 06  
                             ; 110ms delay by 11.592
          mov  r6,#250                            ; Using R5 & R6
   back13:mov  r5,#210                            ;
   back14:djnz r5,back14                          ;
          djnz r6,back13 
pop 06
ret                                               ;
