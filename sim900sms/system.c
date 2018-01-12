#include "stm32f10x.h"
#include "led.h"
#include "math.h"

#define FLT_2ORD 5
#define FLT_SZ (1<<FLT_2ORD)

// output mode: push-pull + 50MHz
#define OUTPUT_MODE     (0x03) 
#define SYS_TICKS	9000 // 1ms

uint32_t system_time = 0;
uint32_t system_but = 0;

uint16_t adc_data = 0;

uint16_t comp_threshold = 2000;
uint16_t alarm_tmax = 1489;
uint16_t alarm_tmin = 992;
uint16_t fAlarm = 0;
uint16_t fSig = 1;
uint16_t tAlrm =0;

uint32_t fPwrEvent = 0;
uint32_t fSigPwrOff = 1;
uint32_t fSigPwrOn = 1;

uint16_t flt_buff[FLT_SZ];
uint32_t flt_accum= 0;
uint32_t flt_idx = 0; 
uint32_t pwron_alrm_cnt = 0;
uint32_t pwroff_alrm_cnt = 0;

void deln(uint32_t n)
{
	while(n--){asm("nop");}		
}

void init_adc_flt(void)
{
	int i;
	
	for(i = 0; i < FLT_SZ; i++)
	{
		flt_buff[i] = 0;
	}
}

