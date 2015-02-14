#!/bin/bash

cassandra-cli -h $HOSTNAME create keyspace reddit;
cassandra-cli -h $HOSTNAME use reddit;
cassandra-cli -h $HOSTNAME create column family permacache with column_type = 'Standard' and comparator = 'BytesType';
