
buildroot:
	cp build/buildroot_config build/buildroot/.config
	$(MAKE) -C build/buildroot
