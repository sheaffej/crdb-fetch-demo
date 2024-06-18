#!/usr/bin/env bash

IMAGE="cockroachdb/cockroach:v24.1.1"

docker run -d --rm  --name=cockroach \
-p 26257:26257 -p 8080:8080 \
-v "roach1:/cockroach/cockroach-data" \
$IMAGE start-single-node --insecure