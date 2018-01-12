#include "ets_sys.h"
#include "osapi.h"
#include "gpio.h"
#include "os_type.h"
#include "ip_addr.h"
#include "espconn.h"
#include "user_config.h"
#include "user_interface.h"
#include "iwire.h"

extern volatile uint32_t PIN_OUT;
extern volatile uint32_t PIN_OUT_SET;
extern volatile uint32_t PIN_OUT_CLEAR;

extern volatile uint32_t PIN_DIR;
extern volatile uint32_t PIN_DIR_OUTPUT;
extern volatile uint32_t PIN_DIR_INPUT;

extern volatile uint32_t PIN_IN;

extern volatile uint32_t PIN_0;
extern volatile uint32_t PIN_2;
/*
 GPIO_PIN2_DRIVER  PIN_2[2] 1:open drain; 0:normal
 */ 

static volatile int fTready = 0;

static volatile os_timer_t blink_timer;

static struct espconn config_conn;
static esp_tcp config_tcp_conn;
static const statetbl[9] = {0,1,2,3,0,1,2,4,5};

static void ICACHE_FLASH_ATTR recv_cb(void *arg, char *data, unsigned short len) 
{
  struct espconn *conn=(struct espconn *)arg;
  uint8_t transmission[128];  
 
  os_printf("it is recv_cb\r\n");
  os_printf("data[0]=%x len=%d\n", data[0], len);
  
  if(data[0] == 0x31) PIN_OUT |= 0x04;
  else PIN_OUT &= ~0x04;

  if(PIN_OUT & 0x04) os_sprintf(transmission, "1");
  else os_sprintf(transmission, "0");
  espconn_sent(conn,transmission,strlen(transmission));  
  espconn_disconnect(conn);
}
 
static void ICACHE_FLASH_ATTR recon_cb(void *arg, sint8 err) 
{
	os_printf("it is recon_cb\r\n");	
}
 
static void ICACHE_FLASH_ATTR discon_cb(void *arg) 
{
	os_printf("it is discon_cb\r\n");	
}
 
static void ICACHE_FLASH_ATTR sent_cb(void *arg) 
{
	os_printf("it is sent_cb\r\n");	
}
 
static struct espconn *gConn;
 
static void ICACHE_FLASH_ATTR connected_cb(void *arg) 
{
  struct espconn *conn=arg;
  uint8_t transmission[128];  
  gConn = arg;
 
  os_printf("it is connected_cb\r\n");
 
  espconn_regist_recvcb  (conn, recv_cb);
  espconn_regist_reconcb (conn, recon_cb);
  espconn_regist_disconcb(conn, discon_cb);
  espconn_regist_sentcb  (conn, sent_cb);
 
  /*os_sprintf(transmission, "{\"pwr\":\"%d\",\"gas\":\"%d\"}", valTemperature, 15);				
  espconn_sent(conn,transmission,strlen(transmission));
  espconn_disconnect(conn);      
  */
}

void ICACHE_FLASH_ATTR connect_to_net()
{
    char ssid[32] = SSID;
    char password[64] = SSID_PASSWORD;
    struct station_config stationConf;
    struct ip_info info;
       
    //Set station mode
    wifi_set_opmode( 0x1 );

    //Set ap settings
    os_memcpy(&stationConf.ssid, ssid, 32);
    os_memcpy(&stationConf.password, password, 64);
    wifi_station_set_config_current(&stationConf);
    
    // set static ip
    wifi_station_dhcpc_stop();    
	os_memset(&info, 0x0, sizeof(info));     
	info.ip.addr =      ipaddr_addr(MYIP);
	info.netmask.addr = ipaddr_addr(NETMASK);
	info.gw.addr =      ipaddr_addr(GATEIP);
	wifi_set_ip_info(STATION_IF, &info);    	
}	

void ICACHE_FLASH_ATTR start_server() 
{ 
        config_conn.type=ESPCONN_TCP;
        config_conn.state=ESPCONN_NONE;
        config_tcp_conn.local_port=12345;
        config_conn.proto.tcp=&config_tcp_conn;
 
        espconn_regist_connectcb(&config_conn, connected_cb);
        espconn_accept(&config_conn);
}

void blink_timerfunc(void *arg)
{
	//PIN_OUT ^= 0x04;
	os_timer_arm(&blink_timer, 1000, 0);
}

/*
void blink_timerfunc(void *arg)
{  
	uint8_t buffer[9];
	static int is = 0;
	int state;
	int i;
    //os_printf("blink...\r\n");
    
    state = statetbl[is++];
	(is == 9) && (is = 0);
    
    switch (state)
    {
		case 0:
			fTready = 0;
			os_printf("\nstart sequence\n");
			if(iwire_start()) {
				os_printf("Device detected\n");
				os_timer_arm(&blink_timer, 1, 0);
			}
			else
				os_timer_arm(&blink_timer, 1000, 0);
			break;
		
		case 1:
			// issue read rom command
			os_printf("issue read rom command\n");
			iwire_write_byte(0x33);
			os_timer_arm(&blink_timer, 1, 0);
			break;
		
		case 2:
			// read 8 bytes from rom
			iwire_read(buffer, 8);

			os_printf("rom:");
			for(i = 0; i < 8; i++) os_printf("%x ",buffer[i]);
			os_printf("\n");
				
			os_timer_arm(&blink_timer, 1, 0);
			break;
			
		case 3:
			// issue command start conversion
			os_printf("issue command start conversion\n");
			iwire_write_byte(0x44);
			os_timer_arm(&blink_timer, 1000, 0);
			break;
			
		case 4:
			// issue read scratchpad command
			os_printf("issue read scratchpad command\n");
			iwire_write_byte(0xbe);
			os_timer_arm(&blink_timer, 1, 0);
			break;			
			
		case 5:
			// read 9 bytes from scratchpad
			iwire_read(buffer, 9);
			if(0 == iwire_check(buffer, 9)){				
				os_printf("scratchpad:");
				for(i = 0; i < 9; i++) os_printf("%x ",buffer[i]);
				os_printf("\n");
				
				int8_t t = (buffer[1]<<4) | (buffer[0]>>4);
				os_printf("temperature=%d\n", t);
				
				valTemperature = t;
						
				os_timer_arm(&blink_timer, 100, 0);
			}
			else{
				os_printf("scratchpad crc error\n");
			}
			
			fTready = 1;
			break;						
	}	
}
*/
//Init function 
void ICACHE_FLASH_ATTR
user_init()
{   
   	uart_div_modify(0, UART_CLK_FREQ / 115200);
	os_printf("\r\nI am ready!!!\r\n");

	connect_to_net();
	start_server();	
	
	PIN_DIR |= 0x04; // gpio2 out
	PIN_2 |= 0x04;   // gpio2 is open drain
	
    //Disarm timer
    os_timer_disarm(&blink_timer);
    //Setup timer
    os_timer_setfn(&blink_timer, (os_timer_func_t *)blink_timerfunc, NULL);
    os_timer_arm(&blink_timer, 100, 0);
}
