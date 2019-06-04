FROM alpine:latest
LABEL maintainer shon.li
USER root

RUN  mkdir -p /logs/mgc/ && \
     mkdir -p /etc/rsyslog.d/ && \
     mkdir -p /etc/logrotate.d/ && \
     apk add --no-cache ca-certificates bash git wget curl vim logrotate

RUN  cd /etc/apk/keys && \
     wget http://alpine.adiscon.com/rsyslog@lists.adiscon.com-5a55e598.rsa.pub && \
     echo 'http://alpine.adiscon.com/3.7/stable' >> /etc/apk/repositories && \
     apk update && apk add rsyslog

COPY startup.sh /
COPY localtime.shanghai /etc/localtime 
COPY logrotate.rsyslog /etc/logrotate.d/rsyslog
COPY logrotate.mgc /etc/logrotate.d/falcon
COPY rsyslog.conf /etc/rsyslog.conf
COPY rsyslog.conf.falcon /etc/rsyslog.d/falcon

WORKDIR /

EXPOSE 514/tcp 514/udp

# Start
CMD ["./startup.sh"]
