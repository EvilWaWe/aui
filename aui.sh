# 建立btrfs分区
mkfs.btrfs /dev/sda
mount /dev/sda /mnt
# 配置安装源
wget "https://www.archlinux.org/mirrorlist/?country=CN&protocol=http&ip_version=4" -O /tmp/mirrorlist
grep Server /tmp/mirrorlist | sed 's/^#//g' > /etc/pacman.d/mirrorlist
# 安装基本系统
pacstrap /mnt base base-devel
# 生成fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# 下载chroot脚本
wget 
# Chroot配置
arch-chroot /mnt /bin/bash -c "chmod u+x After-chroot.sh && ./After-chroot.sh"

# Umount all partitions
umount -R /mnt
echo "install finish!"
