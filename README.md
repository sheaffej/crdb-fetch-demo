# crdb-fetch-demo
This repository contains scripts to demo using MOLT Fetch to migrate the TPC-C schema from PostgreSQL to CockroachDB. This demo runs locally on a laptop using the Docker engine.

## Installation
Start the Docker engine on your local laptop. You may use Docker Desktop, or an alternative like Colima.

After cloning this repo, download and extract the MOLT binaries into the repo's top directory.
The MOLT binary can be downloaded from here:  
https://www.cockroachlabs.com/docs/molt/molt-fetch#installation

Here is an example of downloading the MOLT binaries when running on macOS Intel.

```bash
git clone https://github.com/sheaffej/crdb-fetch-demo.git
cd crdb-fetch-demo
wget https://molt.cockroachdb.com/molt/cli/molt-latest.darwin-amd64.tgz
tar xzf molt-*.tgz
rm molt-*.tgz
```

## Demo
These scripts are run from the repo's top-level directory.

To run the demo:
```bash
./run_demo.sql
```

To clean and reset the demo:
```bash
./destroy.sql
```

Once the migration is complete and to demonstrate continous replication:
```sql
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Demonstrate continous replication
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- On CockroachDB (shell)
cockroach sql --insecure --watch 0.5s -e "select * from crdbtpcc.warehouse";


-- On psql (SQL)
INSERT INTO warehouse VALUES (1, 'test', 'test', 'test', 'test', 'CA', '0000000', 0.0920, 300000.00);

UPDATE warehouse set w_name = '--', w_street_1 = '--', w_street_2 = '--', w_city = '--', w_zip = '--' where w_id = 1;

DELETE FROM warehouse WHERE w_id = 1;
```