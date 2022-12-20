FROM debian:10

# install prerequisites
RUN apt install -y \
  software-properties-common \
  libsdl2-2.0-0

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
