### local.overlay.src-prepare-overlay ###
umount -l /usr/local/overlay/src_prepare-overlay
sleep 1
mv -v /home/src_prepare-overlay.zx.sqfs /home/old.src_prepare-overlay.zx.sqfs
sleep 1
rm -rfv /tmp/src_prepare-overlay*
sleep 1
wget -c -O /tmp/src_prepare-overlay.zip https://ghproxy.com/https://github.com/gentoo-mirror/src_prepare-overlay/archive/refs/heads/master.zip
sleep 1
unzip /tmp/src_prepare-overlay.zip -d /tmp
sleep 1
mksquashfs /tmp/src_prepare-overlay-master/ /home/src_prepare-overlay.zx.sqfs -comp xz
sleep 1
mount /home/src_prepare-overlay.zx.sqfs /usr/local/overlay/src_prepare-overlay
#####
