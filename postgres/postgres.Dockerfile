FROM postgres:17

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential git postgresql-server-dev-17 clang llvm llvm-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Symlink clang-19 to clang if not present
RUN [ -f /usr/bin/clang-19 ] || ln -s /usr/bin/clang /usr/bin/clang-19

WORKDIR /tmp
RUN git clone https://github.com/pgvector/pgvector.git

WORKDIR /tmp/pgvector
RUN CC=gcc make
RUN make install
