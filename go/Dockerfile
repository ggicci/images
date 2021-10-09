# Stage 1: download go from golang.org
FROM codercom/code-server:3.12.0 AS goruntime

RUN curl -sL https://golang.org/dl/go1.16.9.linux-amd64.tar.gz -o /tmp/go.tar.gz
RUN sudo tar zxf /tmp/go.tar.gz -C /

ENV PATH="/go/bin:${PATH}"

# pre-install tools for vscode "golang.go" extension
RUN go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs
RUN go get -v github.com/ramya-rao-a/go-outline
RUN go get -v github.com/cweill/gotests/...
RUN go get -v github.com/fatih/gomodifytags
RUN go get -v github.com/josharian/impl
RUN go get -v github.com/haya14busa/goplay/cmd/goplay
RUN go get -v github.com/go-delve/delve/cmd/dlv
RUN go get -v honnef.co/go/tools/cmd/staticcheck
RUN go get -v golang.org/x/tools/gopls

# Stage 2: prepare go environment
FROM codercom/code-server:3.12.0

COPY --from=goruntime /go /go
COPY --from=goruntime /home/coder/go/bin/* /go/bin/

# default GOPATH: /home/coder/go
ENV PATH="/home/coder/go/bin:/go/bin:${PATH}"

RUN sudo apt update \
    && sudo apt install -y apt-transport-https ca-certificates build-essential


COPY bootstrap.sh /usr/bin/bootstrap.sh

ENTRYPOINT [ "/usr/bin/bootstrap.sh" ]