void system_init (void)
{
	// enable HSE high speed external oscillator
	RCC->CR |= RCC_CR_HSEON;
	while (!(RCC->CR & RCC_CR_HSERDY)) {};
		
	// setting PLL
	RCC->CFGR &= ~((RCC_CFGR_PLLSRC|RCC_CFGR_PLLXTPRE|RCC_CFGR_PLLMULL));
	RCC->CFGR |= RCC_CFGR_PLLSRC_HSE;       // Тактировать PLL от HSE (8 MHz).
	RCC->CFGR |= RCC_CFGR_PLLMULL9;         // Умножать частоту на 9 (8*9=72 MHz).
	RCC->CFGR &= ~RCC_CFGR_USBPRE;			// USB Device prescaler 1.5 72*1.5 = 48 MHz
	
	RCC->CR |= RCC_CR_PLLON;                // Запустить PLL.
	while ((RCC->CR & RCC_CR_PLLRDY)==0) {} // Ожидание готовности PLL.

	FLASH->ACR |= FLASH_ACR_PRFTBE;         // Enable Prefetch Buffer.
	FLASH->ACR &= ~FLASH_ACR_LATENCY;       // Предочистка.
    FLASH->ACR |= FLASH_ACR_LATENCY_2;      // Если 48< SystemCoreClock <= 72, пропускать 2 такта.	
    
	RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;		// APB1 clock = 72/2 = 36 MHz   
	    
    // system clocking       
    RCC->CFGR &=~RCC_CFGR_SW;              						// Очистить биты SW0, SW1.
	RCC->CFGR |= RCC_CFGR_SW_PLL;           					// Тактирование с выхода PLL.
	while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_PLL) {} 	// Ожидание переключения на PLL 
	
	RCC->APB2ENR |= (RCC_APB2ENR_IOPAEN | RCC_APB2ENR_AFIOEN);  // PA enable and alternate 
																// functions of the ports enable
																
    RCC->APB1ENR |= RCC_APB1ENR_USBEN; 							// usb enable
    RCC->APB2ENR |= RCC_APB2ENR_USART1EN;  						// uart1 enable
    RCC->APB1ENR |= RCC_APB1ENR_USART2EN; 						// uart2 enable

	//enable clock on GPIOC and GPIOB peripheral
    RCC->APB2ENR |= (RCC_APB2ENR_IOPCEN | RCC_APB2ENR_IOPBEN);
    
    // init pin PB5
    GPIOB->CRL &= ~0x00f00000;
    GPIOB->CRL |= (OUTPUT_MODE << (5 << 2)); 
    
    // init pin PB6
    GPIOB->CRL &= ~(GPIO_CRL_MODE6 | GPIO_CRL_CNF6);
    GPIOB->CRL |= GPIO_CRL_MODE6_0 | GPIO_CRL_MODE6_1;
    GPIOB->CRL |= GPIO_CRL_CNF6_0; // open drain
    
	// set sys tick timer
	SysTick->LOAD  = (SYS_TICKS-1);      		   // set reload register 
	SysTick->VAL   = 0;                            // Load the SysTick Counter Value 
	SysTick->CTRL  = SysTick_CTRL_TICKINT_Msk |    // Enable SysTick IRQ and SysTick Timer 
                     SysTick_CTRL_ENABLE_Msk;      // freq for sync = freq cpu/8     
                     
    // ext line interrupts
	EXTI->IMR |= EXTI_IMR_MR4;  				// enable interrupt from line4
	EXTI->RTSR |= EXTI_RTSR_TR4; 				// enable rising trigger for line4
	EXTI->FTSR |= EXTI_FTSR_TR4; 				// enable falling trigger for line4
	
	AFIO->EXTICR[1] &= ~AFIO_EXTICR2_EXTI4_PB;	// map port PB4 to line4
	AFIO->EXTICR[1] |= AFIO_EXTICR2_EXTI4_PB;	//
	
	NVIC_EnableIRQ(EXTI4_IRQn);					// enable int exti4
	
	// adc init
	// enable clocking of and adc
	RCC->APB2ENR |= RCC_APB2ENR_ADC1EN;
	RCC->CFGR |= RCC_CFGR_ADCPRE_DIV8; // adc = 72/8 = 9 MHz
	
	// set PA0 as analog input
	GPIOA->CRL &= ~(GPIO_CRL_CNF0 | GPIO_CRL_MODE0);
	ADC1->CR2 |= ADC_CR2_ADON; // adc power on
	deln(20);
	// set sampling time
	ADC1->SMPR2 |= (ADC_SMPR2_SMP0_0 | ADC_SMPR2_SMP0_1 | ADC_SMPR2_SMP0_2);	
	//ADC1->SMPR2 |= (ADC_SMPR2_SMP0_0);

	// set triggering from external source 
	// SEL = 011 - TIM2_CC2
	ADC1->CR2 &= ~ADC_CR2_EXTSEL;
	ADC1->CR2 |= (ADC_CR2_EXTTRIG | ADC_CR2_EXTSEL_0 | ADC_CR2_EXTSEL_1);
	
	// enable analog watchdog and interrupts
	ADC1->HTR = 2000;
	ADC1->LTR = 1900;
	ADC1->CR1 |= (ADC_CR1_AWDEN | ADC_CR1_AWDIE | ADC_CR1_EOCIE);
	NVIC_EnableIRQ(ADC1_2_IRQn);
	
	// calibrate adc
	ADC1->CR2 |= ADC_CR2_RSTCAL;
	while(ADC1->CR2 & ADC_CR2_RSTCAL); // wait end of cal register initialisation
	ADC1->CR2 |= ADC_CR2_CAL;          // start calibration
	while(ADC1->CR2 & ADC_CR2_CAL);    // wait end of calibration	
		
	ADC1->SR = 0;	
	
	// enable analog watchdog and interrupts
	ADC1->HTR = 2000;
	ADC1->LTR = 1900;
	ADC1->CR1 |= (ADC_CR1_AWDEN | ADC_CR1_AWDIE | ADC_CR1_EOCIE);
	NVIC_EnableIRQ(ADC1_2_IRQn);	

	// TIM2
	RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; 
    // time base
	TIM2->PSC = 3600 - 1; // prescaller gets 10kHz
	TIM2->ARR = 1000 ;  // TIM2 period 10Hz
	TIM2->CCR2 = 500; 
	
	// pwm outputs
	TIM2->CCMR1 = 0x00000000;
	TIM2->CCMR1 |= TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2M_2 | TIM_CCMR1_OC2PE; //PWM mode 1 channel 2 preload enabled		
	TIM2->CCER |= TIM_CCER_CC2E; 						// output enable	
	TIM2->CR1 |= TIM_CR1_CEN; 							// start TIM2	
	
	init_adc_flt();
	
	// watchdog
	IWDG->KR = 0x5555;
	IWDG->PR = IWDG_PR_PR_2;
	IWDG->KR = 0xCCCC; // start up
	
	// power on BKP
	RCC->APB1ENR |= RCC_APB1ENR_BKPEN | RCC_APB1ENR_PWREN;
}

int32_t code2temp(uint16_t n)
{
	float_t t = 0.0806*n - 50;
	return (int32_t)round(t);		
}

uint16_t temp2code(int32_t t)
{
	return round((10e-3*t+0.5)*4095/3.3);
}

uint16_t comp_get_threshold()
{
	return ADC1->HTR;
}

void comp_set_alarm_range(uint16_t l, uint16_t h)
{
	h &= 0x0fff;
	l  &= 0x0fff;

	alarm_tmax = h;
	alarm_tmin = l;	
}

