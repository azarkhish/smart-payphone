Maintenance_read_current:
	; AT24Cxx Current Address Read function.
	; Called with programmable address in A. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
 		lcall set_card_bus
		lcall	Maintenance_start
		jc	Maintenance_x45		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		setb	acc.0		; specify read operation
		lcall	Maintenance_shout		; send device address
		jc	Maintenance_x44		; abort if no acknowledge

		lcall	Maintenance_shin		; receive data byte
		lcall	Maintenance_NAK		; do not acknowledge byte
		clr	c		; clear error flag
	Maintenance_x44:
		lcall	Maintenance_stop
	Maintenance_x45:
		ret

;----------------------------
Maintenance_read_random:
	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
		lcall set_card_bus
		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.

		lcall	Maintenance_start
		jc	Maintenance_x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	Maintenance_shout		; send device address
		jc	Maintenance_x46		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	Maintenance_shout		;
		jc	Maintenance_x46		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	Maintenance_shout		;
		jc	Maintenance_x46		; abort if no acknowledge
		  
		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	Maintenance_read_current
		jmp	Maintenance_x47		; exit
	Maintenance_x46:
		lcall	Maintenance_stop
	Maintenance_x47:
		pop	b
		ret
;----------------------------
Maintenance_start:

	; Send START, defined as high-to-low SDA with SCL high.
	; Return with SCL, SDA low.
	; Returns CY set if bus is not available.

		setb	Maintenance_SDA
		setb	Maintenance_SCL

		nop			; enforce hold delay
Maintenance_hh_7: 
jnb Maintenance_SCL,Maintenance_hh_7
		        	;
		nop			;
		nop
		; Verify bus available.

		jnb	Maintenance_SDA, Maintenance_x40	; jump if not high
		jnb	Maintenance_SCL, Maintenance_x40	; jump if not high

		nop			; enforce setup delay and cycle delay
		clr	Maintenance_SDA
		nop			; enforce hold delay
		nop			;
		nop			;
		nop			;
		nop			;
		clr	Maintenance_SCL

		clr	c		; clear error flag
		jmp	Maintenance_x41
	Maintenance_x40:
		setb	c		; set error flag
	Maintenance_x41:
		ret
;----------------------------
Maintenance_stop:

	; Send STOP, defined as low-to-high SDA with SCL high.
	; SCL expected low on entry. Return with SCL, SDA high.

		clr	Maintenance_SDA
		nop			; enforce SCL low and data setup
		nop
		setb Maintenance_SCL
	Maintenance_hh_1: 
	jnb Maintenance_SCL,Maintenance_hh_1
		nop			; enforce setup delay
		nop			;
		nop			;
		nop			;
		;nop			;
		setb Maintenance_SDA
		ret
;----------------------------
Maintenance_shout:

	; Shift out a byte to the AT24Cxx, most significant bit first.
	; SCL, SDA expected low on entry. Return with SCL low.
	; Called with data to send in A.
	; Returns CY set to indicate failure by slave to acknowledge.
	; Destroys A.

		push	b
		mov	b, #8		; bit counter
	Maintenance_x42:
		rlc	a		; move bit into CY
		mov	Maintenance_SDA, c		; output bit
        nop
        nop
        nop
		nop			; enforce SCL low and data setup
        nop
        nop
        nop
		nop			; enforce SCL low and data setup

		setb Maintenance_SCL		; raise clock
        nop
        nop
        nop
		nop			; enforce SCL low and data setup
		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
	Maintenance_hh_2: 
	jnb Maintenance_SCL,Maintenance_hh_2
	nop
	nop
	nop
	nop
		clr	Maintenance_SCL		; drop clock
		djnz	b, Maintenance_x42		; next bit

		setb Maintenance_SDA		; release SDA for ACK
		nop			; enforce SCL low and tAA
		nop			;
		nop			; enforce SCL low and tAA
		nop			;

    	setb Maintenance_SCL		; raise ACK clock
Maintenance_hh_3:
jnb Maintenance_SCL,Maintenance_hh_3

		mov	c,Maintenance_SDA		; get ACK bit
		clr	Maintenance_SCL		; drop ACK clock
      	nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;

		pop	b
		ret
