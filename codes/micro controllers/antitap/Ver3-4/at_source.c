
#include <REG2051.h>

unsigned char c;
unsigned char State[4]={0,0,0,0};
unsigned char StateTimmer[4][4]={{0,0,0,0},{0,0,0,0},
								 {0,0,0,0},{0,0,0,0}};


#define WaitTime   5
#define RelayTime  5

sbit Add0 = P3^0;
sbit Add1 = P3^1;

sbit HK0 = P1^4;
sbit HK1 = P1^5;
sbit HK2 = P1^6;
sbit HK3 = P1^7;

sbit Rel0 = P1^0;
sbit Rel1 = P1^1;
sbit Rel2 = P1^2;
sbit Rel3 = P1^3;

sbit Led0 = P3^2; 
sbit Led1 = P3^3; 
sbit Led2 = P3^4;
sbit Led3 = P3^5;

sbit SPMDetect = P3^7; 

void Scan(void);
void Wait(void);
void SDelay(void)
{
int i=0;
while(i<1000)i++;

}
void Delay(void)
{
int i;
while(i<30000) i++;
}


void LDelay(void)
{
unsigned int p=0;
while(p<50000)p++;
}
void timer0 (void) interrupt 1 
  {
    TF0=0;
    c++;                                 
    if(c==20)                                  
      {
	  c=0;
////////User0//////////////////////
	  if(StateTimmer[0][0])
	  	StateTimmer[0][1]++;
	  if(StateTimmer[0][2])
	  	StateTimmer[0][3]++;
////////User1//////////////////////
	  if(StateTimmer[1][0])
	  	StateTimmer[1][1]++;
	  if(StateTimmer[1][2])
	  	StateTimmer[1][3]++;
////////User2//////////////////////
	  if(StateTimmer[2][0])
	  	StateTimmer[2][1]++;
	  if(StateTimmer[2][2])
	  	StateTimmer[2][3]++;
////////User3//////////////////////
	  if(StateTimmer[3][0])
	  	StateTimmer[3][1]++;
	  if(StateTimmer[3][2])
	  	StateTimmer[3][3]++;
	  }
     TH0=0x3C;                      
     TL0=0xAF;   
  }

void main(void)
  {
    	TMOD=(TMOD&0xF0)|0x01;                
        TH0=0x3C;                 
        TL0=0xAF;
        ET0=1;                    
        TR0=1;
		EA=1; 

		HK0=1;
		HK1=1;
		HK2=1;
		HK3=1;

		Rel0=1;
		Rel1=1;
		Rel2=1;
		Rel3=1;

		SPMDetect = 1;

		Led0=0;
		Rel0=0;
		LDelay();
		Led0=1;
		Rel0=1;
		Rel1=0;
		Led1=0;
		LDelay();
		Rel1=1;
		Rel2=0;
		Led1=1;
		Led2=0;
		LDelay();
		Rel2=1;
		Rel3=0;
		Led2=1;
		Led3=0;
		LDelay();
		Rel3=1;
		Led3=1;

	while(1){
			Scan();
			Wait();
			}
			}

	void Scan(void)
		{
/////////////User0/////////////////////////////////
			if(!HK0)
				{
				Rel0=1;
				Led0=1;
				State[0]=0;
				StateTimmer[0][3]=0;
				StateTimmer[0][2]=0;
				StateTimmer[0][1]=0;
				StateTimmer[0][0]=0;
				}
	  		else if(State[0]!=2)
				{
				
				State[0]=1;
				}
/////////////User1/////////////////////////////////
			if(!HK1)
				{
				Rel1=1;
				Led1=1;
				State[1]=0;
				StateTimmer[1][3]=0;
				StateTimmer[1][2]=0;
				StateTimmer[1][1]=0;
				StateTimmer[1][0]=0;
				}
	  		else if(State[1]!=2)
				{
				
				State[1]=1;
				}
/////////////User2/////////////////////////////////
			if(!HK2)
				{
				Rel2=1;
				Led2=1;
				State[2]=0;
				StateTimmer[2][3]=0;
				StateTimmer[2][2]=0;
				StateTimmer[2][1]=0;
				StateTimmer[2][0]=0;
				}
	  		else if(State[2]!=2)
				{
				
				State[2]=1;
				}
/////////////User3/////////////////////////////////
			if(!HK3)
				{
				Rel3=1;
				Led3=1;
				State[3]=0;
				StateTimmer[3][3]=0;
				StateTimmer[3][2]=0;
				StateTimmer[3][1]=0;
				StateTimmer[3][0]=0;
				}
	  		else if(State[3]!=2)
				{

				State[3]=1;
				}
		}        
   
