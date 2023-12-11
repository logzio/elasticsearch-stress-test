# THIS PROJECT IS NO LONGER MAINTAINED

# Elasticsearch Stress Test

### Overview
This script generates a bunch of documents, and indexes as much as it can to Elasticsearch. While doing so, it prints out metrics to the screen to let you follow how your cluster is doing.

### How to use
* Save this script
* Make sure you have Python 2.7+
* pip install elasticsearch

### How does it work
The script creates document templates based on your input. Say - 5 different documents.
The documents are created without fields, for the purpose of having the same mapping when indexing to ES.
After that, the script takes 10 random documents out of the template pool (with redraws) and populates them with random data.

After we have the pool of different documents, we select an index out of the pool, select documents * bulk size out of the pool, and index them.

The generation of documents is being processed before the run, so it will not overload the server too much during the benchmark.

### Mandatory Parameters
| Parameter | Description |
| --- | --- |
| `--es_address` | Address of the Elasticsearch cluster (no protocol and port). You can supply mutiple clusters here, but only **one** node in each cluster (preferably the client node) |
| `--indices` | Number of indices to write to |
| `--documents` | Number of template documents that hold the same mapping |
| `--clients` | Number of threads that send bulks to ES |
| `--seconds` | How long should the test run. Note: it might take a bit longer, as sending of all bulks whose creation has been initiated is allowed |


### Optional Parameters
| Parameter | Description | Default
| --- | --- | --- |
| `--number-of-shards` | How many shards per index |3|
| `--number-of-replicas` | How many replicas per index |1|
| `--bulk-size` | How many documents each bulk request should contain |1000|
| `--max-fields-per-document` | What is the maximum number of fields each document template should hold |100|
| `--max-size-per-field` | When populating the templates, what is the maximum length of the data each field would get |1000|
| `--no-cleanup` | Boolean field. Don't delete the indices after completion |False|
| `--stats-frequency` | How frequent to show the statistics |30|
| `--not-green` | Script doesn't wait for the cluster to be green |False|
| `--no-verify` | No verify SSL certificates|False|
| `--ca-file` | Path to Certificate file ||
| `--username` | HTTP authentication Username ||
| `--password` | HTTP authentication Password ||




### Examples
Run the test for 2 Elasticsearch clusters, with 4 indices on each, 5 random documents, don't wait for the cluster to be green, open 5 different writing threads and run the script for 120 seconds
```bash
python elasticsearch-stress-test.py  --es_address 1.2.3.4 1.2.3.5 --indices 4 --documents 5 --seconds 120 --not-green --clients 5
```

Run the test on ES cluster 1.2.3.4, with 10 indices, 10 random documents with up to 10 fields in each, the size of each field on each document can be up to 50 chars, each index will have 1 shard and no replicas, the test will run from 1 client (thread) for 300 seconds, will print statistics every 15 seconds, will index in bulks of 5000 documents and will leave everything in Elasticsearch after the test
```bash
 python elasticsearch-stress-test.py --es_address 1.2.3.4 --indices 10 --documents 10 --clients 1 --seconds 300 --number-of-shards 1 --number-of-replicas 0 --bulk-size 5000 --max-fields-per-document 10 --max-size-per-field 50 --no-cleanup --stats-frequency 15
```

Run the test with SSL
```bash
 python elasticsearch-stress-test.py --es_address https://1.2.3.4 --indices 5 --documents 5 --clients 1 --ca-file /path/ca.pem
```

Run the test with SSL without verify the certificate
```bash
 python elasticsearch-stress-test.py --es_address https://1.2.3.4 --indices 5 --documents 5 --clients 1 --no-verify
```

Run the test with HTTP Authentification
```bash
 python elasticsearch-stress-test.py --es_address 1.2.3.4 --indices 5 --documents 5 --clients 1 --username elastic --password changeme
```
### Contribution
You are more then welcome!
Please open a PR or issues here.

