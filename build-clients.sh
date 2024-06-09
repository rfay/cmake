#!/bin/bash

set -eu -o pipefail
set -x
curl -L --fail -o /tmp/mysql.tgz https://dev.mysql.com/get/Downloads/MySQL-8.4/mysql-8.4.0.tar.gz

mv mysql mysql.bak || true
mkdir -p mysql && pushd mysql
tar --strip-components=1 -zxf /tmp/mysql.tgz

docker run --rm -v .:/src randyfay/cmake
