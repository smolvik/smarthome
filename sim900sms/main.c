#include "system.h"
#include "uart.h"
#include "led.h"
#include "sim900.h"
#include "xprintf.h"
#include "math.h"

char buf[128] = "ПРИВЕТ123";
uint16_t fAlarmFault = 0;

void sleep(uint32_t tms)
{ 
	uint32_t t = system_time;
	while(t+tms > system_time);
}

int main()
{
	uint32_t t;
	float x;
	
	system_init();
	uart_init();
	led_init();		
	dbg_init();
			
	// sim900 on	
	system_PB6_off();
	sleep(1000);
	system_PB6_on();
	
	led_on();

	/*xprintf("%d\n", (temp2code(120)));
	xprintf("%d\n", (temp2code(-40)));
	xprintf("%d\n", (temp2code(0)));
	xprintf("%d\n", (code2temp(2110)));
	xprintf("%d\n", (code2temp(0)));
	for(;;){}*/

	//comp_set_threshold(temp2code(50));
	//comp_set_alarm_range(temp2code(15), temp2code(70));

	if(system_restore_params()){
		xprintf("Read from backup: H=%d Tmin=%d Tmax=%d\n", code2temp(comp_get_threshold()), 
								code2temp(alarm_tmin), code2temp(alarm_tmax));
	}
	else {
		xprintf("Backup is'nt found - set default params\n");
	}
			
	
												
/*
	while(1)
	{
		xprintf("U=%d %d\n", code2temp(adc_data), adc_data);
		
		if(fSig && fAlarm) xprintf("Alarm %d %d\n", code2temp(adc_data), adc_data);
		fSig = !fAlarm;
		sleep(200);		
	}
*/
/*
	while(1)
	{
		xprintf("U=%d\n", adc_data);
		sleep(200);		
	}
*/

	sim900_init();
	
	xprintf("Welcome\n");
			
	while(1)
	{
		IWDG->KR = 0xAAAA; // reload wachdog
		
		if(sim900_please_die) break;
		if(sim900_ready)
		{
			proc_resp = &check_CMT;
			if(sim900_have_mess)
			{
				sim900_have_mess = 0;
				if(0 == strncmp("Температура", sim900_mess, strlen("Температура")))
				{
					xsprintf(sim900_mess, "Температура %d", code2temp(adc_data));
					sim900_send_sms_seq();
				}
				else if(0 == strncmp("Порог", sim900_mess, strlen("Порог")))
				{
					if(sim900_mess[strlen("Порог")] == 0)
					{
						xsprintf(sim900_mess, "Текущий порог %d", code2temp(comp_get_threshold()));
						sim900_send_sms_seq();						
					}
					else
					{
						int32_t t = atoi(&sim900_mess[strlen("Порог")]);
						if((t > -40) && (t < 125))
						{
							comp_set_threshold(temp2code(t));		
							system_backup_params();
							xsprintf(sim900_mess, "Установлен порог %d", t);
							sim900_send_sms_seq();
						}
						else
						{
							xsprintf(sim900_mess, "Ошибка: -40 < T < 125");
							sim900_send_sms_seq();						
						}
					}
				}
				else
				{
					xsprintf(sim900_mess, "Извините команда не поддерживается");
					sim900_send_sms_seq();
				}
			}	
			
			//xprintf("Temp %d %d\n", code2temp(adc_data), fAlarm);
			/*
			if(fAlarm) {
				xprintf("Alarm %d %d\n", code2temp(fAlarm), fAlarm);			
			}*/
			
			// check alarm range
			
			if(fSig && fAlarm) {
				xprintf("Alarm %d %d\n", code2temp(adc_data), adc_data);
				xsprintf(sim900_mess, "ВНИМАНИЕ недопустимая температура: %d!", code2temp(adc_data));
				sim900_send_sms_seq();										
			}
			fSig = !fAlarm;	
			
			if(fSigPwrOff && (pwroff_alrm_cnt > 30))
			{ 
				fPwrEvent = 1;
				xprintf("Power Alarm\n");				
				xsprintf(sim900_mess, "ВНИМАНИЕ неисправность питания!");
				sim900_send_sms_seq();														
			}
			fSigPwrOff = !(pwroff_alrm_cnt > 30);
			
			if(fPwrEvent && fSigPwrOn && (pwron_alrm_cnt > 30))
			{ 
				fPwrEvent = 0;
				xprintf("Power OK\n");				
				xsprintf(sim900_mess, "Питание в норме");
				sim900_send_sms_seq();														
			}
			fSigPwrOn = !(pwron_alrm_cnt > 30);
			
			if(get_fault_flag())
			{		
				clr_fault_flag();
				xprintf("System has been rebooted\n");
			}												
		}
					
		sim900_update();
	}
	
	/*
	// sim900 off
	system_PB5_on();
	sleep(1000);
	system_PB5_off();		
	*/
	
	set_fault_flag();
	
	while(1)
	{
		sleep(1000);
		//led_tog();
	}
}		
