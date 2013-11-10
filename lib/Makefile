ARCH=arm-buildroot-linux-uclibcgnueabi

LD_LIBRARY_PATH=$(TOOLCHAIN)lib

CC=$(TOOLCHAIN)bin/$(ARCH)-cc
CPP=$(TOOLCHAIN)bin/$(ARCH)-cpp
LD=$(TOOLCHAIN)bin/$(ARCH)-ld
GCC=$(TOOLCHAIN)bin/$(ARCH)-gcc
RANLIB=$(TOOLCHAIN)bin/$(ARCH)-ranlib
STRIP=$(TOOLCHAIN)bin/$(ARCH)-strip

LDFLAGS=-static
CFLAGS=

.EXPORT_ALL_VARIABLES:

all: ssl

ssl: openssl
	cd openssl &&./Configure linux-generic32 -static && cd ..
	make -e -C openssl 


