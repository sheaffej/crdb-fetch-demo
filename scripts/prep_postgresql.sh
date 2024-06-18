#!/usr/bin/env bash

psql postgresql://postgres:root@`hostname` << EOF
CREATE USER pguser WITH PASSWORD 'pguser' CREATEDB REPLICATION;
EOF

psql postgresql://pguser:pguser@`hostname`/postgres << EOF
CREATE DATABASE pgtpcc;
EOF

# psql postgresql://tpccuser:tpccuser@`hostname`/tpcc << EOF
# ...
# EOF