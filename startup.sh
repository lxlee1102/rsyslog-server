#!/bin/bash

/usr/sbin/cron

if [ -f "/var/run/rsyslogd.pid" ] ; then
	rm -rf /var/run/rsyslogd.pid
fi

exec /usr/sbin/rsyslogd -n -f /etc/rsyslog.conf -i /var/run/rsyslogd.pid
