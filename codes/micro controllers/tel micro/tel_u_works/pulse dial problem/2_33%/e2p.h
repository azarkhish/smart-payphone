;------------------------------------------------
;---------------eeprom functions-----------------
;------------------------------------------------
write_FF:
	push 00
	push 01
	mov KOUNT,#128

		lcall	start
		jc	fx38		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	fx37		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	shout		;
		jc	fx37		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	shout		;
		jc	fx37		; abort if no acknowledge

	fx36:

		mov	a, #0ffh	; get data
		lcall	shout		; send data
		jc	fx37		; abort if no acknowledge

		djnz	kount, fx36	; next byte
		clr	c		; clear error flag
	fx37:
		lcall	stop
	fx38:
pop 01
pop 00
ret
;------------------------------
write_block:
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

		lcall	start
		jc	x38		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	x37		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	shout		;
		jc	x37		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	shout		;
		jc	x37		; abort if no acknowledge

		mov	dptr, #00h;buffer	; point to buffer
	x36:

		movx	a, @dptr	; get data
		lcall	shout		; send data
		jc	x37		; abort if no acknowledge

		inc	dptr		; advance buffer pointer
		djnz	kount, x36	; next byte
		clr	c		; clear error flag
	x37:
		lcall	stop
	x38:
pop 01
pop 00
ret
;-----------------------------------------
write_page:
	
	x63:
		mov	a, #PADDR	; programmable address
		call	write_block	; try to write
		jnc	x64		; jump if write OK

		djnz	b, x63		; try again
	x64:
ret
;-----------------------------------------------------
fill_page:
	mov b,#15
	fxf63:
		mov	a, #PADDR	; programmable address
		call	write_FF	; try to write
		jnc	fxf64		; jump if write OK

		djnz	b, fxf63		; try again
	fxf64:

ret
;-----------------------------------------------------
read_page:
mov b,#150
	x72:
		mov	a, #PADDR	; programmable address
		call	read_block	; try to read
		jnc	x74		; jump if read OK

		djnz	b, x72		; try again
	x74:

ret
;---------------------------------------------------

read_block:
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

		call	start
		jc	x35		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		mov	index, a	; save copy of device address
		clr	acc.0		; specify write operation
		call	shout		; send device address
		jc	x34		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		call	shout		;
		jc	x34		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	shout		;
		jc	x34		; abort if no acknowledge

		; Send read command and receive data.

		call	start		; second start for read
		jc	x34		; abort if bus not available

		mov	a, index	; get device address
		setb	acc.0		; specify read operation
		call	shout		; send device address
		jc	x34		; abort if no acknowledge

	;	mov	dptr, #00h;buffer	; point to buffer
	x31:
		call	shin		; receive data byte
		movx	@dptr, a	; save data

		   mov r1,kount
		cjne	r1, #1, x32	; jump if not last byte
		call	NAK		; do not acknowledge last byte
		jmp	x33		; done
	x32:

	    call	ACKK
		inc	dptr		; advance buffer pointer
		djnz	kount, x31	; next byte
	x33:
		clr	c		; clear error flag
	x34:
		call	stop
	x35:
	pop 01
	pop 00
		ret
;--------------------------------------------
read_current:
		lcall set_e2p_bus
	; AT24Cxx Current Address Read function.
	; Called with programmable address in A. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		lcall	start
		jc	x45		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		setb	acc.0		; specify read operation
		lcall	shout		; send device address
		jc	x44		; abort if no acknowledge

		lcall	shin		; receive data byte
		lcall	NAK		; do not acknowledge byte
		clr	c		; clear error flag
	x44:
		lcall	stop
	x45:
		ret

;----------------------------
read_random:
	   lcall set_e2p_bus
	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.

		lcall	start
		jc	x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	x46		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	shout		;
		jc	x46		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	shout		;
		jc	x46		; abort if no acknowledge

		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	read_current
		jmp	x47		; exit
	x46:
		lcall	stop
	x47:
		pop	b
		ret
