#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${MYDIR}/..

./molt fetch \
--source "postgresql://pguser:pguser@`hostname`/pgtpcc" \
--target "postgresql://crdbuser@`hostname`:26257/crdbtpcc?sslmode=disable" \
--table-handling 'drop-on-target-and-recreate' \
--pglogical-replication-slot-name 'tpcc_molt' \
--pglogical-replication-slot-drop-if-exists \
--local-path  ./fileserver \
--local-path-listen-addr "`hostname`:8999" \
--compression 'none' \
--ongoing-replication \
--allow-tls-mode-disable \
--non-interactive
