#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${MYDIR}/scripts

# Start PostgreSQL & CockroachDB
echo
echo "Starting PostgreSQL and CockroachDB"
./start_postgresql.sh
./start_cockroach.sh

echo
docker ps
echo

echo
echo "Waiting for CockroachDB to start"
until cockroach node status --insecure &> /dev/null
do
    sleep 1
done
echo "CockroachDB started"
echo

# Load TPCC data
echo "Loading PostgreSQL with TPCC data"
./prep_postgresql.sh
./load_tpcc_pg.sh

echo
echo "Prepping CockroachDB user and database"
./prep_cockroach.sh


# Launch local file server
./start_fileserver

# Run MOLT Fetch
# ./molt_fetch_pg_to_crdb.sh


# Run MOLT Verify


