export LANG=C
/usr/bin/echo '#####'
/usr/bin/date
/usr/bin/echo 'start snapraid weekly'
/usr/bin/echo '#####'
/usr/bin/echo 'start snapraid scrub'
/usr/bin/echo '#####'
for conf in /etc/snapraid/omv-snapraid-*.conf; do
	{
		/usr/bin/snapraid -c ${conf} scrub
	}
done
/usr/bin/echo '#####'
/usr/bin/echo 'end snapraid scrub'
/usr/bin/echo '#####'
/usr/bin/date
/usr/bin/echo 'end snapraid weekly'
