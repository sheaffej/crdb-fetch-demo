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

> Tip: Each of the steps are in their own shell script called from `run_demo.sh`. You can view the shell scripts to see the exact commands being executed.

To run the demo:
```bash
./run_demo.sh
```

To clean and reset the demo:
```bash
./destroy.sh
```

Once the migration is complete you can run thsee to demonstrate continous replication:
```sql
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Demonstrate continous replication
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- On CockroachDB (in a shell terminal)
cockroach sql --insecure --watch 0.5s -e "select * from crdbtpcc.warehouse";


-- On psql (in a SQL terminal)
INSERT INTO warehouse VALUES (1, 'test', 'test', 'test', 'test', 'CA', '0000000', 0.0920, 300000.00);
-- Watch the change in the CRDB terminal

UPDATE warehouse set w_name = '--', w_street_1 = '--', w_street_2 = '--', w_city = '--', w_zip = '--' where w_id = 1;
-- Watch the change in the CRDB terminal

DELETE FROM warehouse WHERE w_id = 1;
-- Watch the change in the CRDB terminal
```