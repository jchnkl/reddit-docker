#!/bin/sh

cassandra-cli -h 172.17.0.143 << EOF
create keyspace reddit;
use reddit;
create column family permacache with column_type = 'Standard' and comparator = 'BytesType';
EOF
