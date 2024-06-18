#!/usr/bin/env bash

cockroach sql --insecure -d tpcc <<EOF
\set display_format sql

\o district.export.sql
select * from district;

\o warehouse.export.sql
select * from warehouse;

\o item.export.sql
select * from item;

\o customer.export.sql
select * from customer;

\o new_order.export.sql
select * from new_order;

\o order.export.sql
select * from "order";

\o history.export.sql
select * from history;

\o order_line.export.sql
select * from order_line;

\o stock.export.sql
select * from stock;
EOF



