#ifndef _IWIRE_H
#define _IWIRE_H

extern uint32_t iwire_start();
extern void iwire_write_byte(uint8_t b);
extern void iwire_read(uint8_t* pbuffer, uint32_t nb);
extern uint8_t iwire_check(uint8_t *p, uint32_t n);

#endif
/*-----------------------------------------------------------------------------------------------------*/
