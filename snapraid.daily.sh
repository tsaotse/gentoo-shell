export LANG=C
/usr/bin/echo '#####'
/usr/bin/date
/usr/bin/echo 'start mergerfs balance'
/usr/bin/echo '#####'
/usr/bin/python3 /sbin/mergerfs.balance /srv/mergerfs/mypool
/usr/bin/echo '#####'
/usr/bin/echo 'end mergerfs balance'
for conf in /etc/snapraid/omv-snapraid-*.conf; do
	{
		/usr/bin/echo 'start snapraid daily'
		/usr/bin/echo '#####'
		/usr/bin/echo 'start snapraid diff'
		/usr/bin/echo '#####'
		/usr/bin/snapraid -c ${conf} diff
		/usr/bin/echo '#####'
		/usr/bin/echo 'end snapraid diff'
		/usr/bin/echo '#####'
		/usr/bin/echo 'start snapraid sync'
		/usr/bin/echo '#####'
		/usr/bin/snapraid -c ${conf} touch
		/usr/bin/echo '#####'
		/usr/bin/snapraid -c ${conf} sync
		/usr/bin/echo '#####'
		/usr/bin/echo 'end snapraid sync'
		/usr/bin/echo '#####'
		/usr/bin/date
		/usr/bin/echo 'end snapraid daily'
	}
done
