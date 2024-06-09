#!/bin/bash

# Compile MySQL clients
cmake . -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/usr/local/boost \
    && make mysqlclient mysqldump

# Move the binaries to a more accessible location
cp client/mysql /usr/local/bin/
cp client/mysqldump /usr/local/bin/

# Ensure clients are executable
chmod +x /usr/local/bin/mysql /usr/local/bin/mysqldump

# Output version to verify
mysql --version
mysqldump --version
