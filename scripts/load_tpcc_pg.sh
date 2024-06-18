#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd ${MYDIR}/../import

psql postgresql://postgres:root@`hostname` <<EOF
\i tpcc.dmp.pg.sql
\i district.export.sql
\i warehouse.export.sql
\i item.export.sql
\i customer.export.sql
\i new_order.export.sql
\i order.export.sql
\i history.export.sql
\i order_line.export.sql
\i stock.export.sql
EOF

popd
