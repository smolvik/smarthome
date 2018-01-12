#include "uart.h"
#include "str_utils.h"
#include "led.h"
#include "system.h"
#include "xprintf.h"

#define PIN_STR "AT+CPIN=0796\r"
#define BUFSIZE 1024
#define MAX_SZ_SMSCADDR 16

typedef enum _NUMBER_TYPE
{
	ENT_SMSC,
	ENT_PHONE
} NUMBER_TYPE;

typedef enum _PDU_TYPE
{
	EPT_7BIT = 0x00,
	EPT_8BIT = 0xF6,
	EPT_UCS2 = 0x08
} PDU_TYPE;

void null_resp(int len);
void null_ok();
void null_error();
void null_promt();
void cpinok();

int comfd;

char *comname;
int devmode = 0;
int devtype = 0;
char *devdata;

uint32_t sim900_ready = 0;
uint32_t sim900_please_die = 0;
uint32_t sim900_have_mess = 0;

uint8_t  SMSC_addr[MAX_SZ_SMSCADDR];
uint32_t SMSC_addr_type;

//uint8_t *promt_buff = 0;
uint8_t promt_buff[256];

uint8_t sim900_mess[256];

uint8_t  sender_addr[MAX_SZ_SMSCADDR] = "";
//uint8_t  sender_addr[MAX_SZ_SMSCADDR] = "+79155894412";
//uint8_t  sender_addr[MAX_SZ_SMSCADDR] = "+79155476873";
uint32_t sender_addr_type = 0x91;

char inbuf[BUFSIZE];

void (*proc_resp)(int len) = null_resp;
void (*proc_ok)() = null_ok;
void (*proc_error)() = null_error;
void (*proc_promt)() = null_promt;

void null_promt()
{
}
void null_resp(int len)
{
}
void null_ok()
{
}
void null_error()
{
}

//----------------------------------------------------------------------
int sim900_update(void)
{
	char cur;
	int len;	
	static unsigned char pre = 0;
	static int i = 0;

	len = 0;
	
	if(uart_read(&cur, 1) == 1)
	{
		if(cur == '>') {
			proc_promt();
		}
		else	
		if((pre == 0x0d) && (cur == 0x0a)) 
		{			
			inbuf[i] = 0;		
			len = i-1;		
			i = 0;

			if(len > 0) 
			{				
				if(0 == strncmp(inbuf, "OK", 2)){
					// status OK
					proc_ok();
				}
				else if(0 == strncmp(inbuf, "ERROR", 5)){
					// status error
					proc_error();
				}
				else {
					proc_resp(len);
				}
			}
		}
		else
		{
			inbuf[i++] = cur;
		}
	
		pre = cur;				
	}
		
	return len;
}
//----------------------------------------------------------------------
void print_response(int len)
{
	int i;
	for(i = 0; i < len; i++) 
	{
		xprintf("%c", inbuf[i]);
	}										
	xprintf("\n");	
}

void print_response_hex(int len)
{
	int i;
	for(i = 0; i < len; i++) 
	{
		xprintf("[%x]", inbuf[i]);
	}										
	xprintf("\n");	
}

void itsok()
{
	xprintf("OK\n");
}

void itserror()
{
	xprintf("ERROR\n");
	sim900_please_die = 1;
}

void sim900_command(char *cmd)
{
	uart_send(cmd, strlen(cmd));
}

uint32_t encode_adress(uint8_t* p_number, uint32_t type, uint8_t* p_adress, NUMBER_TYPE type_num)
{
	uint32_t i,j,k;
	uint32_t len_number;
	uint32_t num_pair;

	len_number = strlen(p_number);
	num_pair = len_number >> 1;

	if(type_num == ENT_SMSC)
	{
		if(len_number & 0x0001)
			tohex(num_pair+2, p_adress, 2);
		else
			tohex(num_pair+1, p_adress, 2);
	}

	if(type_num == ENT_PHONE)
	{
            tohex(len_number, p_adress, 2);
	}

	tohex(type, p_adress+2, 2);
	
	for(i = 0; i < num_pair; i++)
	{
		j = i << 1;
	    k = j+4;
        p_adress[k] = p_number[j+1];
	    p_adress[k+1] = p_number[j];
	}

	if(len_number & 0x0001)
	{
            p_adress[k+2] = 'F';
            p_adress[k+3] = p_number[j+2];
	}

	p_adress[k+4] = 0;
	
	return k+4;	
}

