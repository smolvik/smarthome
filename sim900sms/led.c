#include "stm32f10x.h"

// LED connected to PIN 13 of GPIOC
#define LED_PIN         13
// output mode: push-pull + 50MHz
#define OUTPUT_MODE     (0x03) 

void led_init()
{
	// set LED pin output mode
    GPIOC->CRH |= OUTPUT_MODE << ((LED_PIN-8) << 2); // if pins 8 to 15 	    
}

void led_on()
{
	GPIOC->ODR &= ~(1<<LED_PIN); // set LED on
}

void led_off()
{
	GPIOC->ODR |= (1<<LED_PIN);  // set LED off
}

void led_tog()
{
	GPIOC->ODR ^= (1<<LED_PIN);  // set LED off
}
