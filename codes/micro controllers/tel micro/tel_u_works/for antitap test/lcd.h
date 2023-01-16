;------------------------------------------------
;-----------------lcd functions------------------
;------------------------------------------------
;-------------------------------------           	    
display_lcd:
	setb LCD_RS
	mov p0,DISPLAY_BUF
	lcall clock_lcd
ret
;-------------------------------------
show_pattern:
    lcall set_lcd_bus
push ie
clr ie.7
   	jb sign,its_a_sign
	lcall set_lang_offset
its_a_sign:
    mov r0,START_ROW
    mov LCD_COMMAND_BUF,r0
    lcall command_lcd
    mov r0,START_COL
    mov LCD_COMMAND_BUF,r0 
    lcall command_lcd
    jb LCD_CS,right
   left:
    setb LCD_CS2
    clr LCD_CS1
    jmp over_right
   right:
    setb LCD_CS1
    clr LCD_CS2
    over_right:
  next_byte:
  clr a
  movc a,@a+dptr
  mov DISPLAY_BUF,a
  lcall display_lcd
  inc dptr
  djnz TEXTURE_LENGTH,next_byte 
  
  lcall set_key_bus    
pop ie
    
ret
;-------------------------------------
initialize_lcd:
    lcall set_lcd_bus
	lcall mid_delay
	mov LCD_COMMAND_BUF,#0c0h
	lcall command_lcd
	mov LCD_COMMAND_BUF,#040h
	lcall command_lcd
	mov LCD_COMMAND_BUF,#ROW_1  
	lcall command_lcd
	lcall clear_lcd
    lcall set_key_bus
ret
;-------------------------------------
command_lcd:
	setb LCD_CS1
	setb LCD_CS2
	clr LCD_RS
;	lcall short_delay
	mov p0,LCD_COMMAND_BUF
;	lcall short_delay
	lcall clock_lcd
;	lcall short_delay
	clr LCD_CS1
	clr LCD_CS2	
ret  
;-------------------------------------
clock_lcd:
    setb LCD_E
	nop
	nop
	nop
	clr LCD_E
	nop	
ret
                                                  
