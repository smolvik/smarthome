#ifndef __SIM900_H
#define __SIM900_H
#include "stdint.h"

extern int 	sim900_update();
extern void sim900_init();
extern void sim900_http_get();
extern void sim900_command(char *cmd);

extern void check_CMT(int len);
extern void (*proc_resp)(int len);

extern uint32_t sim900_ready;
extern uint32_t sim900_please_die;
extern uint32_t sim900_have_mess;
extern uint8_t sim900_mess[256];

#endif
