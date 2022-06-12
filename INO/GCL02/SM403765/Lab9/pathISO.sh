#!/bin/bash


cwd=$(pwd)

#pobranie obrazu
cd /tmp
wget -nc -O fedora.iso https://download.fedoraproject.org/pub/fedora/linux/releases/test/36_Beta/Server/x86_64/iso/Fedora-Server-netinst-x86_64-36_Beta-1.4.iso

mkdir -p /tmp/myfedora
cp $cwd/MyAnaconda-ks.cfg /tmp/myfedora

mount -t iso9660 -o loop fedora.iso /mnt

cd /mnt

tar cf - . | (cd /tmp/myfedora; tar xfp -)

# edycja iso
cd /tmp/myfedora

cp $cwd/grub.cfg ./EFI/BOOT

cp $cwd/isolinux.cfg ./isolinux

#budowanie

mkisofs -o MyFedora.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "MyFedora" .

mv MyFedora.iso /home/ubuntu/img

# wymontowanie
cd /tmp
umount /tmp/fedora.iso

#kasowanie 

rm -rf /tmp/myfedora