#include <defenition.H>
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
	       ORG          0000H 
                     
	        LJMP          MAIN 
	       
		   ORG          003H  
			RETI 
			
			ORG 0BH
			RETI
			
			ORG          0013H 
			RETI
			
			ORG          01BH
			RETI

			ORG          02BH
			RETI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
org 100h	                              
MAIN:	
    ;----------------Preset----------------- 
 	 setb led1
	 setb led2

    blink_led1:
	setb led2
	 cpl led1
   lcall long_delay
   jb card_in,blink_led1
  
   clr led1
   	  lcall long_delay

		mov addr_hi,#017h     		
		mov addr_lo,#070h

read_next_byte:		
		lcall e2p_read_e2p_byte
		 mov zdata,a
		lcall card_write_to_e2p
		lcall inc_e2p_counter
		mov a,addr_hi
		cjne a,#039h,read_next_byte

		mov addr_hi,#0ffh     		
		mov addr_lo,#0f0h
		mov zdata,#10h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f1h
		mov zdata,#11h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f2h
		mov zdata,#12h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f3h
		mov zdata,#13h
		lcall card_write_to_e2p


		mov addr_hi,#0ffh     		
		mov addr_lo,#0f4h
		mov zdata,#01h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f5h
		mov zdata,#02h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f6h
		mov zdata,#03h
		lcall card_write_to_e2p
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f7h
		mov zdata,#04h
		lcall card_write_to_e2p

///////////////
		mov addr_hi,#0ffh     		
		mov addr_lo,#0f8h
		mov zdata,#00h
		lcall card_write_to_e2p

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   blink_led2:
   setb led1
   cpl led2
   lcall long_delay
   jnb card_in,blink_led2
   jmp blink_led1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
some_error:
setb led1
setb led2
blink_double:
   cpl led1
   cpl led2
   lcall long_delay
   jnb card_in,blink_double
   jmp blink_led1

;-------------------------------------
long_delay:
    mov r3,#0ffh
 long2: 
	mov r2,#0ffh
 long1: 
	nop
	nop
	nop
	djnz r2,long1
	nop
	nop
	nop
	djnz r3,long2
    ret   
;-------------------------------------    
;------------------------------------------------
;---------------card eeprom functions-----------------
;------------------------------------------------
;------------------------------
;----------------------------------------------------
card_read_e2p_byte:
push 01
mov r1,#255
card_zewd_1:
		mov a,#PADDR
		lcall card_read_random
		jnc card_zewd_3         
		djnz r1,card_zewd_1
 pop 01
 jmp some_error
card_zewd_3:
pop 01
ret
;----------------------------------------------------

card_write_block:
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

		lcall	card_start
		jc	card_x38		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	card_shout		; send device address
		jc	card_x37		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	card_shout		;
		jc	card_x37		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	card_shout		;
		jc	card_x37		; abort if no acknowledge

		mov	dptr, #00h;buffer	; point to buffer
	card_x36:

		movx	a, @dptr	; get data
		lcall	card_shout		; send data
		jc	card_x37		; abort if no acknowledge

		inc	dptr		; advance buffer pointer
		djnz	kount, card_x36	; next byte
		clr	c		; clear error flag
	card_x37:
		lcall	card_stop
	card_x38:
pop 01
pop 00
ret
;-----------------------------------------
card_write_page:
	
	card_x63:
		mov	a, #PADDR	; programmable address
		call	card_write_block	; try to write
		jnc	card_x64		; jump if write OK

		djnz	b, card_x63		; try again
	card_x64:
ret
;-----------------------------------------------------
card_read_page:
mov b,#150
	card_x72:
		mov	a, #PADDR	; programmable address
		call	card_read_block	; try to read
		jnc	card_x74		; jump if read OK

		djnz	b, card_x72		; try again
	card_x74:

ret
;---------------------------------------------------

