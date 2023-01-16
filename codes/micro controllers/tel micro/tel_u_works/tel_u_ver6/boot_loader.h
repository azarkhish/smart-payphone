;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;In System Programmer (Boot Loader Session);
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 0f000h
boot_loader:
mov ie,#00h
	
	mov addr_hi,#0ffh
	mov addr_lo,#0f0h
lcall isp_read_e2p_byte
   cjne a,#0aah,out_boot_loader

	mov addr_hi,#00h
	mov addr_lo,#00h
 
 /////////////////////////
     mov r1,#05h		//
 mov a,#00h	   			//
 mov AUXR1,#00100001b	//
 mov dptr,#00h	 ;dptr1	//
 mov AUXR1,#00100000b	//	unlock_rw_protection
 mov dptr,#010h	 ;dptr0	//
						//
 mov AUXR1,#00100000b	//
 lcall run_api_command	//
 mov AUXR1,#00h			//
   ///////////////////////
   mov dptr,#00h 
 hjsx1:	
 ;
   lcall isp_load_e2p_to_xram
   lcall write_flash_page
    mov a,dph
  	clr c
	subb a,#0f0h
	jc hjsx1

//////////////////////////
  mov r1,#05h			 //
 mov a,#00h	   			 //
 mov AUXR1,#00100001b	 //
 mov dptr,#00h	 ;dptr1	 //
 mov AUXR1,#00100000b	 //	  lock_rw_protection
 mov dptr,#01h	 ;dptr0	 //
						 //
 mov AUXR1,#00100000b	 //
 lcall run_api_command	 //
 mov AUXR1,#00h			 //
///////////////////////////

out_boot_loader:
mov addr_hi,#0ffh
mov addr_lo,#0f0h
mov zdata,#00h
lcall isp_write_to_e2p

	lcall isp_bye
 jmp $
;--------------------------

 write_bsb:
 mov r1,#06h
 mov a,#5	   
 mov AUXR1,#00100000b
 mov dptr,#00h
 mov AUXR1,#00100000b
 lcall run_api_command
 mov AUXR1,#00h
 ret 
 ;--------------------
// unlock_rw_protection:
//  mov r1,#05h
// mov a,#00h	   
// mov AUXR1,#00100001b
// mov dptr,#00h	 ;dptr1
// mov AUXR1,#00100000b
// mov dptr,#010h	 ;dptr0
//
// mov AUXR1,#00100000b
// lcall run_api_command
// mov AUXR1,#00h
//
// ret
// ;--------------------
//lock_rw_protection:
//  mov r1,#05h
// mov a,#00h	   
// mov AUXR1,#00100001b
// mov dptr,#00h	 ;dptr1
// mov AUXR1,#00100000b
// mov dptr,#01h	 ;dptr0
//
// mov AUXR1,#00100000b
// lcall run_api_command
// mov AUXR1,#00h
//
// ret
 ;--------------------
write_flash_byte:
 mov r1,#02h
 mov AUXR1,#00100000b
 lcall run_api_command
 mov AUXR1,#00h
ret
 ;--------------------
 write_flash_page:
 mov r1,#09h
 mov a,#128

  mov AUXR1,#00100001b
  mov dptr,#00h	  ;to select dptr1

 mov AUXR1,#00100000b
 lcall run_api_command
 mov AUXR1,#00h

 ret
 ;--------------------
 write_sbv:
 ret
 ;--------------------
 run_api_command:
 lcall 0fff0h
 ret
 ;-------------------- 
 isp_read_current:
	; AT24Cxx Current Address Read function.
	; Called with programmable address in A. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
			lcall isp_set_e2p_bus
		lcall	isp_start
		jc	isp_x45		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		setb	acc.0		; specify read operation
		lcall	isp_shout		; send device address
		jc	isp_x44		; abort if no acknowledge

		lcall	isp_shin		; receive data byte
		lcall	isp_NAK		; do not acknowledge byte
		clr	c		; clear error flag
	isp_x44:
		lcall	isp_stop

	isp_x45: 
		ret