;----------------------------
Maintenance_shin:

	; Shift in a byte from the AT24Cxx, most significant bit first.
	; SCL expected low on entry. Return with SCL low.
	; Returns received data byte in A.

		setb Maintenance_SDA		; make SDA an input

		push	b
		mov	b, #8		; bit count
	Maintenance_x43:
		nop			; enforce SCL low and data setup
		nop			;
		nop			;
		setb Maintenance_SCL		; raise clock
Maintenance_hh_6:
 jnb Maintenance_SCL,Maintenance_hh_6

;		nop			; enforce SCL high
;		nop			;
		mov	c, Maintenance_SDA		; input bit
		rlc	a		; move bit into byte
		clr	Maintenance_SCL		; drop clock
		djnz	b, Maintenance_x43		; next bit

		pop	b
		ret
;----------------------------
Maintenance_ACKK:

	; Clock out an acknowledge bit (low).
	; SCL expected low on entry. Return with SCL, SDA low.

		clr	Maintenance_SDA		; ACK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb Maintenance_SCL		; raise clock
Maintenance_hh_4: 
jnb Maintenance_SCL,Maintenance_hh_4

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	Maintenance_SCL		; drop clock
		ret
;----------------------------
Maintenance_NAK:

	; Clock out a negative acknowledge bit (high).
	; SCL expected low on entry. Return with SCL low, SDA high.

		setb Maintenance_SDA		; NAK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb Maintenance_SCL		; raise clock
Maintenance_hh_5: 
jnb Maintenance_SCL,Maintenance_hh_5

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	Maintenance_SCL		; drop clock
		ret
;----------------------------
Maintenance_write_byte:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register ZDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.
		lcall set_card_bus
		lcall Maintenance_start
		jc	Maintenance_x49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall Maintenance_shout		; send device address
		jc	Maintenance_x48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall Maintenance_shout		;
		jc	Maintenance_x48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall Maintenance_shout		;
		jc	Maintenance_x48		; abort if no acknowledge

		mov	a,zdata	; get data
		
		lcall Maintenance_shout		; send data
		jc	Maintenance_x48		; abort if no acknowledge

		clr	c		; clear error flag
	Maintenance_x48:
		lcall	Maintenance_stop
	Maintenance_x49:
		ret
;----------------------------
Maintenance_save_to_e2p:

push b
Maintenance_kf_1:
	mov b,#255 ;retry count
Maintenance_kf_3:	
	lcall Maintenance_write_byte
	jnc Maintenance_kf_2
	djnz b,Maintenance_kf_3
Maintenance_kf_2:
pop b
ret
;----------------------------------------------------
Maintenance_read_e2p_byte:
push 01
mov r1,#255
Maintenance_wd_1:
		mov a,#PADDR
		lcall Maintenance_read_random
		jnc Maintenance_wd_3         
		djnz r1,Maintenance_wd_1

Maintenance_wd_3:
pop 01
ret
;-----------------------------------------------------
//download_from_maintenance:
//push dph
//push dpl
//;mov dptr,#1770h
//mov dph,#017h
//mov dpl,#070h
//wrrtf1:			
//mov addr_hi,dph
//mov addr_lo,dpl
//lcall Maintenance_read_e2p_byte
//mov zdata,a
//mov addr_hi,dph
//mov addr_lo,dpl
//lcall save_to_e2p
//inc dptr
//mov a,dph
//cjne a,#038h,wrrtf1
//mov a,dpl
//cjne a,#040h,wrrtf1
//
//pop dpl
//pop dph
//ret
;------------------------------------------
Maintenance_write_block:
	push 00
	push 01
	mov KOUNT,#128
	; Write from one byte to one page of data to an AT24Cxx.
	; Called with programmable address in A, address of first byte
	; in register pair ADDR_HI:ADDR_LO, data in BUFFER, byte count
	; in register KOUNT.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A, KOUNT, INDEX.

		lcall	Maintenance_start
		jc	Maintenance_x38		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	Maintenance_shout		; send device address
		jc	Maintenance_x37		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	Maintenance_shout		;
		jc	Maintenance_x37		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	Maintenance_shout		;
		jc	Maintenance_x37		; abort if no acknowledge

		mov	dptr, #00h;buffer	; point to buffer
	Maintenance_x36:

		;movx	a, @dptr	; get data
		mov a,#077h
		lcall	Maintenance_shout		; send data
		jc	Maintenance_x37		; abort if no acknowledge

		inc	dptr		; advance buffer pointer
		djnz	kount, Maintenance_x36	; next byte
		clr	c		; clear error flag
	Maintenance_x37:
		lcall	Maintenance_stop
	Maintenance_x38:
