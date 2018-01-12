#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
#include "ip_addr.h"
#include "espconn.h"
#include "user_interface.h"

#define  WIRE_LOW        PIN_OUT_CLEAR |= 0x04
#define  WIRE_HIGH       PIN_OUT_SET |= 0x04
#define  WIRE_TEST       (PIN_IN & 0x04)

#define CRC_POLY_8 0x8c
#define CRC_POLY_INIT_8 0x00

extern volatile uint32_t PIN_OUT;
extern volatile uint32_t PIN_OUT_SET;
extern volatile uint32_t PIN_OUT_CLEAR;

extern volatile uint32_t PIN_DIR;
extern volatile uint32_t PIN_DIR_OUTPUT;
extern volatile uint32_t PIN_DIR_INPUT;

extern volatile uint32_t PIN_IN;

extern volatile uint32_t PIN_0;
extern volatile uint32_t PIN_2;

uint8_t crc_div8(uint8_t byte, uint8_t reg)
{
	uint8_t buf;
	uint32_t i;
	
	buf = reg ^ byte;
	
	for(i = 0; i < 8; i++)
	{
		if(buf & 0x0001)
		{
			buf = buf >> 1;
			buf = buf ^ CRC_POLY_8;
		}
		else{
			buf = buf >> 1;
		}
	}
	return buf;
}

uint8_t iwire_check(uint8_t *buf, uint32_t n)
{
	uint32_t i;
	uint8_t crc8;
	
	crc8 = CRC_POLY_INIT_8;
	for(i = 0; i < n; i++){
			crc8 = crc_div8(buf[i], crc8);
	}
	return crc8;
}

void iwire_write_byte(uint8_t b)
{
  uint32_t i;
  uint8_t mask = 0x01;
  
  for(i = 0; i < 8; i++)
  {
		int k;
      
		// 1 mks pulse start timeslot 
		WIRE_LOW;
		WIRE_LOW;    
		WIRE_LOW;        
		WIRE_LOW;  
		WIRE_LOW;  
      
		(mask & b) && (WIRE_HIGH);
      
		os_delay_us(100);
      
		WIRE_HIGH;
		os_delay_us(10);
		mask = mask << 1;
  }   
}

void iwire_read(uint8_t* pbuffer, uint32_t nb)
{
    uint32_t i,j;
    uint8_t bt;    

    for(i = 0; i < nb; i++)  // счетчик байтов
    {
        bt = 0;
        
        for(j = 0; j < 8; j++)  // счетчик битов
        {
            uint32_t k;
            
			// 1 mks pulse start timeslot 
			WIRE_LOW;
			WIRE_LOW;    
			WIRE_LOW;        
			WIRE_LOW;  
			WIRE_LOW;  
			WIRE_HIGH;     
            
            // wait for settle line
			os_delay_us(10);
            
            bt = bt >> 1;         
            (WIRE_TEST) && (bt |= 0x80);
                        
            // wait for end of time slot
			os_delay_us(60);
        }
        
        pbuffer[i] = bt;
    }          
}

uint32_t iwire_start()
{
	uint32_t i,cnt1,cnt;
	uint8_t buffer[8];
		
	// 500 mks reset pulse
    WIRE_LOW;
    os_delay_us(500);
  
    cnt1 = 0;
    cnt = 0;
    
    WIRE_HIGH;     
    for(i = 0; i < 2000; i++){         
		cnt++;
		cnt1 += (PIN_IN & 0x04) >> 2;
	}
	
	if((cnt-cnt1)>300) {
		return 1;		
	}
	return 0;
}