;----------------------------
isp_read_random:

	; AT24Cxx Random Read function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO. Returns data in A.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.

		push	b
		mov	b, a		; save copy of programmable address

		; Send dummy write command to set internal address.
			lcall isp_set_e2p_bus
		lcall	isp_start
		jc	isp_x47		; abort if bus not available

		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	isp_shout		; send device address
		jc	isp_x46		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	isp_shout		;
		jc	isp_x46		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	isp_shout		;
		jc	isp_x46		; abort if no acknowledge

		; Call Current Address Read function.

		mov	a, b		; get programmable address
		lcall	isp_read_current
		jmp	isp_x47		; exit
	isp_x46:
		lcall	isp_stop
	isp_x47:
		pop	b
		ret
;----------------------------
isp_start:

	; Send START, defined as high-to-low sda with scl high.
	; Return with scl, sda low.
	; Returns CY set if bus is not available.

		setb	sda
		setb	scl

		nop			; enforce hold delay
isp_hh_7: jnb scl,isp_hh_7
		        	;
		nop			;
		nop
		; Verify bus available.

		jnb	sda, isp_x40	; jump if not high
		jnb	scl, isp_x40	; jump if not high

		nop			; enforce setup delay and cycle delay
		clr	sda
		nop			; enforce hold delay
		nop			;
		nop			;
		nop			;
		nop			;
		clr	scl

		clr	c		; clear error flag
		jmp	isp_x41
	isp_x40:
		setb	c		; set error flag
	isp_x41:
		ret
;----------------------------
isp_stop:

	; Send STOP, defined as low-to-high sda with scl high.
	; scl expected low on entry. Return with scl, sda high.

		clr	sda
		nop			; enforce scl low and data setup
		nop
		setb	scl
isp_hh_1: jnb scl,isp_hh_1
		nop			; enforce setup delay
		nop			;
		nop			;
		nop			;
		;nop			;
		setb	sda
		ret
;----------------------------
isp_shout:

	; Shift out a byte to the AT24Cxx, most significant bit first.
	; scl, sda expected low on entry. Return with scl low.
	; Called with data to send in A.
	; Returns CY set to indicate failure by slave to acknowledge.
	; Destroys A.

		push	b
		mov	b, #8		; bit counter
	isp_x42:
		rlc	a		; move bit into CY
		mov	sda, c		; output bit
        nop
        nop
        nop
		nop			; enforce scl low and data setup
		setb	scl		; raise clock
		nop			; enforce scl high
		nop			;
		nop			;
		nop			;
isp_hh_2: jnb scl,isp_hh_2
nop
nop
		clr	scl		; drop clock
		djnz	b, isp_x42		; next bit

		setb	sda		; release sda for ACK
		nop			; enforce scl low and tAA
		nop			;
    	setb	scl		; raise ACK clock
isp_hh_3: jnb scl,isp_hh_3

		mov	c, sda		; get ACK bit
		clr	scl		; drop ACK clock
      		nop			; enforce scl high
		nop			;
		nop			;
		nop			;
		nop			; enforce scl high
		nop			;
		nop			;
		nop			;

		pop	b
		ret
;----------------------------
isp_shin:

	; Shift in a byte from the AT24Cxx, most significant bit first.
	; scl expected low on entry. Return with scl low.
	; Returns received data byte in A.

		setb	sda		; make sda an input

		push	b
		mov	b, #8		; bit count
	isp_x43:
		nop			; enforce scl low and data setup
		nop			;
		nop			;
		setb	scl		; raise clock
isp_hh_6: jnb scl,isp_hh_6

;		nop			; enforce scl high
;		nop			;
		mov	c, sda		; input bit
		rlc	a		; move bit into byte
		clr	scl		; drop clock
		djnz	b, isp_x43		; next bit

		pop	b
		ret
;----------------------------
isp_ACKK:

	; Clock out an acknowledge bit (low).
	; scl expected low on entry. Return with scl, sda low.

		clr	sda		; ACK bit
		nop			; enforce scl low and data setup
;		nop			;
		setb	scl		; raise clock
isp_hh_4: jnb scl,isp_hh_4

		nop			; enforce scl high
		nop			;
		nop			;
		nop			;
		clr	scl		; drop clock
		ret
;----------------------------
isp_NAK:

	; Clock out a negative acknowledge bit (high).
	; scl expected low on entry. Return with scl low, sda high.

		setb	sda		; NAK bit
		nop			; enforce scl low and data setup
;		nop			;
		setb	scl		; raise clock
