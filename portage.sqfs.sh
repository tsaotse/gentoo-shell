umount -l /usr/portage
sleep 1
mv -v /home/gentoo-current.xz.sqfs /home/old.gentoo-current.xz.sqfs
sleep 1
wget -c -O /home/gentoo-current.xz.sqfs --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/gentoo/snapshots/squashfs/gentoo-current.xz.sqfs
sleep 1
mount /home/gentoo-current.xz.sqfs /usr/portage
sleep 1
/bin/cp -a /var/cache/eix/portage.eix /var/cache/eix/previous.eix
sleep 1
/usr/bin/eix-update
sleep 1
/usr/bin/eix-diff