;----------------------------
;----------------------------
msg_read_random:
	   lcall set_e2p_bus
	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.

		lcall	start
		jc	msg_x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	msg_x46		; abort if no acknowledge

		mov	a, msg_addr_hi	; send high byte of address
		lcall	shout		;
		jc	msg_x46		; abort if no acknowledge

		mov	a, msg_addr_lo	; send low byte of address
		lcall	shout		;
		jc	msg_x46		; abort if no acknowledge

		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	read_current
		jmp	msg_x47		; exit
	msg_x46:
		lcall	stop
	msg_x47:
		pop	b
		ret
;----------------------------

start:

	; Send START, defined as high-to-low SDA with SCL high.
	; Return with SCL, SDA low.
	; Returns CY set if bus is not available.

		setb	SDA
		setb	SCL

		nop			; enforce hold delay
hh_7: jnb SCL,hh_7
		        	;
		nop			;
		nop
		; Verify bus available.

		jnb	SDA, x40	; jump if not high
		jnb	SCL, x40	; jump if not high

		nop			; enforce setup delay and cycle delay
		clr	SDA
		nop			; enforce hold delay
		nop			;
		nop			;
		nop			;
		nop			;
		clr	SCL

		clr	c		; clear error flag
		jmp	x41
	x40:
		setb	c		; set error flag
	x41:
		ret
;----------------------------
stop:

	; Send STOP, defined as low-to-high SDA with SCL high.
	; SCL expected low on entry. Return with SCL, SDA high.

		clr	SDA
		nop			; enforce SCL low and data setup
		nop
		setb	SCL
hh_1: jnb SCL,hh_1
		nop			; enforce setup delay
		nop			;
		nop			;
		nop			;
		;nop			;
		setb	SDA
		ret
;----------------------------
shout:

	; Shift out a byte to the AT24Cxx, most significant bit first.
	; SCL, SDA expected low on entry. Return with SCL low.
	; Called with data to send in A.
	; Returns CY set to indicate failure by slave to acknowledge.
	; Destroys A.

		push	b
		mov	b, #8		; bit counter
	x42:
		rlc	a		; move bit into CY
		mov	SDA, c		; output bit
        nop
        nop
        nop
		nop			; enforce SCL low and data setup
		setb	SCL		; raise clock
		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
hh_2: jnb SCL,hh_2
nop
nop
		clr	SCL		; drop clock
		djnz	b, x42		; next bit

		setb	SDA		; release SDA for ACK
		nop			; enforce SCL low and tAA
		nop			;
    	setb	SCL		; raise ACK clock
hh_3: jnb SCL,hh_3

		mov	c, SDA		; get ACK bit
		clr	SCL		; drop ACK clock
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
shin:

	; Shift in a byte from the AT24Cxx, most significant bit first.
	; SCL expected low on entry. Return with SCL low.
	; Returns received data byte in A.

		setb	SDA		; make SDA an input

		push	b
		mov	b, #8		; bit count
	x43:
		nop			; enforce SCL low and data setup
		nop			;
		nop			;
		setb	SCL		; raise clock
hh_6: jnb SCL,hh_6

;		nop			; enforce SCL high
;		nop			;
		mov	c, SDA		; input bit
		rlc	a		; move bit into byte
		clr	SCL		; drop clock
		djnz	b, x43		; next bit

		pop	b
		ret
;----------------------------
ACKK:

	; Clock out an acknowledge bit (low).
	; SCL expected low on entry. Return with SCL, SDA low.

		clr	SDA		; ACK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	SCL		; raise clock
hh_4: jnb SCL,hh_4

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	SCL		; drop clock
		ret
;----------------------------
NAK:

	; Clock out a negative acknowledge bit (high).
	; SCL expected low on entry. Return with SCL low, SDA high.

		setb	SDA		; NAK bit
		nop			; enforce SCL low and data setup
;		nop			;
		setb	SCL		; raise clock
hh_5: jnb SCL,hh_5

		nop			; enforce SCL high
		nop			;
		nop			;
		nop			;
		clr	SCL		; drop clock
		ret
