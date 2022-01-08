loadkeys it
timedatactl set-ntp true
cfdisk
mkfs.fat -F 32 /dev/vda1
mkfs.ext4 /dev/vda2
mount /dev/vda2 /mnt
pacstrap /mnt base linux linux-firmware grub efibootmgr amd-ucode networkmanager vim sudo virtualbox-guest-utils
genfstab -U /mnt >> /mnt/etc/fstab
chmod 777 ./inst2.sh
cp ./inst2.sh /mnt
arch-chroot /mnt &
