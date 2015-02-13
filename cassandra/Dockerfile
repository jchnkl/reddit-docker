FROM spotify/cassandra
MAINTAINER Jochen Keil

RUN echo 'create keyspace reddit;' | cqlsh localhost
RUN echo 'use reddit;' | cqlsh localhost
RUN echo 'create column family permacache with column_type = 'Standard' and comparator = 'BytesType';' | cqlsh localhost
