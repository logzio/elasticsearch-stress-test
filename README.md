# Elasticsearch Stress Test

### Overview
This script generates a bunch of documents, and index as much as it can to elasticsearch. While doing so, it prints out metrics to the screen to let you follow how your cluster is doing.

### How to use
* Save this script
* Make sure you have python 2.7+
* pip install elasticsearch

### Mandatory Parameters
| Parameter | Description |
| --- | --- |
| `es_address` | Address of the Elasticsearch cluster (no protocol and port) |
| `indices` | Number of indices to write to |
| `documents` | Number of template documents that holds the same mapping |
| `clients` | Number of threads that sends bulks to ES |
| `seconds` | 	How long should the test run. Note: it might take a bit longer, as if we started to create a bulk, we would finish it even if the time has passed |


### Optional Parameters
| Parameter | Description |
| --- | --- |
| `--number-of-shards` | How many shards per index |
| `--number-of-replicas` | How many replicas per index |
| `--bulk-size` | How many documents each bulk request should contain |
| `--max-fields-per-document` | What is the maximum number of fields each document template should hold |
| `--max-size-per-field` | When populating the templates, what is the maximum length of the data each field would get |
| `--no-cleanup` | Boolean field. Don't delete the indices after completed |
| `--stats-frequency` | How frequent to show the statistics |

### How does it work
First, the script create document templates based on you input. Say - 5 different docs.
The documents are created without fields, only so they will hold the same mapping when indexing to ES.
After that, the script takes 10 random documents out of the template pool (with redraws) and populate them with random data.

After we have the pool of different documents, we select an index out of the pool, select documents * bulk size out of the pool, and index them.

The generation of documents is being processed before the run, so it will not overload the server too much during the benchmark.

### Contribution
You are more then welcome!
Please open a PR or issues here.

