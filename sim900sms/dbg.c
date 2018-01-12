#include "stm32f10x.h"
#include "xprintf.h"

#define BUF_SIZE 1024

static void uart1_putch(unsigned char b);

static char tx_buf[BUF_SIZE];
static int  tx_idx = 0;
static int  tx_wr_idx = 0;

void dbg_init()
{
	// setting outputs for uart
	GPIOA->CRH &= ~(GPIO_CRH_CNF9|GPIO_CRH_MODE9);
	GPIOA->CRH |= (GPIO_CRH_CNF9_1|GPIO_CRH_MODE9_0|GPIO_CRH_MODE9_1); // PA9 - push-pull 50MHz alter out
		
	// uart setup
	USART1->CR1 |= USART_CR1_UE;	 // uart is on
	USART1->CR1 |= USART_CR1_RE;	 // uart rx is on	
	//USART1->CR1 |= USART_CR1_RXNEIE; // Received data ready to be read interrupt enable
	USART1->CR1 |= USART_CR1_TXEIE;  // Transmit data register empty interrupt enable
	NVIC_EnableIRQ(USART1_IRQn);     // 
	
	USART1->BRR = 0x271; 			 // setup boderate 115200 bode for 72MHz mantissa=39 fract=1	
	
	tx_idx = 0;
	tx_wr_idx = 0;
	
	xdev_out(uart1_putch);
}

static void uart1_putch(unsigned char b)
{
	if(tx_wr_idx == tx_idx) {
		USART1->CR1 |= USART_CR1_TE;	// send idle frame
	}
	
	tx_buf[tx_wr_idx] = b;
	tx_wr_idx = (tx_wr_idx+1)&(BUF_SIZE-1);
	
	USART1->CR1 |= USART_CR1_TXEIE;  // Transmit data register empty interrupt enable	
}

void USART1_IRQHandler()
{
	if(USART1->SR & USART_SR_TXE)
	{
		if(tx_idx == tx_wr_idx)
		{
			// no data for transfer - interrupt disable
			USART1->CR1 &= ~USART_CR1_TXEIE;
		}
		else
		{
			// transfer next byte from the buffer
			USART1->DR = tx_buf[tx_idx];
			tx_idx = (tx_idx+1)&(BUF_SIZE-1);	
		}
	}	
}
