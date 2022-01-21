FROM io4io/blank-3.12.0:1.0.0 AS builder

# docker build --build-arg python_version=3.9.2
ARG python_version

# Install pyenv.
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
    && cd ~/.pyenv && src/configure && make -C src

ENV PATH="/root/.pyenv/bin:$PATH"

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apt update && apt install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install a specific version of python.
RUN pyenv install $python_version

FROM io4io/blank-3.12.0:1.0.0 AS pyruntime

COPY --from=builder /root/.pyenv /opt/pyenv
COPY ./startup/*.sh /opt/io4run/startup/

ENV PATH="/root/.pyenv/shims:/root/.pyenv/bin:$PATH"