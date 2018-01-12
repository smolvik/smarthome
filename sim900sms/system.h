#ifndef __SYSTEM_H
#define __SYSTEM_H

#include "stm32f10x.h"

extern uint32_t system_time;
extern uint32_t system_but;
extern uint16_t adc_data;

extern void system_init (void);
extern void system_PB5_off();
extern void system_PB5_on();
extern void system_PB6_off();
extern void system_PB6_on();

extern void comp_set_threshold(uint16_t high);
extern uint16_t comp_get_threshold();
extern void comp_set_alarm_range(uint16_t l, uint16_t h);

extern uint32_t system_restore_params();
extern void system_backup_params();

extern uint16_t get_fault_flag();
extern void clr_fault_flag();
extern void set_fault_flag();

extern uint32_t code2temp(uint32_t n);
extern uint32_t temp2code(int32_t t);

extern uint16_t comp_threshold;
extern uint16_t alarm_tmax;
extern uint16_t alarm_tmin;
extern uint16_t fAlarm;
extern uint16_t fSig;
extern uint16_t tAlrm;

extern uint32_t pwroff_alrm_cnt;
extern uint32_t pwron_alrm_cnt;
extern uint32_t fSigPwrOff;
extern uint32_t fSigPwrOn;
extern uint32_t fPwrEvent;

#endif
