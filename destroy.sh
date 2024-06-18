#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker rm -f postgres
docker rm -f cockroach
docker rm -f fileserver
docker volume rm pg-vol
docker volume rm crdb-vol
docker ps

rm -Rf \
    ${MYDIR}/fileserver \
    ${MYDIR}/fetch-*.log \
    ${MYDIR}/replicator