void comp_set_threshold(uint16_t high)
{
	uint16_t low = high - 100;
	
	NVIC_DisableIRQ(ADC1_2_IRQn);
	
	high &= 0x0fff;
	low  &= 0x0fff;
	
	ADC1->HTR = high;
	ADC1->LTR = low;
	
	NVIC_EnableIRQ(ADC1_2_IRQn);
}

void system_PB5_on()
{
	GPIOB->ODR |= (1 << 5);
}

void system_PB5_off()
{
	GPIOB->ODR &= ~(1 << 5);
}

void system_PB6_on()
{
	GPIOB->ODR |= (1 << 6);
}

void system_PB6_off()
{
	GPIOB->ODR &= ~(1 << 6);
}

uint32_t system_restore_params()
{
	uint32_t ret = 0;
	
	PWR->CR |= PWR_CR_DBP; 
	if(BKP->DR1 == 0x4567)
	{
		// valid data - set params from BKP
		comp_set_threshold(BKP->DR2);
		comp_set_alarm_range(BKP->DR3, BKP->DR4);		
		ret = 1;
	}
	else
	{
		// set default params
		comp_set_threshold(temp2code(50));
		comp_set_alarm_range(temp2code(15), temp2code(70));
		
		BKP->DR2 = 	ADC1->HTR;
		BKP->DR3 = alarm_tmin;
		BKP->DR4 = alarm_tmax;
		BKP->DR1 = 0x4567;		
		
		ret = 0;
	}
	PWR->CR &= ~PWR_CR_DBP; 
	return  ret;
}

void system_backup_params()
{
	PWR->CR |= PWR_CR_DBP; 
	
	BKP->DR2 = 	ADC1->HTR;
	BKP->DR3 = alarm_tmin;
	BKP->DR4 = alarm_tmax;
	BKP->DR1 = 0x4567;

	PWR->CR &= ~PWR_CR_DBP; 
}

uint16_t get_fault_flag()
{
	uint16_t ret;
	PWR->CR |= PWR_CR_DBP; 	
	ret = BKP->DR5;
	PWR->CR &= ~PWR_CR_DBP; 
	
	if(ret == 0x4567) return 1;
	return 0;
}

void clr_fault_flag()
{
	PWR->CR |= PWR_CR_DBP; 	
	BKP->DR5 = 0x0000;	
	PWR->CR &= ~PWR_CR_DBP; 
}

void set_fault_flag()
{
	PWR->CR |= PWR_CR_DBP; 	
	BKP->DR5 = 0x4567;	
	PWR->CR &= ~PWR_CR_DBP; 
}

// There are IRQ handlers

void SysTick_Handler(void)
{
	// every 1 ms
	system_time ++;
}

EXTI4_IRQHandler()
{
	if(EXTI->PR & EXTI_PR_PR4)
	{
		EXTI->PR |= EXTI_PR_PR4;
		//led_tog();
		system_but ^= 0x01;
		pwroff_alrm_cnt = 0;
		pwron_alrm_cnt = 0;
	}	
}

ADC1_2_IRQHandler()
{
	//led_tog();
	
	if(0 == (GPIOB->IDR & GPIO_IDR_IDR4)) pwroff_alrm_cnt++;
	else pwron_alrm_cnt++;
	
	if(ADC1->SR & ADC_SR_EOC){
		
		flt_accum += (uint16_t)ADC1->DR;
		flt_accum -= flt_buff[flt_idx];
		flt_buff[flt_idx] = (uint16_t)ADC1->DR;
		flt_idx = (flt_idx+1) & (FLT_SZ - 1);
		
		adc_data = (uint16_t)(flt_accum >> FLT_2ORD);
		//adc_data = (uint16_t)ADC1->DR;
		if(fAlarm) fAlarm = ((adc_data > (alarm_tmax-50)) || (adc_data < (alarm_tmin+50)));
		else fAlarm = ((adc_data > (alarm_tmax)) || (adc_data < (alarm_tmin)));		
	}
	if(ADC1->SR & ADC_SR_AWD){
		ADC1->SR &= ~ADC_SR_AWD;
		
		if(ADC1->DR > ADC1->HTR){
			led_off();
		}
		else if(ADC1->DR < ADC1->LTR){
			led_on();
		}
	}	
}

void TIM2_IRQHandler(void)
{
	if(TIM2->SR & TIM_SR_CC2IF){
		TIM2->SR &= ~TIM_SR_CC2IF; //Сбрасываем флаг UIF
		//led_tog();			
	}	
}
