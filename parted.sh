# /dev/sda 546.8G  600M
# /dev/sda 546.2G  80G
# /dev/sda 466.2G  466.2G
#
# the first is UEFI /boot  600M big
# the second is     /      80GB big
# the third is      /home  464.2GB big
# the reminder is swap

fdisk -u /dev/sda << EOFDISK
n
p


+600M
n
p


+80G
n
p


+464.2G
n
p



w
EOFDISK

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 -L GENTOOROOT /dev/sda2
mkfs.ext4 -L GENTOOHOME /dev/sda3
mkswap    -L GENTOOWAP /dev/sda4

mount  /dev/sda2 /mnt/gentoo
mkdir  /mnt/gentoo/boot
mount  /dev/sda1 /mnt/gentoo/boot
mkdir  /mnt/gentoo/home
mount  /dev/sda3 /mnt/gentoo/home
swapon /dev/sda4