pop 01
pop 00
ret
;-----------------------------------------
Maintenance_write_page:
	mov b,#255
	Maintenance_x63:
		mov	a, #PADDR	; programmable address
		call	Maintenance_write_block	; try to write
		jnc	Maintenance_x64		; jump if write OK
		djnz	b, Maintenance_x63		; try again
	Maintenance_x64:
ret
;-----------------------------------------------------
Maintenance_read_page:
mov b,#255
	Maintenance_x72:
		mov	a, #PADDR	; programmable address
		call	Maintenance_read_block	; try to read
		jnc	Maintenance_x74		; jump if read OK

		djnz	b, Maintenance_x72		; try again
	Maintenance_x74:

ret
;---------------------------------------------------

Maintenance_read_block:
	  push 00
	  push 01
	  mov KOUNT,#128
	; Read from one byte to one page of data from an AT24Cxx.
	; Performs a Random Read which is extended into a Sequential Read
	; when more than one byte is read. Called with programmable address
	; in A, address of first byte in register pair ADDR_HI:ADDR_LO,
	; byte count in register KOUNT.
	; Returns data in BUFFER. Returns CY set to indicate that the bus is
	; not available or that the addressed device failed to acknowledge.
	; Destroys A, KOUNT, INDEX.

		; Send dummy write command to address first byte.

		call	Maintenance_start
		jc	Maintenance_x35		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		mov	index, a	; save copy of device address
		clr	acc.0		; specify write operation
		call	Maintenance_shout		; send device address
		jc	Maintenance_x34		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		call	Maintenance_shout		;
		jc	Maintenance_x34		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	Maintenance_shout		;
		jc	Maintenance_x34		; abort if no acknowledge

		; Send read command and receive data.

		call	Maintenance_start		; second start for read
		jc	Maintenance_x34		; abort if bus not available

		mov	a, index	; get device address
		setb	acc.0		; specify read operation
		call	Maintenance_shout		; send device address
		jc	Maintenance_x34		; abort if no acknowledge

		mov	dptr, #00h;buffer	; point to buffer
	Maintenance_x31:
		call	Maintenance_shin		; receive data byte
		movx	@dptr, a	; save data

		   mov r1,kount
		cjne	r1, #1, Maintenance_x32	; jump if not last byte
		call	NAK		; do not acknowledge last byte
		jmp	Maintenance_x33		; done
	Maintenance_x32:

	    call	ACKK
		inc	dptr		; advance buffer pointer
		djnz	kount, Maintenance_x31	; next byte
	Maintenance_x33:
		clr	c		; clear error flag
	Maintenance_x34:
		call	Maintenance_stop
	Maintenance_x35:
	pop 01
	pop 00
		ret
;------------------------------------------------
//download_from_maintenance2:
//push dph
//push dpl
//push 03
//mov addr_hi,#00h
//mov addr_lo,#00h
//
//mov r3,#80
//esur1: 
// lcall maintenance_read_page
//
//clr c
//mov a,addr_lo
//add a,#128
//mov addr_lo,a
//mov a,addr_hi
//addc a,#00h
//mov addr_hi,a
//
// djnz r3,esur1
//
//
//pop 03
//pop dpl
//pop dph
//
//ret
;-----------------------------
run_eep_update_with_progress_show:
clr ie.7
//////////////////////
	mov addr_hi,#0ffh
	mov addr_lo,#0f8h
	lcall Maintenance_read_e2p_byte
	cjne a,#0aah,next_0_run_eep_update
jmp some_error_run_eep_update
next_0_run_eep_update:
//////////////////////
	lcall clear_lcd
	lcall show_running
lcall show_progress_bar
	mov START_COL,#80
	mov START_ROW,#ROW_3
	mov r2,#06
	setb LCD_CS 


    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;================

