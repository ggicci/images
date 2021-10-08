# Stage 1: download go from golang.org
FROM codercom/code-server:3.12.0 AS goruntime

RUN curl -sL https://golang.org/dl/go1.16.9.linux-amd64.tar.gz -o /tmp/go.tar.gz
RUN tar zxf /tmp/go.tar.gz -C /tmp


# Stage 2: prepare go environment
FROM codercom/code-server:3.12.0

COPY --from=goruntime /tmp/go /go

ENV PATH="/go/bin:${PATH}"

RUN sudo apt update \
    && sudo apt install -y apt-transport-https ca-certificates build-essential

# Add bootstrap.sh
ADD --chmod=755 bootstrap.sh /usr/bin/bootstrap.sh

ENTRYPOINT [ "/usr/bin/bootstrap.sh" ]