card_read_block:
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

		call	card_start
		jc	card_x35		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		mov	index, a	; save copy of device address
		clr	acc.0		; specify write operation
		call	card_shout		; send device address
		jc	card_x34		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		call	card_shout		;
		jc	card_x34		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	card_shout		;
		jc	card_x34		; abort if no acknowledge

		; Send read command and receive data.

		call	card_start		; second start for read
		jc	card_x34		; abort if bus not available

		mov	a, index	; get device address
		setb	acc.0		; specify read operation
		call	card_shout		; send device address
		jc	card_x34		; abort if no acknowledge

	;	mov	dptr, #00h;buffer	; point to buffer
	card_x31:
		call	card_shin		; receive data byte
		movx	@dptr, a	; save data

		   mov r1,kount
		cjne	r1, #1, card_x32	; jump if not last byte
		call	card_NAK		; do not acknowledge last byte
		jmp	card_x33		; done
	card_x32:

	    call	card_ACKK
		inc	dptr		; advance buffer pointer
		djnz	kount, card_x31	; next byte
	card_x33:
		clr	c		; clear error flag
	card_x34:
		call	card_stop
	card_x35:
	pop 01
	pop 00
		ret
;--------------------------------------------
card_read_current:
	; AT24Cxx Current Address Read function.
	; Called with programmable address in A. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		lcall	card_start
		jc	card_x45		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		setb	acc.0		; specify read operation
		lcall	card_shout		; send device address
		jc	card_x44		; abort if no acknowledge

		lcall	card_shin		; receive data byte
		lcall	card_NAK		; do not acknowledge byte
		clr	c		; clear error flag
	card_x44:
		lcall	card_stop
	card_x45:
		ret

;----------------------------
card_read_random:
	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.

		lcall	card_start
		jc	card_x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	card_shout		; send device address
		jc	card_x46		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	card_shout		;
		jc	card_x46		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	card_shout		;
		jc	card_x46		; abort if no acknowledge

		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	card_read_current
		jmp	card_x47		; exit
	card_x46:
		lcall	card_stop
	card_x47:
		pop	b
		ret
;----------------------------
;----------------------------

card_start:

	; Send START, defined as high-to-low SDA with SCL high.
	; Return with SCL, SDA low.
	; Returns CY set if bus is not available.

		setb	card_SDA
		setb	card_SCL

		nop			; enforce hold delay
card_hh_7: jnb card_SCL,card_hh_7
		        	;
		nop			;
		nop
		; Verify bus available.

		jnb	card_SDA, card_x40	; jump if not high
		jnb	card_SCL, card_x40	; jump if not high

		nop			; enforce setup delay and cycle delay
		clr	card_SDA
		nop			; enforce hold delay
		nop			;
		nop			;
		nop			;
		nop			;
		clr	card_SCL

		clr	c		; clear error flag
		jmp	card_x41
	card_x40:
		setb	c		; set error flag
	card_x41:
		ret
;----------------------------
card_stop:

	; Send STOP, defined as low-to-high SDA with SCL high.
	; SCL expected low on entry. Return with SCL, SDA high.

		clr	card_SDA
		nop			; enforce SCL low and data setup
		nop
		setb	card_SCL
card_hh_1: jnb card_SCL,card_hh_1
		nop			; enforce setup delay
		nop			;
		nop			;
		nop			;
		;nop			;
		setb	card_SDA
		ret
;----------------------------
card_shout:

	; Shift out a byte to the AT24Cxx, most significant bit first.
	; SCL, SDA expected low on entry. Return with SCL low.
	; Called with data to send in A.
	; Returns CY set to indicate failure by slave to acknowledge.
	; Destroys A.

		push	b
		mov	b, #8		; bit counter
	card_x42:
		rlc	a		; move bit into CY
		mov	card_SDA, c		; output bit
        nop
        nop
        nop
		nop			; enforce SCL low and data setup
		setb	card_SCL		; raise clock
		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
card_hh_2: jnb card_SCL,card_hh_2
nop
nop
		clr	card_SCL		; drop clock
		djnz	b, card_x42		; next bit

		setb	card_SDA		; release SDA for ACK
		nop			; enforce SCL low and tAA
		nop			;
    	setb	card_SCL		; raise ACK clock
card_hh_3: jnb card_SCL,card_hh_3

		mov	c, card_SDA		; get ACK bit
		clr	card_SCL		; drop ACK clock
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
card_shin:

	; Shift in a byte from the AT24Cxx, most significant bit first.
	; SCL expected low on entry. Return with SCL low.
	; Returns received data byte in A.

		setb	card_SDA		; make SDA an input

		push	b
		mov	b, #8		; bit count
	card_x43:
		nop			; enforce SCL low and data setup
		nop			;
		nop			;
		setb	card_SCL		; raise clock