isp_hh_5: jnb scl,isp_hh_5

		nop			; enforce scl high
		nop			;
		nop			;
		nop			;
		clr	scl		; drop clock
		ret
;----------------------------
isp_write_byte:
	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.
		lcall isp_set_e2p_bus
		lcall	isp_start
		jc	isp_x49		; abort if bus not available
		mov a ,#PADDR2
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	isp_shout		; send device address
		jc	isp_x48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	isp_shout		;
		jc	isp_x48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		call	isp_shout		;
		jc	isp_x48		; abort if no acknowledge

		movx	a,@dptr ;zdata	; get data
		lcall	isp_shout		; send data
		jc	isp_x48		; abort if no acknowledge

		clr	c		; clear error flag
	isp_x48:
		lcall	isp_stop
	isp_x49:
		ret
;----------------------------
isp_write_zdata:

	; AT24Cxx Byte Write function.
	; Called with programmable address in A, byte address in
	; register pair ADDR_HI:ADDR_LO, data in register XDATA.
	; Does not wait for write cycle to complete.
	; Returns CY set to indicate that the bus is not available
	; or that the addressed device failed to acknowledge.
	; Destroys A.
		lcall isp_set_e2p_bus
	
		lcall	isp_start
		jc	isp_mx49		; abort if bus not available
		mov a ,#PADDR2
		rl	a		; programmable address to bits 3:1
		orl	a, #FADDR	; add fixed address
		clr	acc.0		; specify write operation
		lcall	isp_shout		; send device address
		jc	isp_mx48		; abort if no acknowledge

		mov	a, addr_hi	; send high byte of address
		lcall	isp_shout		;
		jc	isp_mx48		; abort if no acknowledge

		mov	a, addr_lo	; send low byte of address
		lcall	isp_shout		;
		jc	isp_mx48		; abort if no acknowledge

		mov	a,zdata	; get data
		lcall	isp_shout		; send data
		jc	isp_mx48		; abort if no acknowledge

		clr	c		; clear error flag
	isp_mx48:
		lcall	isp_stop
	isp_mx49:
		ret
;---------------------------------------------------------------
isp_inc_e2p_counter:
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
;------------------------------
isp_read_e2p_byte:
push 01
mov r1,#255
isp_wdh_1:
		mov a,#PADDR2
		lcall isp_read_random
		jnc isp_wdh_3         
		djnz r1,isp_wdh_1
isp_wdh_3:
pop 01
ret
;---------------------------
;----------------------------
isp_write_to_e2p:
push b
mov b,#255 ;retry count
isp_kyf_3:	
	lcall isp_write_zdata
	jnc isp_kyf_2
	djnz b,isp_kyf_3
isp_kyf_2:
pop b
ret
;----------------------------
 isp_Delay110m:                                        ; 110ms delay by 11.592
          mov  r6,#250                            ; Using R5 & R6
   isp_back13:mov  r5,#210                            ;
   isp_back14:djnz r5,isp_back14                          ;
          djnz r6,isp_back13                          ;
ret                                               ;
;----------------------------
 isp_load_e2p_to_xram:
	push dpl
	push dph
;	mov addr_hi,dph
;	mov addr_lo,dpl
	mov dptr,#00h
isp_kfd_45:

			mov b,#255
		isp_kfd_1:
				mov a,#PADDR2
				lcall isp_read_random
				jnc isp_kfd_3         
				djnz b,isp_kfd_1
		isp_kfd_3:
	cpl a /////decode isp content
	movx @dptr,a
	inc dptr
	lcall isp_inc_e2p_counter
	mov a,dpl
	cjne a,#128,isp_kfd_45

	pop dph
	pop dpl
ret
;----------------------------------
isp_set_e2p_bus:
	clr  addr1_0
	clr  addr1_1
//	lcall isp_short_delay
ret
;---------------------------------
isp_short_delay:
    
    mov R2_BANK3,#50
 isp_short:
	nop
	djnz R2_BANK3,isp_short
	
ret
;-------------------------------------

;----------------------------------------
isp_bye:
clr voice_sw
clr line_sw 
clr modem_sw
lcall isp_Delay110m
lcall isp_Delay110m
lcall isp_Delay110m
clr lcd_sw
clr tel_sw
jmp $
ret 
