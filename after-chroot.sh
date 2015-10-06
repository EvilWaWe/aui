cat >> /etc/locale.gen <<- EOF
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8
EOF

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

echo Helium > /etc/hostname

rm -f /etc/hosts > /dev/null 2>&1
echo "127.0.0.1       localhost.localdomain   localhost \${hostnm}" >> /etc/hosts 
echo "::1             localhost.localdomain   localhost \${hostnm}" >> /etc/hosts

pacman -S --noconfirm dialog wpa_supplicant
systemctl enable dhcpcd@\$(ls /sys/class/net/ | grep e)

echo "root:\l" | chpasswd

pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
