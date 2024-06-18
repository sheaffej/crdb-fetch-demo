#!/usr/bin/env bash

IMAGE="cockroachdb/cockroach:v24.1.1"
DATA_VOL="crdb-vol"

docker run -d --rm  --name=cockroach \
-p 26257:26257 -p 8080:8080 \
-v "${DATA_VOL}:/cockroach/cockroach-data" \
$IMAGE start-single-node --insecure