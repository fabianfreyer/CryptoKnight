ARCH=arm-buildroot-linux-uclibcgnueabi

LD_LIBRARY_PATH=$(TOOLCHAIN)lib

CC=$(TOOLCHAIN)bin/$(ARCH)-cc
CPP=$(TOOLCHAIN)bin/$(ARCH)-cpp
LD=$(TOOLCHAIN)bin/$(ARCH)-ld
GCC=$(TOOLCHAIN)bin/$(ARCH)-gcc
RANLIB=$(TOOLCHAIN)bin/$(ARCH)-ranlib
STRIP=$(TOOLCHAIN)bin/$(ARCH)-strip

LDFLAGS=-static
CFLAGS=-Wno-error

.EXPORT_ALL_VARIABLES:

all: ssl

ssl: openssl
	make -e -C openssl 

