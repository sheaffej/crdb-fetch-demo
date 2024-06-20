#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${MYDIR}/scripts

echo
echo "--------------------------------------------------------------------------------"
echo "  Start PostgreSQL and CockroachDB"
echo "--------------------------------------------------------------------------------"
read -p "[ press ENTER ]"

# Start PostgreSQL & CockroachDB
# echo
# echo "Starting PostgreSQL and CockroachDB"
echo
./start_postgresql.sh
./start_cockroach.sh

echo
docker ps
echo

echo "Waiting for CockroachDB to start"
until cockroach node status --insecure &> /dev/null
do
    echo -n "."
    sleep 1
done
echo
echo "CockroachDB started"

echo
echo "--------------------------------------------------------------------------------"
echo "  Load TPCC data into PostgreSQL [press any key]"
echo "--------------------------------------------------------------------------------"
read -p "[ press ENTER ]"


# Load TPCC data
echo
echo "Loading PostgreSQL with TPCC data"
./prep_postgresql.sh
./load_tpcc_pg.sh

echo
echo "Prepping CockroachDB user and database"
./prep_cockroach.sh

echo
echo "--------------------------------------------------------------------------------"
echo "  Start a local file server on port 8999 [press any key]"
echo "--------------------------------------------------------------------------------"
read -p "[ press ENTER ]"

# Launch local file server
./start_fileserver.sh

echo
docker ps

echo
echo "--------------------------------------------------------------------------------"
echo "  Run MOLT Fetch with IMPORT and Continous Mode [press any key]"
echo "--------------------------------------------------------------------------------"
read -p "[ press ENTER ]"

# Run MOLT Fetch
echo
./molt_fetch_pg_to_crdb.sh


