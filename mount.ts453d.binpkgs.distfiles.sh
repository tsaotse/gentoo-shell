mount -l /home/binpkgs
mount -l /home/distfiles
sleep 5
mount -t nfs -o timeo=600,retrans=3 192.168.1.50:/share/gentoo/binpkgs /home/binpkgs
mount -t nfs -o timeo=600,retrans=3 192.168.1.50:/share/gentoo/distfiles /home/distfiles
df -h
