

#include<reg51.h>
                                  // initialize counter to 0

void delay(){
nop();
nop();
nop();
nop();
nop();
nop();
}                      

void main()
  {
         P3=0x00;                   // clear op
       
        while(1){
		P3_2=1;
		delay();
		P3_2=0;
		delay();}                   // continuous loop
   }


