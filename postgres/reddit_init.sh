#!/bin/bash

gosu postgres postgres --single << EOSQL
CREATE USER reddit WITH PASSWORD 'reddit';
CREATE DATABASE reddit ENCODING 'UTF8';
GRANT ALL PRIVILEGES ON DATABASE reddit TO reddit;
EOSQL

gosu postgres postgres --single -j reddit < /docker-entrypoint-initdb.d/reddit_functions.sql

cat > /var/lib/postgresql/data/pg_hba.conf << EOF
local   all             all                                     trust
host    all             all             0.0.0.0/0               md5
EOF