card_hh_6: jnb card_SCL,card_hh_6

;		nop			; enforce SCL high
;		nop			;
		mov	c, card_SDA		; input bit
		rlc	a		; move bit into byte
		clr	card_SCL		; drop clock
		djnz	b, card_x43		; next bit

		pop	b
		ret
;----------------------------
card_ACKK:

	; Clock out an acknowledge bit (low).
	; SCL expected low on entry. Return with SCL, SDA low.

		clr	card_SDA		; ACK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	card_SCL		; raise clock
card_hh_4: jnb card_SCL,card_hh_4

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	card_SCL		; drop clock
		ret
;----------------------------
card_NAK:

	; Clock out a negative acknowledge bit (high).
	; SCL expected low on entry. Return with SCL low, SDA high.

		setb	card_SDA		; NAK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	card_SCL		; raise clock
card_hh_5: jnb card_SCL,card_hh_5

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	card_SCL		; drop clock
		ret
;----------------------------
;----------------------------
card_write_to_e2p:
push b
mov b,#255 ;retry count
card_kyf_3:	
	lcall card_write_zdata
	jnc card_kyf_2
	djnz b,card_kyf_3
pop b
jmp some_error
card_kyf_2:
pop b
ret
;----------------------------

;----------------------------
card_write_byte:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register ZDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	card_start
		jc	card_sx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	card_shout		; send device address
		jc	card_sx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	card_shout		;
		jc	card_sx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	card_shout		;
		jc	card_sx48		; abort if no acknowledge

		mov	a,zdata	; get data
		
		lcall	card_shout		; send data
		jc	card_sx48		; abort if no acknowledge

		clr	c		; clear error flag
	card_sx48:
		lcall	card_stop
	card_sx49:
		ret
;----------------------------
card_write_zdata:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	card_start
		jc	card_mx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	card_shout		; send device address
		jc	card_mx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	card_shout		;
		jc	card_mx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	card_shout		;
		jc	card_mx48		; abort if no acknowledge

		mov	a,zdata	; get data
		lcall	card_shout		; send data
		jc	card_mx48		; abort if no acknowledge

		clr	c		; clear error flag
	card_mx48:
		lcall	card_stop
	card_mx49:
		ret
;-------------------------------------
;----------------------------
;---------------------------------------------------------------
card_save_to_e2p:

push b
card_kf_1:
	mov b,#255 ;retry count
card_kf_3:	
	lcall card_write_byte
	jnc card_kf_2
	djnz b,card_kf_3
pop b
jmp some_error
card_kf_2:
pop b
ret

;------------------------------------------------
;---------------main e2p eeprom functions-----------------
;------------------------------------------------
;------------------------------
;----------------------------------------------------
e2p_read_e2p_byte:
push 01
mov r1,#255
e2p_zewd_1:
		mov a,#PADDR
		lcall e2p_read_random
		jnc e2p_zewd_3         
		djnz r1,e2p_zewd_1
pop 01
jmp some_error
e2p_zewd_3:
pop 01
ret
;----------------------------------------------------

e2p_write_block:
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

		lcall	e2p_start
		jc	e2p_x38		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	e2p_shout		; send device address
		jc	e2p_x37		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	e2p_shout		;
		jc	e2p_x37		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	e2p_shout		;
		jc	e2p_x37		; abort if no acknowledge

		mov	dptr, #00h;buffer	; point to buffer
	e2p_x36:

		movx	a, @dptr	; get data
		lcall	e2p_shout		; send data
		jc	e2p_x37		; abort if no acknowledge

		inc	dptr		; advance buffer pointer
		djnz	kount, e2p_x36	; next byte
		clr	c		; clear error flag
	e2p_x37:
		lcall	e2p_stop
	e2p_x38:
pop 01
pop 00
ret
;-----------------------------------------
e2p_write_page:
	
	e2p_x63:
		mov	a, #PADDR	; programmable address
		call	e2p_write_block	; try to write
		jnc	e2p_x64		; jump if write OK

		djnz	b, e2p_x63		; try again
	e2p_x64:
ret
;-----------------------------------------------------
e2p_read_page:
mov b,#150
	e2p_x72:
		mov	a, #PADDR	; programmable address
		call	e2p_read_block	; try to read
		jnc	e2p_x74		; jump if read OK

		djnz	b, e2p_x72		; try again
	e2p_x74:

