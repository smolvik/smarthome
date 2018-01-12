extern unsigned long _data_flash;
extern unsigned long _data_begin;
extern unsigned long _data_end;
extern unsigned long _bss_begin;
extern unsigned long _bss_end;
extern unsigned long _stack_end;

extern int main(void);
/* Vector Table */

void Reset_Handler(void) __attribute__ ((weak,  alias ("handler_reset")));
void NMI_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void HardFault_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void MemManage_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void BusFault_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void UsageFault_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void SVC_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void DebugMon_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void PendSV_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void SysTick_Handler(void) __attribute__ ((weak,  alias ("default_handler")));
void WWDG_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void PVD_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TAMPER_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void RTC_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void FLASH_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void RCC_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI0_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI1_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI3_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI4_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel1_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel3_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel4_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel5_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel6_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void DMA1_Channel7_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void ADC1_2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USB_HP_CAN1_TX_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USB_LP_CAN1_RX0_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void CAN1_RX1_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void CAN1_SCE_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI9_5_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM1_BRK_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM1_UP_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM1_TRG_COM_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM1_CC_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM3_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void TIM4_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void I2C1_EV_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void I2C1_ER_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void I2C2_EV_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void I2C2_ER_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void SPI1_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void SPI2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USART1_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USART2_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USART3_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void EXTI15_10_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void RTCAlarm_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));
void USBWakeUp_IRQHandler(void) __attribute__ ((weak,  alias ("default_handler")));

void handler_reset(void)
{
	unsigned long *source;
	unsigned long *destination;
	// Copying data from Flash to RAM
	source = &_data_flash;
	for (destination = &_data_begin; destination < &_data_end;)
	{
	*(destination++) = *(source++);
	}
	// default zero to undefined variables
	for (destination = &_bss_begin; destination < &_bss_end;)
	{
	*(destination++) = 0;
	}
	
	// starting main program
	main();
}

void default_handler(void)
{
	while (1)
	{
	//loop
	}
}

__attribute__ ((section(".interrupt_vector")))

void (* const table_interrupt_vector[])(void) = 
{
	(void *) &_stack_end,
	Reset_Handler,              // Reset Handler
	NMI_Handler,                // NMI Handler
	HardFault_Handler,          // Hard Fault Handler
	MemManage_Handler,          // MPU Fault Handler
	BusFault_Handler,           // Bus Fault Handler
	UsageFault_Handler,         // Usage Fault Handler
	0,                          // Reserved
	0,                          // Reserved
	0,                          // Reserved
	0,                          // Reserved
	SVC_Handler,                // SVCall Handler
	DebugMon_Handler,           // Debug Monitor Handler
	0,                          // Reserved
	PendSV_Handler,             // PendSV Handler
	SysTick_Handler,            // SysTick Handler

	// External Interrupts
	WWDG_IRQHandler,            // Window Watchdog
	PVD_IRQHandler,             // PVD through EXTI Line detect
	TAMPER_IRQHandler,          // Tamper
	RTC_IRQHandler,             // RTC
	FLASH_IRQHandler,           // Flash
	RCC_IRQHandler,             // RCC
	EXTI0_IRQHandler,           // EXTI Line 0
	EXTI1_IRQHandler,           // EXTI Line 1
	EXTI2_IRQHandler,           // EXTI Line 2
	EXTI3_IRQHandler,           // EXTI Line 3
	EXTI4_IRQHandler,           // EXTI Line 4
	DMA1_Channel1_IRQHandler,   // DMA1 Channel 1
	DMA1_Channel2_IRQHandler,   // DMA1 Channel 2
	DMA1_Channel3_IRQHandler,   // DMA1 Channel 3
	DMA1_Channel4_IRQHandler,   // DMA1 Channel 4
	DMA1_Channel5_IRQHandler,   // DMA1 Channel 5
	DMA1_Channel6_IRQHandler,   // DMA1 Channel 6
	DMA1_Channel7_IRQHandler,  // DMA1 Channel 7
	ADC1_2_IRQHandler,          // ADC1_2
	USB_HP_CAN1_TX_IRQHandler,  // USB High Priority or CAN1 TX
	USB_LP_CAN1_RX0_IRQHandler, // USB Low  Priority or CAN1 RX0
	CAN1_RX1_IRQHandler,        // CAN1 RX1
	CAN1_SCE_IRQHandler,        // CAN1 SCE
	EXTI9_5_IRQHandler,         // EXTI Line 9..5
	TIM1_BRK_IRQHandler,        // TIM1 Break
	TIM1_UP_IRQHandler,         // TIM1 Update
	TIM1_TRG_COM_IRQHandler,    // TIM1 Trigger and Commutation
	TIM1_CC_IRQHandler,         // TIM1 Capture Compare
	TIM2_IRQHandler,            // TIM2
	TIM3_IRQHandler,            // TIM3
	TIM4_IRQHandler,            // TIM4
	I2C1_EV_IRQHandler,         // I2C1 Event
	I2C1_ER_IRQHandler,         // I2C1 Error
	I2C2_EV_IRQHandler,         // I2C2 Event
	I2C2_ER_IRQHandler,         // I2C2 Error
	SPI1_IRQHandler,            // SPI1
	SPI2_IRQHandler,            // SPI2
	USART1_IRQHandler,          // USART1
	USART2_IRQHandler,          // USART2
	USART3_IRQHandler,          // USART3
	EXTI15_10_IRQHandler,       // EXTI Line 15..10
	RTCAlarm_IRQHandler,        // RTC Alarm through EXTI Line
	USBWakeUp_IRQHandler       // USB Wakeup from suspend
};