;----------------------------
;----------------------------
write_to_e2p:
push b
mov b,#50 ;retry count
kyf_3:	
	lcall write_zdata
	jnc kyf_2
	djnz b,kyf_3
kyf_2:
pop b
ret
;----------------------------

;----------------------------
write_byte:
		lcall set_e2p_bus
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register ZDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	start
		jc	sx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	sx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	shout		;
		jc	sx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	shout		;
		jc	sx48		; abort if no acknowledge

		mov	a,zdata	; get data
		
		lcall	shout		; send data
		jc	sx48		; abort if no acknowledge

		clr	c		; clear error flag
	sx48:
		lcall	stop
	sx49:
		ret
;----------------------------
write_zdata:
		lcall set_e2p_bus
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		lcall	start
		jc	mx49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	shout		; send device address
		jc	mx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	shout		;
		jc	mx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	shout		;
		jc	mx48		; abort if no acknowledge

		mov	a,zdata	; get data
		lcall	shout		; send data
		jc	mx48		; abort if no acknowledge

		clr	c		; clear error flag
	mx48:
		lcall	stop
	mx49:
		ret
;-------------------------------------
;----------------------------
modem_write_byte:
	//	lcall set_e2p_bus
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.

		call	start
		jc	x49		; abort if bus not available
		mov a ,#PADDR
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		call	shout		; send device address
		jc	x48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		call	shout		;
		jc	x48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	shout		;
		jc	x48		; abort if no acknowledge

		movx	a,@dptr ;zdata	; get data
		call	shout		; send data
		jc	x48		; abort if no acknowledge

		clr	c		; clear error flag
	x48:
		call	stop
	x49:
		ret
;----------------------------

;---------------------------------------------------------------
save_to_e2p:

push b
kf_1:
	mov b,#15 ;retry count
kf_3:	
	lcall write_byte
	jnc kf_2
	djnz b,kf_3

kf_2:
pop b
ret

read_e2p_byte:
push 01
mov r1,#255
zewd_1:
		mov a,#PADDR
		lcall read_random
		jnc zewd_3         
		djnz r1,zewd_1
zewd_3:
pop 01
ret
;----------------------------------------------------
;----------------------------------------------------
read_char:
push 01
mov r1,#255
msg_zewd_1:
		mov a,#PADDR
		lcall msg_read_random
		jnc msg_zewd_3         
		djnz r1,msg_zewd_1
msg_zewd_3:
pop 01
ret
;----------------------------------------------------

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
read_internal_e2p:
push 02
push dpl
push dph
;/read a byte from internal e2p addressed in dptr and save in acc 
mov r2,#0ffh
wait_if_busy:
djnz r2,bgf1
jmp bgf2
bgf1:
mov a,0d2h
anl a,#1
jnz wait_if_busy
mov 0d2h,#2
movx a,@dptr
mov 0d2h,#00h
bgf2:
pop dph
pop dpl
pop 02
ret
;----------------------------
write_internal_e2p:
;/get zdata write at address dptr of internal e2p
push 02
push dpl
push dph
mov r2,#0ffh
wait_if_busy2:
lcall mid_delay 
djnz r2,bgh1
jmp bgh2
bgh1:
mov a,0d2h
anl a,#1
jnz wait_if_busy2
mov a,zdata
mov 0d2h,#2
movx @dptr,a
mov 0d2h,#00h
bgh2:
pop dph
pop dpl
pop 02
ret
                          
;---------------------------------------
jump_up_e2p:
push acc
push psw
clr c
mov a,addr_lo
subb a,#07bh
mov addr_lo,a
mov a,addr_hi
subb a,#015h
mov addr_hi,a
pop psw
pop acc
ret
;---------------------------------------
jump_down_e2p:
push acc
push psw
clr c
mov a,addr_lo
add a,#07bh
mov addr_lo,a
mov a,addr_hi
addc a,#015h
mov addr_hi,a
pop psw
pop acc
ret