ret
;---------------------------------------------------

e2p_read_block:
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

		call	e2p_start
		jc	e2p_x35		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		mov	index, a	; save copy of device address
		clr	acc.0		; specify write operation
		call	e2p_shout		; send device address
		jc	e2p_x34		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		call	e2p_shout		;
		jc	e2p_x34		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	e2p_shout		;
		jc	e2p_x34		; abort if no acknowledge

		; Send read command and receive data.

		call	e2p_start		; second start for read
		jc	e2p_x34		; abort if bus not available

		mov	a, index	; get device address
		setb	acc.0		; specify read operation
		call	e2p_shout		; send device address
		jc	e2p_x34		; abort if no acknowledge

	;	mov	dptr, #00h;buffer	; point to buffer
	e2p_x31:
		call	e2p_shin		; receive data byte
		movx	@dptr, a	; save data

		   mov r1,kount
		cjne	r1, #1, e2p_x32	; jump if not last byte
		call	e2p_NAK		; do not acknowledge last byte
		jmp	e2p_x33		; done
	e2p_x32:

	    call	e2p_ACKK
		inc	dptr		; advance buffer pointer
		djnz	kount, e2p_x31	; next byte
	e2p_x33:
		clr	c		; clear error flag
	e2p_x34:
		call	e2p_stop
	e2p_x35:
	pop 01
	pop 00
		ret
;--------------------------------------------
e2p_read_current:
	; AT24Cxx Current Address Read function.
	; Called with programmable address in A. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		lcall	e2p_start
		jc	e2p_x45		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		setb	acc.0		; specify read operation
		lcall	e2p_shout		; send device address
		jc	e2p_x44		; abort if no acknowledge

		lcall	e2p_shin		; receive data byte
		lcall	e2p_NAK		; do not acknowledge byte
		clr	c		; clear error flag
	e2p_x44:
		lcall	e2p_stop
	e2p_x45:
		ret

;----------------------------
e2p_read_random:
	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.

		lcall	e2p_start
		jc	e2p_x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	e2p_shout		; send device address
		jc	e2p_x46		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	e2p_shout		;
		jc	e2p_x46		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	e2p_shout		;
		jc	e2p_x46		; abort if no acknowledge

		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	e2p_read_current
		jmp	e2p_x47		; exit
	e2p_x46:
		lcall	e2p_stop
	e2p_x47:
		pop	b
		ret
;----------------------------
;----------------------------

e2p_start:

	; Send START, defined as high-to-low SDA with SCL high.
	; Return with SCL, SDA low.
	; Returns CY set if bus is not available.

		setb	e2p_SDA
		setb	e2p_SCL

		nop			; enforce hold delay
e2p_hh_7: jnb e2p_SCL,e2p_hh_7
		        	;
		nop			;
		nop
		; Verify bus available.

		jnb	e2p_SDA, e2p_x40	; jump if not high
		jnb	e2p_SCL, e2p_x40	; jump if not high

		nop			; enforce setup delay and cycle delay
		clr	e2p_SDA
		nop			; enforce hold delay
		nop			;
		nop			;
		nop			;
		nop			;
		clr	e2p_SCL

		clr	c		; clear error flag
		jmp	e2p_x41
	e2p_x40:
		setb	c		; set error flag
	e2p_x41:
		ret
;----------------------------
e2p_stop:

	; Send STOP, defined as low-to-high SDA with SCL high.
	; SCL expected low on entry. Return with SCL, SDA high.

		clr	e2p_SDA
		nop			; enforce SCL low and data setup
		nop
		setb	e2p_SCL
e2p_hh_1: jnb e2p_SCL,e2p_hh_1
		nop			; enforce setup delay
		nop			;
		nop			;
		nop			;
		;nop			;
		setb	e2p_SDA
		ret
;----------------------------
e2p_shout:

	; Shift out a byte to the AT24Cxx, most significant bit first.
	; SCL, SDA expected low on entry. Return with SCL low.
	; Called with data to send in A.
	; Returns CY set to indicate failure by slave to acknowledge.
	; Destroys A.

		push	b
		mov	b, #8		; bit counter
	e2p_x42:
		rlc	a		; move bit into CY
		mov	e2p_SDA, c		; output bit
        nop
        nop
        nop
		nop			; enforce SCL low and data setup
		setb	e2p_SCL		; raise clock
		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
