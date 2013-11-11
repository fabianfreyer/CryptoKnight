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
	install -d card/CryptoKnight/bin
	#install buildroot-built binaries
	install build/buildroot/output/target/usr/bin/gpg \
		build/buildroot/output/target/usr/bin/gpg-zip \
		card/CryptoKnight/bin
	install build/buildroot/output/target/usr/bin/find card/CryptoKnight/bin
	install build/buildroot/output/target/usr/bin/time card/CryptoKnight/bin
	#install openssl binary
	install lib/openssl/apps/openssl card/CryptoKnight/bin
	#install sd-card scripts
	install scripts/boot card/CryptoKnight/bin
	install scripts/encrypt* card/CryptoKnight/bin
	install scripts/watcher card/CryptoKnight/bin
	install scripts/autorun.sh card
	
tarball: card.tar.gz host.tar.gz

card.tar.gz: install-card
	cd card
	tar cvzf $@ *
	cp $@ ..
	cd ..

host.tar.gz: install-host
	tar cvzf $@ host/
