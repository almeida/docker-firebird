FROM debian:jessie
MAINTAINER Thyago Almeida <thyagoaa@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#Install firebird
RUN \
  apt-get update && \
  apt-get install -y firebird2.5-super && \
  sed -ri 's/RemoteBindAddress = localhost/RemoteBindAddress = /g' /etc/firebird/2.5/firebird.conf && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# forward logs to docker log collector
RUN ln -sf /dev/stdout /var/log/firebird/firebird2.5.log

VOLUME /var/lib/firebird/2.5/data
VOLUME /var/lib/firebird/2.5/backup

EXPOSE 3050

CMD ["/usr/sbin/fbguard"]