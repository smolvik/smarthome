#ifndef __UART_H
#define __UART_H

//#define dbg_msg(p) uart_send_str(p)
#define dbg_msg(p){}

extern void uart_init();
extern int uart_send(char *pb, int n);
extern int uart_send_str(char *pb);

#endif