e2p_hh_2: jnb e2p_SCL,e2p_hh_2
nop
nop
		clr	e2p_SCL		; drop clock
		djnz	b, e2p_x42		; next bit

		setb	e2p_SDA		; release SDA for ACK
		nop			; enforce SCL low and tAA
		nop			;
    	setb	e2p_SCL		; raise ACK clock
e2p_hh_3: jnb e2p_SCL,e2p_hh_3

		mov	c, e2p_SDA		; get ACK bit
		clr	e2p_SCL		; drop ACK clock
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
e2p_shin:

	; Shift in a byte from the AT24Cxx, most significant bit first.
	; SCL expected low on entry. Return with SCL low.
	; Returns received data byte in A.

		setb	e2p_SDA		; make SDA an input

		push	b
		mov	b, #8		; bit count
	e2p_x43:
		nop			; enforce SCL low and data setup
		nop			;
		nop			;
		setb	e2p_SCL		; raise clock
e2p_hh_6: jnb e2p_SCL,e2p_hh_6

;		nop			; enforce SCL high
;		nop			;
		mov	c, e2p_SDA		; input bit
		rlc	a		; move bit into byte
		clr	e2p_SCL		; drop clock
		djnz	b, e2p_x43		; next bit

		pop	b
		ret
;----------------------------
e2p_ACKK:

	; Clock out an acknowledge bit (low).
	; SCL expected low on entry. Return with SCL, SDA low.

		clr	e2p_SDA		; ACK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	e2p_SCL		; raise clock
e2p_hh_4: jnb e2p_SCL,e2p_hh_4

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	e2p_SCL		; drop clock
		ret
;----------------------------
e2p_NAK:

	; Clock out a negative acknowledge bit (high).
	; SCL expected low on entry. Return with SCL low, SDA high.

		setb	e2p_SDA		; NAK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	e2p_SCL		; raise clock
e2p_hh_5: jnb e2p_SCL,e2p_hh_5

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	e2p_SCL		; drop clock
		ret
;----------------------------
;----------------------------
e2p_write_to_e2p:
push b
mov b,#255 ;retry count
e2p_kyf_3:	
	lcall e2p_write_zdata
	jnc e2p_kyf_2
	djnz b,e2p_kyf_3
pop b
jmp some_error
e2p_kyf_2:
pop b
ret
;----------------------------

;----------------------------
e2p_write_byte:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register ZDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	e2p_start
		jc	e2p_sx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	e2p_shout		; send device address
		jc	e2p_sx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	e2p_shout		;
		jc	e2p_sx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	e2p_shout		;
		jc	e2p_sx48		; abort if no acknowledge

		mov	a,zdata	; get data
		
		lcall	e2p_shout		; send data
		jc	e2p_sx48		; abort if no acknowledge

		clr	c		; clear error flag
	e2p_sx48:
		lcall	e2p_stop
	e2p_sx49:
		ret
;----------------------------
e2p_write_zdata:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	e2p_start
		jc	e2p_mx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	e2p_shout		; send device address
		jc	e2p_mx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	e2p_shout		;
		jc	e2p_mx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	e2p_shout		;
		jc	e2p_mx48		; abort if no acknowledge

		mov	a,zdata	; get data
		lcall	e2p_shout		; send data
		jc	e2p_mx48		; abort if no acknowledge

		clr	c		; clear error flag
	e2p_mx48:
		lcall	e2p_stop
	e2p_mx49:
		ret
;-------------------------------------
;----------------------------
;---------------------------------------------------------------
e2p_save_to_e2p:

push b
e2p_kf_1:
	mov b,#255 ;retry count
e2p_kf_3:	
	lcall e2p_write_byte
	jnc e2p_kf_2
	djnz b,e2p_kf_3
pop b
jmp some_error
e2p_kf_2:
pop b
ret

;----------------------------
inc_e2p_counter:
	push dpl
	push dph
	mov dpl,addr_lo
	mov dph,addr_hi
	inc dptr
	mov addr_hi,dph
	mov addr_lo,dpl
	pop dph
	pop dpl
ret
;----------------------------

END