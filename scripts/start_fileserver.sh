#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${MYDIR}/..

# Build image
docker build -t busybox-fileserver -f Dockerfile.fileserver .

# Create the fileserver directory
mkdir -p fileserver

# Launch container
docker run -d --rm \
--name fileserver \
-p 8999:8999 \
--mount type=bind,source=./fileserver,target=/var/http \
busybox-fileserver
 