int  compress_7bit(char* p_dst, char* p_src, int len_dst)
{
    int i = 0;
    int j = 0;
    int res_len = 0;
    
    while(1)
    {
        int lim = len_dst - j;

        if(lim >= 8) lim = 7;
        else if(lim <= 0) break;
                
        for(i = 0; i < lim; i++)
        {
            p_src[j+i] |= p_src[j+i+1] << (7-i);
            p_dst[res_len] = p_src[j+i];
            p_src[j+i+1] = p_src[j+i+1] >> (i+1);
            res_len ++;
        }
        
        j += 8;
    } 
    
    return res_len;   
}

/*--------------------------------------------------------------------------------
 Encode PDU procedure
 TP-DCS + TP-UDL + TP-UD
--------------------------------------------------------------------------------*/
int encode_message(char* p_message, char* pdu, PDU_TYPE type)
{
    int i;
    uint32_t ipdu = 0;
    int len = strlen(p_message);
    
    // TP-DCS Data-Coding-Scheme
    ipdu += tohex(type, &pdu[ipdu], 2);        

    if(type == EPT_7BIT)
    {	    		  
		ipdu += tohex(len, &pdu[ipdu], 2);
		len = compress_7bit(p_message, p_message, len);
    
		for(i = 0; i < len; i++)
		{
			ipdu += tohex(p_message[i], &pdu[ipdu], 2);
		}
		
		pdu[ipdu] = 0;
		return ipdu;
	}
	else if(type == EPT_UCS2)
	{
		uint32_t j = 0;
		uint8_t lh[3];
		uint32_t il = ipdu;
		
		ipdu += 2;
		// convert utf-8 string to unicode
		j = 0;
		for(i = 0; i < len; i++)
		{
			uint16_t unc;
			if(p_message[j] == 0) break;
			j += utf_to_unc(&p_message[j], &unc);
			ipdu += tohex(unc, &pdu[ipdu], 4);
		}		
		
		//xprintf("%d\n", i);
		
		tohex((i<<1), lh, 2);
		pdu[il+0] = lh[0]; 
		pdu[il+1] = lh[1];
		
		pdu[ipdu] = 0;
		return ipdu;
	}

	pdu[0] = 0;
	return 0;
}

void CMGS_ok()
{
	xprintf("OK\n");	
	
	proc_resp = &print_response;
	proc_ok = &itsok;
	proc_error = &itserror;				
	
	sim900_ready = 1;
	//sim900_please_die = 1;
}

void CMGS_resp(int len)
{	
	print_response(len);
	
	if(0 == strncmp(inbuf, "+CMGS:", 6))
	{
		proc_resp = &print_response;
		proc_ok = &CMGS_ok;
		proc_error = &itserror;					
	}	
}

void send_sms_pdu()
{
	xprintf(">");
	sim900_command(promt_buff);
	sim900_command("\x1a");
	//free(promt_buff);	
	
	proc_promt = &null_promt;
	proc_resp = &CMGS_resp;
	proc_ok = &itsok;
	proc_error = &itserror;			
}

void sim900_send_sms_seq()
{
	uint8_t *pdu;
	uint8_t ipdu = 0;
	uint8_t *mess = sim900_mess;
	//uint8_t mess[] = "Привет!!!";
	//uint8_t mess[] = "Hello";
	uint32_t len_tpdu = 0;
	uint8_t sms_cmd[16] = "AT+CMGS=";
	uint32_t i;

	//pdu = malloc(256);
	pdu = promt_buff;

	if(pdu && (sender_addr[0]!=0))
	{
		// SMS = SCA + TPDU
		ipdu = 0;
		// SCA - number of SMSC 
		ipdu += encode_adress(&SMSC_addr[1], SMSC_addr_type, &pdu[ipdu], ENT_SMSC);
		len_tpdu = ipdu;
		// TPDU = «PDU-Type» + «TP-MR» + «TP-DA» + «TP-PID» + «TP-DCS» + «TP-VP» + «TP-UDL» + «TP-UD»
		// PDU type - outcomming message
		pdu[ipdu++] = '0'; pdu[ipdu++] = '1'; 
		// TP-MR MR type
		pdu[ipdu++] = '0'; pdu[ipdu++] = '0'; 
		// TP-DA number of destination
		ipdu += encode_adress(&sender_addr[1], sender_addr_type, &pdu[ipdu], ENT_PHONE);
		// TP_PID PID type
		pdu[ipdu++] = '0'; pdu[ipdu++] = '0';   

		// the message
		//ipdu += encode_message(mess, &pdu[ipdu], EPT_7BIT);
		ipdu += encode_message(mess, &pdu[ipdu], EPT_UCS2);
		
		len_tpdu = (ipdu-len_tpdu) >> 1;
		xprintf("%s %d\n", pdu, len_tpdu);
		//xprint_hex(pdu, ipdu);
		
		//promt_buff = pdu;

		i = 8;	
		i += itoa(&sms_cmd[i], len_tpdu);
		(i < 16) && (sms_cmd[i++] = '\r', sms_cmd[i] = 0);		
		
		sim900_command(sms_cmd);		
		proc_promt = &send_sms_pdu;
		
		//proc_resp = &print_response_hex;
		proc_resp = &print_response;
		proc_ok = &itsok;
		proc_error = &itserror;				
		sim900_ready = 0;		
				
	}
	else xprintf("ERROR sim_send_sms_seq()\n");	
}

