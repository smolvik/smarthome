#include "stm32f10x.h"

#define BUF_SIZE 1024

char tx_buf[BUF_SIZE];
int  tx_idx = 0;
int  tx_wr_idx = 0;

char rx_buf[BUF_SIZE];
int  rx_idx = 0;
int  rx_rd_idx = 0;

void uart_init()
{
	// setting outputs for uart
	GPIOA->CRL &= ~(GPIO_CRL_CNF2|GPIO_CRL_MODE2);
	GPIOA->CRL |= (GPIO_CRL_CNF2_1|GPIO_CRL_MODE2_0|GPIO_CRL_MODE2_1); // PA2 - push-pull 50MHz alter out
		
	// uart setup
	USART2->CR1 |= USART_CR1_UE;	 // uart is on
	USART2->CR1 |= USART_CR1_RE;	 // uart rx is on	
	USART2->CR1 |= USART_CR1_RXNEIE; // Received data ready to be read interrupt enable
	USART2->CR1 |= USART_CR1_TXEIE;  // Transmit data register empty interrupt enable
	NVIC_EnableIRQ(USART2_IRQn);     // 
	
	//USART2->BRR = 0xea6; 			 // setup boderate 9600 bode for 36MHz mantissa=234 fract=6	
	USART2->BRR = 0x138; 			 // setup boderate 115200 bode for 36MHz mantissa=19 fract=8	
}

int uart_send(char *pb, int nb)
{
	int i;
	
	if(tx_wr_idx == tx_idx) {
		USART2->CR1 |= USART_CR1_TE;	// send idle frame
	}
	
	for( i = 0; i < nb; i++ ){
		tx_buf[tx_wr_idx] = pb[i];
		tx_wr_idx = (tx_wr_idx+1)&(BUF_SIZE-1);
		if(tx_wr_idx == tx_idx) {
			i++;
			break;
		}
	}	
	
	USART2->CR1 |= USART_CR1_TXEIE;  // Transmit data register empty interrupt enable
	return i;	
}

int uart_send_str(char *pb)
{
	int i;
	int sz = BUF_SIZE;
	
	sz -= (tx_wr_idx - tx_idx)&(BUF_SIZE-1);
	
	if(tx_wr_idx == tx_idx) {
		USART2->CR1 |= USART_CR1_TE;	// send idle frame
	}
	
	for( i = 0; i < sz; i++ ){
		if(pb[i] == 0){
			i++;
			break;
		}
		tx_buf[tx_wr_idx] = pb[i];
		tx_wr_idx = (tx_wr_idx+1)&(BUF_SIZE-1);
	}	
	
	USART2->CR1 |= USART_CR1_TXEIE;  // Transmit data register empty interrupt enable
	return i;	
}

int uart_read(char *pb, int nb)
{
	int i;
	
	if(rx_rd_idx == rx_idx) return 0;
	
	for( i = 0; i < nb; i++ ){
		pb[i] = rx_buf[rx_rd_idx];
		rx_rd_idx = (rx_rd_idx+1)&(BUF_SIZE-1);
		if(rx_rd_idx == rx_idx) {
			i++;
			break;
		}
	}	
	return i;
}

void USART2_IRQHandler()
{
	if(USART2->SR & USART_SR_TXE)
	{
		if(tx_idx == tx_wr_idx)
		{
			// no data for transfer - interrupt disable
			USART2->CR1 &= ~USART_CR1_TXEIE; 
		}
		else
		{
			// transfer next byte from the buffer
			USART2->DR = tx_buf[tx_idx];
			tx_idx = (tx_idx+1)&(BUF_SIZE-1);	
		}
	}
	
	if(USART2->SR & USART_SR_RXNE)
	{
		rx_buf[rx_idx] = USART2->DR;
		rx_idx = (rx_idx+1)&(BUF_SIZE-1);	
	}
	
}
