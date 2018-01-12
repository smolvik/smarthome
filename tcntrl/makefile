all: tcntrl

#CC=gcc
#STRIP=strip

CC=mipsel-openwrt-linux-uclibc-gcc
STRIP=mipsel-openwrt-linux-uclibc-strip

LIBS=-lpthread -lm

tcntrl: tcntrl.c
	$(CC) $(OPTS) tcntrl.c -o $@ $(LIBS)
	$(STRIP) $@

clean:
	rm tcntrl 


