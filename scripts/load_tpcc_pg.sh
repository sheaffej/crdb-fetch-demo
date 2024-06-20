#!/usr/bin/env bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd ${MYDIR}/../import

psql postgresql://pguser:pguser@`hostname`/pgtpcc <<EOF
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
ANALYZE district;
ANALYZE warehouse;
ANALYZE item;
ANALYZE customer;
ANALYZE new_order;
ANALYZE "order";
ANALYZE history;
ANALYZE order_line;
ANALYZE stock;
EOF