void Wait(void)
 {	
 int k;

/////////////User0/////////////////////////////////
 	if(State[0]==1)
	{	
		if(StateTimmer[0][0])
		{
			Add0=0;
			Add1=0;		//Address=0
			SDelay();
			k=0;
		   if(!StateTimmer[0][2])
			{
				while(k<1000)
				{
				k++;
				if(!SPMDetect) break;
				}
			
				if(!SPMDetect)
					{
					Led0=1;
					Rel0=1;
					State[0]=2;
					StateTimmer[0][0]=0;
					StateTimmer[0][1]=0;
					StateTimmer[0][2]=0;
					StateTimmer[0][3]=0;
					}
			 	else if(StateTimmer[0][1]>=WaitTime)
					{
					Rel0=0;
					Led0=0;
					StateTimmer[0][2]=1;
					StateTimmer[0][1]=0;
					StateTimmer[0][3]=0;
					}
				
			  }
			  else if(StateTimmer[0][3]>=RelayTime)
				{
				Rel0=1;
				Led0=1;
				State[0]=0;
				StateTimmer[0][3]=0;
				StateTimmer[0][2]=0;
				StateTimmer[0][1]=0;
				StateTimmer[0][0]=0;
				}
		}		
		else
		{
			StateTimmer[0][0]=1;
			StateTimmer[0][1]=0;  
		}
	}
/////////////User1/////////////////////////////////
 	if(State[1]==1)
	{	
		if(StateTimmer[1][0])
		{
			Add0=1;
			Add1=0;		//Address=1
			SDelay();
			k=0;
		   if(!StateTimmer[1][2])
			{
				while(k<1000)
				{
				k++;
				if(!SPMDetect) break;
				}
			
				if(!SPMDetect)
					{
					Led1=1;
					Rel1=1;
					State[1]=2;
					StateTimmer[1][0]=0;
					StateTimmer[1][1]=0;
					StateTimmer[1][2]=0;
					StateTimmer[1][3]=0;
					}
			 	else if(StateTimmer[1][1]>=WaitTime)
					{
					Rel1=0;
					Led1=0;
					StateTimmer[1][2]=1;
					StateTimmer[1][1]=0;
					StateTimmer[1][3]=0;
					}
				
			  }
		  else if(StateTimmer[1][3]>=RelayTime)
				{
				Rel1=1;
				Led1=1;
				State[1]=0;
				StateTimmer[1][3]=0;
				StateTimmer[1][2]=0;
				StateTimmer[1][1]=0;
				StateTimmer[1][0]=0;
				}
		  
		   
		}		
		else
		{
			StateTimmer[1][0]=1;
			StateTimmer[1][1]=0;  
		}
	}
/////////////User2/////////////////////////////////
 	if(State[2]==1)
	{	
		if(StateTimmer[2][0])
		{
			Add0=0;
			Add1=1;		//Address=2
			SDelay();
			k=0;
		   if(!StateTimmer[2][2])
			{
				while(k<1000)
				{
				k++;
				if(!SPMDetect) break;
				}
			
				if(!SPMDetect)
					{
					Led2=1;
					Rel2=1;
					State[2]=2;
					StateTimmer[2][0]=0;
					StateTimmer[2][1]=0;
					StateTimmer[2][2]=0;
					StateTimmer[2][3]=0;
					}
			 	else if(StateTimmer[2][1]>=WaitTime)
					{
					Rel2=0;
					Led2=0;
					StateTimmer[2][2]=1;
					StateTimmer[2][1]=0;
					StateTimmer[2][3]=0;
					}
			
			  }
			else if(StateTimmer[2][3]>=RelayTime)
				{
				Rel2=1;
				Led2=1;
				State[2]=0;
				StateTimmer[2][3]=0;
				StateTimmer[2][2]=0;
				StateTimmer[2][1]=0;
				StateTimmer[2][0]=0;
				}
		}		
		else
		{
			StateTimmer[2][0]=1;
			StateTimmer[2][1]=0;  
		}
	}
/////////////User3/////////////////////////////////
 	if(State[3]==1)
	{	
		if(StateTimmer[3][0])
		{
			Add0=1;
			Add1=1;		//Address=3
			SDelay();
			k=0;
		   if(!StateTimmer[3][2])
			{
				while(k<1000)
				{
				k++;
				if(!SPMDetect) break;
				}
			
				if(!SPMDetect)
					{
					Led3=1;
					Rel3=1;
					State[3]=2;
					StateTimmer[3][0]=0;
					StateTimmer[3][1]=0;
					StateTimmer[3][2]=0;
					StateTimmer[3][3]=0;
					}
			 	else if(StateTimmer[3][1]>=WaitTime)
					{
					Rel3=0;
					Led3=0;
					StateTimmer[3][2]=1;
					StateTimmer[3][1]=0;
					StateTimmer[3][3]=0;
					}
				
			  }
		   else if(StateTimmer[3][3]>=RelayTime)
				{
				Rel3=1;
				Led3=1;
				State[3]=0;
				StateTimmer[3][3]=0;
				StateTimmer[3][2]=0;
				StateTimmer[3][1]=0;
				StateTimmer[3][0]=0;
				}
		}		
		else
		{
			StateTimmer[3][0]=1;
			StateTimmer[3][1]=0;  
		}
	}}

 	
