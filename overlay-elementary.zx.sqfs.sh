### local-overlay-elementary ###
umount -l /usr/local/overlay/elementary
sleep 1
mv -v /home/elementary.zx.sqfs /home/old.elementary.zx.sqfs
sleep 1
wget -c -O /tmp/elementary.zip https://ghproxy.com/https://github.com/pimvullers/elementary/archive/refs/heads/master.zip
sleep 1
unzip /tmp/elementary.zip -d /tmp
sleep 1
mksquashfs /tmp/elementary-master/ /home/elementary.zx.sqfs -comp xz
sleep 1
mount /home/elementary.zx.sqfs /usr/local/overlay/elementary
