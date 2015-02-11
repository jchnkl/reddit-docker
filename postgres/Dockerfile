FROM postgres
MAINTAINER Jochen Keil

USER root
RUN mkdir -p /docker-entrypoint-initdb.d
ADD reddit_functions.sql /docker-entrypoint-initdb.d/reddit_functions.sql
ADD reddit_init.sh /docker-entrypoint-initdb.d/reddit_init.sh

# USER postgres
# RUN postgres --single
# RUN createdb -E utf8 reddit
# RUN psql reddit -c 'CREATE USER reddit WITH PASSWORD "reddit";'
#
# WORKDIR /tmp
# RUN wget http://github.com/reddit/reddit/raw/master/sql/functions.sql
# RUN psql reddit < functions.sql
