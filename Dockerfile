FROM debian:buster

LABEL maintainer="info@enforge.de"

# install prerequisites
RUN \
  apt update && \
  apt upgrade -y && \
  apt install -y \
    software-properties-common \
    sudo apt install libsdl2-2.0-0 \
  && \
  apt autoremove -y && \
  apt autoclean

# install steamcmd
RUN apt-add-repository non-free && \
  dpkg --add-architecture i386 && \
  apt update && \
  echo steam steam/question select "I AGREE" | debconf-set-selections && \
    # automatically agree to licence terms
  echo steam steam/license note '' | debconf-set-selections && \
    # disable license note text, so scolling won't be required
  apt install -y steamcmd


RUN adduser --disabled-password steam
WORKDIR /home/steam
USER steam

CMD /usr/games/steamcmd +quit