uint32_t decode_adress(uint8_t *pdu, uint8_t *padr)
{
	NUMBER_TYPE type;
	int32_t i,j,len;
	
	len = hextob(pdu, 2);
	pdu += 2;
	
	type = hextob(pdu, 2);
	pdu += 2;
	
	if(type != 0x91) {padr[0] = 0; return 0;}
	
	padr ++;
	j = 1;
	for(i = 0; i < (len + (len & 0x01)) ; i ++)
	{
		padr[i] = pdu[i+j];
		j = (j^((int32_t)-1))+1;		
	}

	(len & 0x01) && (i--);
	
	padr[-1] = '+';
	padr[i] = 0;
	return i;
}  

int  decompress_7bit(char* p_dst, char* p_src, int len_dst)
{
    int i, j;
    int len_src = len_dst * 7;
    int num_bits = len_src & 0x07;  
    len_src = len_src >> 3;         
    
    if(num_bits) len_src ++;
    
    num_bits = 7 - num_bits;       
    i = len_src - 1;
    j = len_dst - 1;    
    
    p_dst[len_dst] = 0x00;  // terminator
    
    while(j >= 0)
    {
        if(num_bits == 0)
        {
            p_dst[j] = 0x7F & p_src[i];
            i --;
            j --;            
            num_bits --;
            continue;
        } 
        
        if(num_bits == -1)
        {
            p_dst[j] = (0xFF & p_src[i]) >> 1;
            num_bits = 6;
            j --;
            continue;
        }
        
        p_dst[j] = (0xFF & p_src[i]) << num_bits;
        i --;
        if(i >= 0) p_dst[j] |= (0xFF & p_src[i]) >> (8-num_bits);
        p_dst[j] &= 0x7F;

        num_bits --;
        j --;
    }
    
    
    return 1;
}

uint32_t pdu_decode(uint8_t* p_message, uint8_t* p_pdu, PDU_TYPE type)
{
    int i = 0;
    int len = hextob(p_pdu, 2);    
    
    if(type == EPT_7BIT)
    {
		int len_cmp = len * 7;
		int bits = len_cmp & 0x07;       
		len_cmp = len_cmp >> 3;          
		bits && len_cmp ++;
		
		if(len > 140) return 0;
		
		for(i = 0; i < len_cmp; i++)
		{
			p_message[i] = hextob(p_pdu + 2 + (i << 1), 2);
		}    

        decompress_7bit(p_message, p_message, len);                
		p_message[len] = 0;
	}
	else if(type == EPT_UCS2)
	{
		int nucs = len >> 1;
				
		//xprintf("%d\n", len);
				
		p_pdu += 2;
		for(i = 0; i < nucs; i++)
		{
			uint16_t ucs = hextob(p_pdu,4);
			p_pdu += 4;
			
			p_message = unc_to_utf(ucs, p_message);
			
		}
		*p_message = 0;

		//p_message = unc_to_utf( ((uint16_t*)p_message)[i], p_message);
		//xprintf("%x\n", (uint8_t)p_message[i]);
	}
	else{
		*p_message = 0;
		return 0;
	}
    
    return 1; 
}

