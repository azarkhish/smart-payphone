#include <defenition.H>
#include <tables.H>
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
	       ORG          0000H 
                     
	        LJMP          MAIN 
	       
		   ORG          003H  
		          
        	lcall spm_online
			RETI 
			
			ORG 0BH
			lcall tmr_00
			RETI
			
			ORG          0013H 
			RETI
			
			ORG          01BH
			 lcall ltmr
			RETI

			ORG          02BH
			lcall tic_tac_or_sam 
			RETI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
org 32056
MAIN:
#include <preset.h>
#include <start_condition.h>
#include <keyboard.h>
#include <lcd.h>
#include <card.h>
#include <account.h>
#include <chargging.h>
#include <e2p.h>
#include <make_report.h>
#include <math_functions.h>
#include <bus.h>
#include <language.h>
#include <oprations.h>
#include <delay.h>
#include <antitap.h>
#include <buzz.h>
#include <graphics.h>
#include <load_setting.h>
#include <call_timer.h>
#include <dial.h>
#include <maintenance.h>
#include <modem.h>
#include <rtc.h>
#include <phone.h>
#include <sam.h>
#include <obstacle.h>
#include <boot_loader.h>
;---------------------------------------

END