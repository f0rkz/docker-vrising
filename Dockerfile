FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
RUN apt update -yq && \
    apt install -y --no-install-recommends \
        wget \
        ca-certificates \
        software-properties-common \
        lsb-release \
        gnupg \
        curl \
        xvfb 

RUN wget -O- https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
RUN apt update -yq && \
    apt install -y --no-install-recommends \
        winehq-stable

RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget -O- "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
RUN /steamcmd/steamcmd.sh +quit

RUN  mkdir -p /root/.wine/drive_c/VRisingServer/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +755 /entrypoint.sh

EXPOSE 27015/udp
EXPOSE 27016/udp

ENTRYPOINT [ "/entrypoint.sh" ]