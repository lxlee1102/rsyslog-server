#!/bin/bash

/usr/sbin/crond -b

exec /usr/sbin/rsyslogd -n -f /etc/rsyslog.conf -i /var/run/rsyslogd.pid
