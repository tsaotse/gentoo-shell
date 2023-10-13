### local.overlay.gentoo-zh ###
umount -l /usr/local/overlay/gentoo-zh
sleep 1
mv -v /home/gentoo-zh.zx.sqfs /home/old.gentoo-zh.zx.sqfs
sleep 1
rm -rfv /tmp/gentoo-zh*
sleep 1
wget -c -O /tmp/gentoo-zh.zip https://ghproxy.com/https://github.com/microcai/gentoo-zh/archive/refs/heads/master.zip
sleep 1
unzip /tmp/gentoo-zh.zip -d /tmp
sleep 1
mksquashfs /tmp/gentoo-zh-master/ /home/gentoo-zh.zx.sqfs -comp xz
sleep 1
mount /home/gentoo-zh.zx.sqfs /usr/local/overlay/gentoo-zh
#####
