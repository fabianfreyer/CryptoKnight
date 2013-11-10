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
	install -d host
	install scripts/decrypt* host
	install scripts/generate-keys host
	install scripts/firmware_extract_initrd3.sh host

install-card: toolchain libs
	install -d card/cryptonite/bin
	#install buildroot-built binaries
	install build/buildroot/output/target/usr/bin/gpg \
		build/buildroot/output/target/usr/bin/gpg-zip \
		card/cryptonite/bin
	install build/buildroot/output/target/usr/bin/find card/cryptonite/bin
	install build/buildroot/output/target/usr/bin/time card/cryptonite/bin
	#install openssl binary
	install lib/openssl/apps/openssl card/cryptonite/bin
	#install sd-card scripts
	install scripts/encrypt* card/cryptonite/bin
	install scripts/watcher card/cryptonite/bin
	install scripts/autorun.sh card
