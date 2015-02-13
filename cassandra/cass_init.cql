CREATE KEYSPACE reddit WITH REPLICATION = {
  'class': 'SimpleStrategy',
  'replication_factor': 1
};

USE reddit;

CREATE TABLE permacache (
  primary_key True,
  comparator 'BytesType'
);
