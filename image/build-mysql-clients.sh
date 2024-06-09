#!/bin/bash

set -eu -o pipefail

set -x

ARCH=$(arch)
BUILDDIR=build_${ARCH}
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

cmake -B${BUILDDIR} -H. -DWITHOUT_SERVER=1 -DDOWNLOAD_BOOST=1 -DWITH_BOOST=/usr/local/boost
cd ${BUILDDIR}
make mysql mysqldump

# mysql8 has runtime_output_directory
OUTPUTDIR=runtime_output_directory
if [ ! -d ${OUTPUTDIR} ]; then
  # mysql 5.7 has "client" for output dir
  OUTPUTDIR=client
fi
# Binaries end up in $OUTPUTDIR
chmod +x ${OUTPUTDIR}/mysql ${OUTPUTDIR}/mysqldump

# Output version to verify
${OUTPUTDIR}/mysql --version
${OUTPUTDIR}/mysqldump --version
