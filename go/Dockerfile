FROM io4io/blank-3.12.0:1.0.0

# Install Go.
RUN curl -sL https://golang.org/dl/go1.16.13.linux-amd64.tar.gz -o /tmp/go.tar.gz
RUN tar zxf /tmp/go.tar.gz -C /opt

# Install Go tools, for vscode "golang.go" extension.
ENV GOPATH=/opt/go
RUN /opt/go/bin/go get -v github.com/uudashr/gopkgs/v2/cmd/gopkgs
RUN /opt/go/bin/go get -v github.com/ramya-rao-a/go-outline
RUN /opt/go/bin/go get -v github.com/cweill/gotests/...
RUN /opt/go/bin/go get -v github.com/fatih/gomodifytags
RUN /opt/go/bin/go get -v github.com/josharian/impl
RUN /opt/go/bin/go get -v github.com/haya14busa/goplay/cmd/goplay
RUN /opt/go/bin/go get -v github.com/go-delve/delve/cmd/dlv
RUN ln -s /opt/go/bin/dlv /opt/go/bin/dlv-dap
RUN /opt/go/bin/go get -v honnef.co/go/tools/cmd/staticcheck
RUN /opt/go/bin/go get -v golang.org/x/tools/gopls

# User GO environment settings.
# unset GOPATH
ENV GOPATH=
ENV PATH="/root/go/bin:/opt/go/bin:${PATH}"