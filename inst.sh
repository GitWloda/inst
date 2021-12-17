loadkeys it
ping google.com || echo "ERRORE INTERNET" && exit
timedatactl set-ntp true
cfdisk
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cp ./inst2 /mnt
arch-chroot /mnt &
./inst2
