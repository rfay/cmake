
FROM debian:bookworm

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libssl-dev \
    libncurses5-dev \
    bison \
    pkg-config \
    libtirpc-dev

## Clone MySQL source code
#RUN git clone https://github.com/mysql/mysql-server.git /mysql-server

WORKDIR /mysql-server

## Checkout MySQL 8.0 branch
#RUN git checkout mysql-8.0

# Build script
COPY build-mysql-clients.sh /build-mysql-clients.sh
RUN chmod +x /build-mysql-clients.sh

# Define default command
CMD ["/build-mysql-clients.sh"]
