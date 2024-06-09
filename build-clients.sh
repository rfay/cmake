#!/bin/bash

set -eu -o pipefail
set -x
MYSQL_VERSION=8.4.0

target_arch=linux/amd64

curl -L --fail -o /tmp/mysql.tgz https://dev.mysql.com/get/Downloads/MySQL-${MYSQL_VERSION%.?}/mysql-${MYSQL_VERSION}.tar.gz

#mv -f mysql mysql.bak || true

mkdir -p mysql && pushd mysql
rm -rf build*
mkdir build
tar --strip-components=1 -zxf /tmp/mysql.tgz

docker run --rm --platform=${target_arch} -v .:/src randyfay/cmake
