#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
push ${MYDIR}

# Start colima
colima start

# Start PostgreSQL
docker volume create pg-vol
scripts/run_postgres.sh
docker ps

# Load TPCC data


# Start CockroachDB
docker volums create crdb-vol
scripte/run_cockroach.sh
docker ps



# Run MOLT Fetch



# Run MOLT Verify



# Clean up
docker stop postgres
docker stop cockroach
docker ps
# docker volume rm pg-vol
# docker volume rm crdb-vol