mov dph,#017h
mov dpl,#070h
wrrtf1x:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_1_run_eep_update
	jmp some_error_run_eep_update
	///
next_1_run_eep_update:
mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_2_run_eep_update
	jmp some_error_run_eep_update
	///
next_2_run_eep_update:

inc dptr
mov a,dph
cjne a,#01ah,wrrtf1x
mov a,dpl		   
cjne a,#02ch,wrrtf1x


	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#01ah
mov dpl,#02ch

wrrtf2:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_3_run_eep_update
	jmp some_error_run_eep_update
	///
next_3_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_4_run_eep_update
	jmp some_error_run_eep_update
	///
next_4_run_eep_update:

inc dptr
mov a,dph
cjne a,#01ch,wrrtf2
mov a,dpl
cjne a,#0e8h,wrrtf2

	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#01ch
mov dpl,#0e8h

wrrtf3:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_5_run_eep_update
	jmp some_error_run_eep_update
	///
next_5_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_6_run_eep_update
	jmp some_error_run_eep_update
	///
next_6_run_eep_update:

inc dptr
mov a,dph
cjne a,#01fh,wrrtf3
mov a,dpl
cjne a,#0a4h,wrrtf3
 
	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#01fh
mov dpl,#0a4h

wrrtf4:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_7_run_eep_update
	jmp some_error_run_eep_update
	///
next_7_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_8_run_eep_update
	jmp some_error_run_eep_update
	///
next_8_run_eep_update:

inc dptr
mov a,dph
cjne a,#022h,wrrtf4
mov a,dpl
cjne a,#060h,wrrtf4

	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#022h
mov dpl,#060h

wrrtf5:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_9_run_eep_update
	jmp some_error_run_eep_update
	///
next_9_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_10_run_eep_update
	jmp some_error_run_eep_update
	///
next_10_run_eep_update:

inc dptr
mov a,dph
cjne a,#025h,wrrtf5
mov a,dpl
cjne a,#01ch,wrrtf5

	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#025h
mov dpl,#01ch

wrrtf6:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_11_run_eep_update
	jmp some_error_run_eep_update
	///
next_11_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_12_run_eep_update
	jmp some_error_run_eep_update
	///
next_12_run_eep_update:

inc dptr
mov a,dph
cjne a,#027h,wrrtf6
mov a,dpl
cjne a,#0d8h,wrrtf6


;=========================
	mov START_COL,#64
	mov START_ROW,#ROW_3
	mov r2,#06
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#027h
mov dpl,#0d8h

wrrtf7:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_13_run_eep_update
	jmp some_error_run_eep_update
	///
next_13_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_14_run_eep_update
	jmp some_error_run_eep_update
	///
next_14_run_eep_update:

inc dptr
mov a,dph
cjne a,#02ah,wrrtf7
mov a,dpl
cjne a,#094h,wrrtf7

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#02ah
mov dpl,#094h

wrrtf8:			
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_read_e2p_byte
	///
	jnc next_15_run_eep_update
	jmp some_error_run_eep_update
	///
next_15_run_eep_update:

mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall save_to_e2p
	///
	jnc next_16_run_eep_update
	jmp some_error_run_eep_update
	///
next_16_run_eep_update:

inc dptr
mov a,dph
cjne a,#02dh,wrrtf8
mov a,dpl
cjne a,#050h,wrrtf8

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	mov dph,#02dh
	mov dpl,#050h

wrrtf9:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_read_e2p_byte
		///
	jnc next_17_run_eep_update
	jmp some_error_run_eep_update
	///
next_17_run_eep_update:

	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall save_to_e2p
		///
	jnc next_18_run_eep_update
	jmp some_error_run_eep_update
	///
next_18_run_eep_update:

	inc dptr
	mov a,dph
	cjne a,#030h,wrrtf9
	mov a,dpl
	cjne a,#0ch,wrrtf9
;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#030h
mov dpl,#0ch

wrrtf10:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_read_e2p_byte
		///
	jnc next_19_run_eep_update
	jmp some_error_run_eep_update
	///
next_19_run_eep_update:

	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall save_to_e2p
		///
	jnc next_20_run_eep_update
	jmp some_error_run_eep_update
	///
