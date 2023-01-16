FADDR				 			EQU		0a0h		; fixed address for AT24Cxx EEPROMs
PADDR				 			EQU		0		; programmable address (0..7)

index		EQU	r0		; buffer pointer

kount				 data	018h
temp 	   			 DATA 	019h   
addr_lo	  			 DATA 	01ah		; 2-byte address register
addr_hi	 			 DATA 	01bh
dp_h	  			 DATA 	01ch
dp_l	  			 DATA 	01dh
zdata	  			 DATA 	01eh

card_scl bit p1.2
card_sda bit p1.3

card_in bit  p1.6

e2p_scl bit p1.0
e2p_sda bit p1.1

dsr bit p3.4
dtr bit p3.5

led1  bit p1.4
led2  bit p1.5

