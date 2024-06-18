#!/usr/bin/env bash

cockroach sql --insecure << EOF
CREATE USER IF NOT EXISTS crdbuser;
-- GRANT SYSTEM MODIFYCLUSTERSETTING, EXTERNALIOIMPLICITACCESS TO crdbuser;
GRANT ADMIN to crdbuser;
CREATE DATABASE crdbtpcc;
ALTER DATABASE crdbtpcc OWNER TO crdbuser;
EOF
