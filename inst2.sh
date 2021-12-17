ln -sf /usr/share/zoneinfo/Europe/Rome /etc/loacltime
hwclock --systohc
echo "it_IT.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo LANG=it_IT.UTF-8 > etc/locale.conf
echo KEYMAP=it > /etc/vsconsole.conf
echo virt > /etc/hostname
echo "127.0.0.1 localhost.localdomain virt" > /etc/hosts
echo "root:pass" | chpasswd
mkdir /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
grub-install --target=x86_64-efi --efi-directory=/mnt/boot/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
useradd -m -g users -G wheel -s /bin/bash virt
echo "virt:pass" | chpasswd
EDITOR=vim visudo
exit