next_20_run_eep_update:

	inc dptr
	mov a,dph
	cjne a,#032h,wrrtf10
	mov a,dpl
	cjne a,#0c8h,wrrtf10

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#032h
	mov dpl,#0c8h

wrrtf11:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_read_e2p_byte
			///
	jnc next_21_run_eep_update
	jmp some_error_run_eep_update
	///
next_21_run_eep_update:

	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall save_to_e2p
			///
	jnc next_22_run_eep_update
	jmp some_error_run_eep_update
	///
next_22_run_eep_update:

	inc dptr
	mov a,dph
	cjne a,#035h,wrrtf11
	mov a,dpl
	cjne a,#084h,wrrtf11

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#035h
	mov dpl,#084h

wrrtf12:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_read_e2p_byte
			///
	jnc next_23_run_eep_update
	jmp some_error_run_eep_update
	///
next_23_run_eep_update:

	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall save_to_e2p
			///
	jnc next_24_run_eep_update
	jmp some_error_run_eep_update
	///
next_24_run_eep_update:

	inc dptr
	mov a,dph
	cjne a,#038h,wrrtf12
	mov a,dpl
	cjne a,#058h,wrrtf12

jmp	end_run_eep_update

some_error_run_eep_update:
 lcall clear_lcd
 lcall show_some_error
 lcall delay1s
 lcall clear_lcd
 lcall bye3

end_run_eep_update:	
	 setb ie.7
ret
;-----------------------------
send_phone_setting_with_progress_show:
//	clr ie.7
//	lcall clear_lcd
//	lcall show_running
//	lcall show_progress_bar
//	mov START_COL,#80
//	mov START_ROW,#ROW_3
//	mov r2,#06
//	setb LCD_CS 
//
//
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	;================
//
//	mov dph,#017h
//	mov dpl,#070h
//setting_wrrtf1x:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#01ah,setting_wrrtf1x
//	mov a,dpl		   
//	cjne a,#02ch,setting_wrrtf1x
//
//
//	;================
//     mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
// 
// mov dph,#01ah
//mov dpl,#02ch
//
//setting_wrrtf2:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#01ch,setting_wrrtf2
//	mov a,dpl
//	cjne a,#0e8h,setting_wrrtf2
//
//	;================
//     mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
// 
// mov dph,#01ch
//mov dpl,#0e8h
//
//setting_wrrtf3:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#01fh,setting_wrrtf3
//	mov a,dpl
//	cjne a,#0a4h,setting_wrrtf3
// 
//	;================
//     mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
// 
// mov dph,#01fh
//mov dpl,#0a4h
//
//setting_wrrtf4:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#022h,setting_wrrtf4
//	mov a,dpl
//	cjne a,#060h,setting_wrrtf4
//
//	;================
//     mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
// 
// 	mov dph,#022h
//	mov dpl,#060h
//
//
//setting_wrrtf5:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#025h,setting_wrrtf5
//	mov a,dpl
//	cjne a,#01ch,setting_wrrtf5
//
//	;================
//     mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
// 
// 	mov dph,#025h
//	mov dpl,#01ch
//
//	setting_wrrtf6:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#027h,setting_wrrtf6
//	mov a,dpl
//	cjne a,#0d8h,setting_wrrtf6
//
////;{{{{{{{{{{{{{{{{{{{{{{[
//
//;=========================
//	mov START_COL,#64
//	mov START_ROW,#ROW_3
//	mov r2,#06
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#027h
//mov dpl,#0d8h
//
//setting_wrrtf7:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#02ah,setting_wrrtf7
//	mov a,dpl
//	cjne a,#094h,setting_wrrtf7
//
//;=========================
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#02ah
//	mov dpl,#094h
//
//setting_wrrtf8:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#02dh,setting_wrrtf8
//	mov a,dpl
//	cjne a,#050h,setting_wrrtf8
//
//;=========================
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#02dh
//	mov dpl,#050h
//
//setting_wrrtf9:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#030h,setting_wrrtf9
//	mov a,dpl
//	cjne a,#0ch,setting_wrrtf9
//;=========================
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#030h
//	mov dpl,#0ch
//
//setting_wrrtf10:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#032h,setting_wrrtf10
//	mov a,dpl
//	cjne a,#0c8h,setting_wrrtf10
//
//;=========================
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#032h
//mov dpl,#0c8h
//
//setting_wrrtf11:			
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall read_e2p_byte
//	mov zdata,a
//	mov addr_hi,dph
//	mov addr_lo,dpl
//	lcall Maintenance_save_to_e2p
//	inc dptr
//	mov a,dph
//	cjne a,#035h,setting_wrrtf11
//	mov a,dpl
//	cjne a,#084h,setting_wrrtf11
//
//;=========================
//	clr LCD_CS 
//  	 
//    mov TEXTURE_LENGTH,#08	
//	mov dptr,#bar
//   	lcall show_pattern 
//	
//	mov a,START_COL
//	add a,#08
//	mov START_COL,a
//	 mov dph,#035h
//mov dpl,#084h
//
//setting_wrrtf12:			
//mov addr_hi,dph
//mov addr_lo,dpl
//lcall read_e2p_byte
//mov zdata,a
//mov addr_hi,dph
//mov addr_lo,dpl
//lcall Maintenance_save_to_e2p
//inc dptr
//mov a,dph
//cjne a,#038h,setting_wrrtf12
//mov a,dpl
//cjne a,#050h,setting_wrrtf12
// setb ie.7
ret
;-----------------------------
send_reports_to_e2p_with_progress_show:
clr ie.7
	lcall clear_lcd
	lcall show_running
