FROM debian:buster

LABEL maintainer="info@enforge.de"

### update os
RUN apt-get update && \
apt-get upgrade -y && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /tmp/* /var/tmp/* /var/cache/apt/* /var/cache/distfiles/*

### startup command
CMD cd /example; /bin/bash run.sh
