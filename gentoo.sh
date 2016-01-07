#!/bin/bash -x
swap=/dev/sda3
root=/dev/sda4
boot=/dev/sda2
#mkswap $swap
swapon $swap
mount $root /mnt/gentoo
mount $boot /mnt/gentoo/boot
cp -L /etc/resolv.conf /mnt/gentoo/etc/
mount -t proc proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
#chroot /mnt/gentoo /bin/bash
#source /etc/profile
#export PS1="(chroot) $PS1"
