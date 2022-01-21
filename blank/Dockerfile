FROM codercom/code-server:3.12.0

USER root
RUN apt update && apt install -y apt-transport-https ca-certificates build-essential

WORKDIR /root
COPY boot.sh /usr/bin/boot.sh
COPY ./startup/* /opt/io4run/startup/
RUN chmod +x /usr/bin/boot.sh /opt/io4run/startup/*.sh

ENTRYPOINT [ "/usr/bin/boot.sh" ]
