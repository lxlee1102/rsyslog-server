FROM harbor.cloudminds.com/library/ubuntu:bionic.CM-Beta-1.3
LABEL maintainer shon.li
USER root

RUN  mkdir -p /logs/ && \
     mkdir -p /etc/rsyslog.d/ && \
     mkdir -p /etc/logrotate.d/ && \
     apt-get install -y bash git wget curl vim logrotate rsyslog

COPY startup.sh /
COPY localtime.shanghai /etc/localtime 
COPY logrotate.rsyslog /etc/logrotate.d/rsyslog
COPY logrotate.falcon /etc/logrotate.d/falcon
COPY logrotate.mcs /etc/logrotate.d/mcs
COPY rsyslog.conf /etc/rsyslog.conf
COPY rsyslog.conf.falcon /etc/rsyslog.d/falcon
COPY rsyslog.conf.mcs /etc/rsyslog.d/mcs

ENV PROJECT=mcs
ENV MODULE=logs
ENV LOGPATH=/logs

WORKDIR /

EXPOSE 514/tcp 514/udp

# Start
CMD ["./startup.sh"]
