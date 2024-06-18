#!/usr/bin/env bash

cockroach sql --insecure -e "
create user if not exists tpccuser;
grant admin to tpccuser;
"

# cockroach workload init tpcc --warehouses 1 --data-loader IMPORT "postgresql://tpccuser@`hostname`:26257/tpcc?sslmode=disable"