lcall show_progress_bar
	mov START_COL,#80
	mov START_ROW,#ROW_3
	mov r2,#06
	setb LCD_CS 


    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	;================

mov dph,#00h
mov dpl,#00h
report_wrrtf1x:			
mov addr_hi,dph
mov addr_lo,dpl
lcall read_e2p_byte
mov zdata,a
mov addr_hi,dph
mov addr_lo,dpl
lcall Maintenance_save_to_e2p
inc dptr
mov a,dph
cjne a,#01h,report_wrrtf1x
mov a,dpl		   
cjne a,#0f4h,report_wrrtf1x


	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 	mov dph,#01h
	mov dpl,#0f4h

report_wrrtf2:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#03h,report_wrrtf2
	mov a,dpl
	cjne a,#0e8h,report_wrrtf2
	
	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
	mov dph,#03h
	mov dpl,#0e8h

report_wrrtf3:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#05h,report_wrrtf3
	mov a,dpl
	cjne a,#0dch,report_wrrtf3
 
	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 	mov dph,#05h
	mov dpl,#0dch

report_wrrtf4:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#07h,report_wrrtf4
	mov a,dpl
	cjne a,#0d0h,report_wrrtf4

	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 	mov dph,#07h
	mov dpl,#0d0h

report_wrrtf5:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#09h,report_wrrtf5
	mov a,dpl
	cjne a,#0c4h,report_wrrtf5
	
	;================
     mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
 
 mov dph,#09h
mov dpl,#0c4h

report_wrrtf6:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#0bh,report_wrrtf6
	mov a,dpl
	cjne a,#0b8h,report_wrrtf6

//;{{{{{{{{{{{{{{{{{{{{{{[

;=========================
	mov START_COL,#64
	mov START_ROW,#ROW_3
	mov r2,#06
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#0bh
	mov dpl,#0b8h

report_wrrtf7:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#0dh,report_wrrtf7
	mov a,dpl
	cjne a,#0ach,report_wrrtf7
	
;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#0dh
	mov dpl,#0ach

report_wrrtf8:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#0fh,report_wrrtf8
	mov a,dpl
	cjne a,#0a0h,report_wrrtf8

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#0fh
	mov dpl,#0a0h

report_wrrtf9:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#011h,report_wrrtf9
	mov a,dpl
	cjne a,#094h,report_wrrtf9
;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#011h
	mov dpl,#094h

report_wrrtf10:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#013h,report_wrrtf10
	mov a,dpl
	cjne a,#088h,report_wrrtf10
	
;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#013h
	mov dpl,#088h

report_wrrtf11:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#015h,report_wrrtf11
	mov a,dpl
	cjne a,#07ch,report_wrrtf11