// Couple of functions for sms receive
// if the new SMS arrives modem sends unsolicited notification:
// +CMT: <length><CR><LF><pdu>

void print_pdu(int len)
{
	uint8_t *p;
	uint8_t *mess = sim900_mess;
	uint8_t len_sender;
	PDU_TYPE pdu_type;
	
	print_response(len);
	//xprintf("%d\n", len);
	
	p = inbuf;                // указатель на номере SMSC
	
	p += 2 + (hextob(p,2) << 1) + 2;  // указатель на номере отправителя
	decode_adress(p, sender_addr);
	
	len_sender = hextob(p, 2);
	p += 2 + len_sender + (len_sender & 0x0001) + 4; // указатель на типе
	pdu_type = hextob(p, 2);
	p += 2;           // указатель на дате
	p += 14;          // указатель на поле данных       
	
	p[(hextob(p,2) << 1) + 2] = 0;	
	pdu_decode(mess, p, pdu_type);
	
	//xprintf("%x\n", (uint8_t)pdu_type);
	xprintf("%s\n", sender_addr);
	xprintf("%s\n", mess);
	
	proc_resp = &print_response;
	proc_ok = &itsok;
	proc_error = &itserror;				
	
	sim900_ready = 1;
	sim900_have_mess = 1;
}

void check_CMT(int len)
{	
	print_response(len);
	
	// check for +CMT 
	if(0 == strncmp(inbuf, "+CMT", 4)){
		// find arived sms notification
		proc_resp = &print_pdu; // next we wait "pdu" body
		proc_ok = &itsok;
		proc_error = &itserror;		
		
		sim900_ready = 0;		
	}
}

/* 
 * Couple of the functions for initialisation modem
*/

//////////////////

// Couple of the functions for initialisation modem
void wait_SMSC_OK()
{
	xprintf("OK\n");
	
	proc_resp = &print_response;
	proc_ok = &itsok;
	proc_error = &itserror;
	
	sim900_ready = 1;		
	
}

void read_SMSC(int len)
{
	print_response(len);
	
	if(0 == strncmp(inbuf, "+CSCA:", 6)){
		uint32_t i;
		uint32_t fs = 0;
		uint32_t tidx = 0;
		uint32_t j = 0;
		
		for(i = 0; i < MAX_SZ_SMSCADDR; i++){
			uint8_t c = (inbuf+6)[i];			
						
			if(c == ',') {SMSC_addr[tidx] = 0; break;}
			else{
				(fs) && (SMSC_addr[j++] = c);
				(c == '"') && (fs ^= 1, tidx = j-1);
			}			
			
			//xprintf("%c %d\n", c, tidx);
		}
		
		SMSC_addr_type = atoi(inbuf+6+i+1);
		
		proc_resp = &print_response;
		proc_ok = &wait_SMSC_OK;
		proc_error = &itserror;
	}
}

void wait_check_ready(int len)
{
	print_response(len);
	
	//if(0 == strncmp(inbuf, "Call Ready", 10))
	if(0 == strncmp(inbuf, "+CREG: 1", 8))
	{
		// request for SMSC addres
		sim900_command("AT+CSCA?\r");
		
		proc_resp = &read_SMSC;
		proc_ok = &itsok;
		proc_error = &itserror;				

	}		
}

void cpinok()
{
	xprintf("OK\n");	
	
	proc_resp = &wait_check_ready;
	proc_ok = &itsok;
	proc_error = &itserror;		
}

void check_cpin(int len)
{
	print_response(len);
	
	if(strstr(inbuf, "+CPIN:"))
	{
		if(strstr(&inbuf[6], "READY"))
		{		
			
			// sim card is OK 
			proc_resp = &wait_check_ready;
			proc_ok = &itsok;
			proc_error = &itserror;						
		}		
		else if(strstr(&inbuf[6], "SIM PIN"))
		{			
			// simcard needs pin code
			sim900_command(PIN_STR);
			
			proc_resp = &print_response;
			proc_ok = &cpinok;
			proc_error = &itserror;										
		}
		else{
			// somthing wrong - simcard is'nt inserted
			xprintf("ERROR:sim card is'nt inserted\n");
			sim900_please_die = 1;
		}
	}
}

void sim900_init()
{
	sim900_ready = 0;
	
	proc_resp = &check_cpin;
	proc_ok = &itsok;
	proc_error = &itserror;			
	
}
