FROM harbor.cloudminds.com/library/ubuntu:bionic.CM-Beta-1.3
LABEL maintainer shon.li
USER root

RUN  mkdir -p /logs && \
     apt-get install -y vim logrotate rsyslog cron tcpdump net-tools

COPY startup.sh /
COPY logrotate.rsyslog /etc/logrotate.d/rsyslog
COPY logrotate.probelog /etc/logrotate.d/probelog
COPY rsyslog.conf /etc/rsyslog.conf
COPY rsyslog.conf.probelog /etc/rsyslog.d/probelog

ENV PROJECT=mcs
ENV MODULE=falcon-probelog
ENV LOGPATH=/logs

WORKDIR /

EXPOSE 514/tcp 514/udp

# Start
CMD ["./startup.sh"]