;=========================
	clr LCD_CS 
  	 
    mov TEXTURE_LENGTH,#08	
	mov dptr,#bar
   	lcall show_pattern 
	
	mov a,START_COL
	add a,#08
	mov START_COL,a
	 mov dph,#015h
	mov dpl,#07ch

report_wrrtf12:			
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall read_e2p_byte
	mov zdata,a
	mov addr_hi,dph
	mov addr_lo,dpl
	lcall Maintenance_save_to_e2p
	inc dptr
	mov a,dph
	cjne a,#017h,report_wrrtf12
	mov a,dpl
	cjne a,#070h,report_wrrtf12
	 setb ie.7
ret
;----------------------------
run_maintanence_routine:
		mov STATUS_FLAGS,#00h
	   mov KEYBOARD_SCANNER,#63 
	    mov DIALLED_COUNTER,#00h 
	;	clr kolang
	;setb READER_STATUS;;;
		clr FIRST_KEY
	lcall clear_lcd
	lcall show_enter_password

ret
;-------------------------------------
check_maintanence_password:
	mov addr_hi,#0ffh
	mov addr_lo,#0f4h
	lcall Maintenance_read_e2p_byte
	mov b,a
	mov r0,#030h
	mov a,@r0
	cjne a,b,fffff
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f5h
	lcall Maintenance_read_e2p_byte
	mov b,a
	mov r0,#031h
	mov a,@r0
	cjne a,b,fffff
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f6h
	lcall Maintenance_read_e2p_byte
	mov b,a
	mov r0,#032h
	mov a,@r0
	cjne a,b,fffff
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f7h
	lcall Maintenance_read_e2p_byte
	mov b,a
	mov r0,#033h
	mov a,@r0
	cjne a,b,fffff
	mov state,#maintanence_password_ok
	fffff:
ret
;----------------------------------
check_maintanence_card:
	;clr card_sw
	mov addr_hi,#0ffh
	mov addr_lo,#0f0h
	lcall Maintenance_read_e2p_byte
	cjne a,#10h,no_maintanence
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f1h
	lcall Maintenance_read_e2p_byte
	cjne a,#11h,no_maintanence
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f2h
	lcall Maintenance_read_e2p_byte
	cjne a,#12h,no_maintanence
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f3h
	lcall Maintenance_read_e2p_byte
	cjne a,#13h,no_maintanence
	
	yes_maintanence:
	  mov state,#maintanence_card_ok
	  jmp out_maintanence 
	no_maintanence:
	
	out_maintanence:
	;setb card_sw
ret
;-----------------------------
software_update:
	mov addr_hi,#0ffh
	mov addr_lo,#0f8h
	lcall Maintenance_read_e2p_byte
	cjne a,#0aah,out_software_update
	lcall load_program_to_isp_e2p
	;;
	 lcall reset_alarm_interrupt
	;;
	lcall boot_loader
	out_software_update:
ret
;----------------------------------------
load_program_to_isp_e2p:
	mov addr_hi,#00h
	mov addr_lo,#00h
	load_program_to_isp_e2p_loop:
	lcall Maintenance_read_e2p_byte
	///
	jc some_error_load_program_to_isp_e2p
	///
	mov zdata,a
	lcall isp_write_to_e2p
	///
	jc some_error_load_program_to_isp_e2p
	///
	lcall inc_e2p_counter
	mov a,addr_hi
	cjne a,#0ffh,load_program_to_isp_e2p_loop
	mov a,addr_lo
	cjne a,#0ffh,load_program_to_isp_e2p_loop
	
	////////////////////////
	mov addr_hi,#0ffh	  //
	mov addr_lo,#0f0h	  //
	mov zdata,#0aah		  //  update available 
	lcall isp_write_to_e2p//   
	////////////////////////	
	
	lcall reload_payphone_serial_to_isp_e2p
 
 jmp end_load_program_to_isp_e2p
 some_error_load_program_to_isp_e2p:
 lcall clear_lcd
 lcall show_some_error
 lcall delay1s
 lcall clear_lcd
 lcall bye3
end_load_program_to_isp_e2p:				  
ret					  

;----------------------------------------
initialize_eep:
	lcall refresh_report_map
ret
;--------------------------------------
manual_settings:
ret
;--------------------------------------
