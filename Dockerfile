FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install inkscape -y
RUN apt-get install -y openbox tightvncserver firefox xterm curl wget tint2 libnss3 libnspr4 libgbm1
RUN apt-get install unzip -y

RUN useradd -ms /bin/bash vnc
USER vnc
WORKDIR /home/vnc

USER root
COPY resources/entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

WORKDIR /tmp
RUN wget https://github.com/ikae/MI-GRBL-Z-AXIS-Servo-Controller/archive/refs/heads/master.zip
RUN unzip master.zip
RUN mv MI-GRBL-Z-AXIS-Servo-Controller-master/* /usr/share/inkscape/extensions

COPY resources/xstartup /home/vnc/xstartup
RUN chown vnc:vnc /home/vnc/xstartup

USER vnc
RUN mkdir ~/.vnc \
    && echo "forabozo" | vncpasswd -f > ~/.vnc/passwd \
    && chmod 600 ~/.vnc/passwd \
    && mv /home/vnc/xstartup ~/.vnc/ \
    && chmod +x ~/.vnc/xstartup

ENV USER=vnc
ENV HOME=/home/vnc
WORKDIR /home/vnc

EXPOSE 5901
ENTRYPOINT [ "/opt/entrypoint.sh" ]
