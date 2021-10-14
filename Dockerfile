FROM ubuntu:20.04
MAINTAINER Matthias Riegler <matthias@xvzf.tech>

ENV USER steam
ENV HOME /home/${USER}
ENV STEAMCMD ${HOME}/steamcmd

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install lib32gcc1 curl net-tools lib32stdc++6 python3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd $USER \
    && mkdir $HOME \
    && chown $USER:$USER $HOME \
    && mkdir $STEAMCMD \
    && chown $USER:$USER $STEAMCMD


USER $USER

# Install steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"  | tar xz -C $STEAMCMD

WORKDIR $STEAMCMD
