TOOLCHAIN=$(CURDIR)/build/toolchain/usr/

.EXPORT_ALL_VARIABLES:

toolchain:
	cp build/buildroot_config build/buildroot/.config
	$(MAKE) -C build/buildroot

tests: toolchain
	make -e -C tests

libs: toolchain
	make -e -C lib

install:	install-host install-card

install-host: toolchain

install-card: toolchain
	
