# file    	Makefile
# copyright 	Copyright (c) 2012 Toradex AG
# author  	Max Krummenacher <max.krummenacher@toradex.com>
# brief   	This makefile builds the project fb-draw 

SYSROOT = --sysroot=/usr/local/oecore-x86_64/sysroots/armv7at2hf-neon-angstrom-linux-gnueabi
CROSS_COMPILE ?= /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-

CXXFLAGS  += -Wall -fsigned-char -O0 -s -Wno-write-strings -Wno-switch -ggdb -march=armv7-a -mthumb -mfpu=neon  -mfloat-abi=hard ${SYSROOT}
CFLAGS    += -Wall -fsigned-char -O0 -s -Wno-deprecated-declarations -Wno-write-strings -Wno-switch -ggdb -march=armv7-a -mthumb -mfpu=neon  -mfloat-abi=hard ${SYSROOT}

CC = $(CROSS_COMPILE)gcc
STRIP ?= $(CROSS_COMPILE)strip

CFLAGS ?= -Wall -g -O2
LDFLAGS ?=

PROG = sequoia

OBJS = $(PROG).o

all: $(OBJS) 
	$(CC) -o $(PROG) $(OBJS) $(LDFLAGS) $(CFLAGS)
	#$(STRIP) $(PROG)

%o: %c 
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $<
	
clean:
	rm -f $(PROG) $(OBJS) *~ 2>/dev/null

install:
	install -d $(DESTDIR)$(prefix)/bin
	install -m 0755 $(PROG) $(DESTDIR)$(prefix)/bin

.PHONY : all clean install
