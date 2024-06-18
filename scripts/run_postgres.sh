#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IMAGE="postgres:16.3-alpine"
CONF_FILE="$MYDIR/../postgresql.conf"
DATA_VOL="pg-vol"

docker run -d --rm \
--name postgres \
--env POSTGRES_USER=postgres \
--env POSTGRES_PASSWORD=root \
--mount source=${DATA_VOL},target=/var/lib/postgresql/data \
-v $CONF_FILE:/etc/postgresql/postgresql.conf \
-p 5432:5432 \
$IMAGE
