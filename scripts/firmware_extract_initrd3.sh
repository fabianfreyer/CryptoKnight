#!/bin/zsh

# Adapted from http://www.fernjager.net/post-8/sdcard
FIRMWARE_INITRAMFS3=WiFiSD_v1.8/Firmware_V1.8/initramfs3.gz
INITRD3_SIZE=`perl -e '@x=stat(shift);print $x[7]' $FIRMWARE_INITRAMFS3`
cat $FIRMWARE_INITRAMFS3 | tail -c `expr $INITRD3_SIZE - 8` > initramfs3-real.gz
gzip -dc initramfs3-real.gz > initramfs.cpio
rm initramfs3-real.gz
mkdir root; cd root
sudo cpio -i -d  < ../initramfs.cpio

