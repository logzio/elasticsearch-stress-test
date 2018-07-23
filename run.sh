#!/bin/bash

# documentation
# https://github.com/logzio/elasticsearch-stress-test

indices=5
documents=2
clients=10
seconds=900
shards=4
replicas=1
bulk_size=500
max_fields_per_doc=50
max_size_per_field=500
stats_frequency=30

host=your-host.com
username=shield_username
password=shield_password

python elasticsearch-stress-test.py --es_address $host \
        --indices $indices --documents $documents \
        --clients $clients --seconds $seconds \
        --number-of-shards $shards \
        --number-of-replicas $replicas \
        --bulk-size $bulk_size \
        --max-fields-per-document $max_fields_per_doc \
        --max-size-per-field $max_size_per_field \
        --stats-frequency $stats_frequency \
        --username $username \
        --password $password
