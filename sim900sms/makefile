##################################
# stm32 minimal example Makefile
##################################

CC = arm-none-eabi-gcc
LD = arm-none-eabi-gcc
CP = arm-none-eabi-objcopy
GDB = arm-none-eabi-gdb

LIBPATH = ../STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/
USBLIBPATH = ../STM32_USB-FS-Device_Lib_V4.0.0/Libraries/STM32_USB-FS-Device_Driver/

LKR_SCRIPT = stm32f103c8.ld
FAMILY = STM32F10X_MD
INCLUDES =  -I$(LIBPATH)CMSIS/CM3/DeviceSupport/ST/STM32F10x/
INCLUDES +=	-I$(LIBPATH)CMSIS/CM3/CoreSupport/ 
INCLUDES +=	-I$(LIBPATH)STM32F10x_StdPeriph_Driver/inc/
INCLUDES +=	-I$(USBLIBPATH)/inc/


CFLAGS  = -c -fno-common -nostdlib -fno-builtin -ffreestanding -O0 -g
CFLAGS  += -mcpu=cortex-m3 -mthumb -D$(FAMILY) $(INCLUDES) 
LFLAGS  = -t -v -mcpu=cortex-m3 -mthumb -nostartfiles -T$(LKR_SCRIPT) --specs=my.specs 
CPFLAGS = -Obinary

sources := $(wildcard *.c)
objects :=  $(patsubst %.c,%.o,$(wildcard *.c))

.PHONY: all clean write debug

all: test.bin

%.o: %.c
	$(CC) $(CFLAGS) -o $@ $<	

test.elf: $(objects)
	$(LD) $(LFLAGS) -o $@ $^

test.bin: test.elf
	$(CP) $(CPFLAGS) $< $@
	arm-none-eabi-objdump -d test.elf > test.s
clean:
	rm -rf *.o *.elf *.bin

write:
	../stlink/st-flash write test.bin 0x08000000
debug:
	$(GDB) -ex "target remote localhost:4242" test.elf

