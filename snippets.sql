-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Demonstrate continous replication
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- On CockroachDB (shell)
cockroach sql --insecure --watch 0.5s -e "select * from crdbtpcc.warehouse";


-- On psql (SQL)
INSERT INTO warehouse VALUES (1, 'test', 'test', 'test', 'test', 'CA', '0000000', 0.0920, 300000.00);

UPDATE warehouse set w_name = '--', w_street_1 = '--', w_street_2 = '--', w_city = '--', w_zip = '--' where w_id = 1;

DELETE FROM warehouse WHERE w_id = 1;