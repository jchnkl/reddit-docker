# FROM base/archlinux
# MAINTAINER Jochen Keil
# RUN pacman --noconfirm -Syu
# RUN pacman --noconfirm -S git python
# RUN useradd --home-dir /reddit --create-home --system --shell /bin/nologin reddit
# RUN git clone http://github.com/reddit/reddit.git /reddit

FROM ubuntu:12.04
MAINTAINER Jochen Keil

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-add-repository -y ppa:reddit/ppa

RUN bash -c 'echo -e "Package: *\n\
Pin: release o=LP-PPA-reddit\n\
Pin-Priority: 600\n" >/etc/apt/preferences.d/reddit'

RUN apt-get update && \
  apt-get install -y \
    netcat-openbsd \
    git-core \
    \
    python-dev \
    python-setuptools \
    python-routes \
    python-pylons \
    python-boto \
    python-tz \
    python-crypto \
    python-babel \
    cython \
    python-sqlalchemy \
    python-beautifulsoup \
    python-chardet \
    python-psycopg2 \
    python-pycassa \
    python-imaging \
    python-pycaptcha \
    python-amqplib \
    python-pylibmc \
    python-bcrypt \
    python-snudown \
    python-l2cs \
    python-lxml \
    python-zope.interface \
    python-kazoo \
    python-stripe \
    python-tinycss2 \
    \
    python-flask \
    geoip-bin \
    geoip-database \
    python-geoip \
    \
    nodejs \
    node-less \
    node-uglify \
    gettext \
    make \
    optipng \
    jpegoptim

  # memcached
  # postgresql
  # postgresql-client
  # rabbitmq-server
  # cassandra
  # haproxy
  # nginx
  # stunnel
  # gunicorn
  # sutro
  # libpcre3-dev

# # Libs
#
# RUN apt-get install -y python
# RUN apt-get install -y python-setuptools
# RUN apt-get install -y python-dev
# RUN apt-get install -y libmemcached-dev
# RUN apt-get install -y libpq-dev
# RUN apt-get install -y libxml2-dev
# RUN apt-get install -y libxslt1-dev
# RUN apt-get install -y python-imaging
#
# # Misc utils
#
# RUN apt-get install -y git-core
# RUN apt-get install -y gcc
# RUN apt-get install -y optipng
# RUN apt-get install -y jpegoptim
# RUN apt-get install -y postgresql-client
# RUN apt-get install -y make
# RUN apt-get install -y gettext
# RUN apt-get install -y nodejs
# RUN apt-get install -y node-less

RUN useradd --system --shell /bin/nologin reddit
RUN git clone http://github.com/reddit/reddit.git /reddit
RUN chown -R reddit:reddit /reddit

WORKDIR /reddit/r2

USER reddit
RUN python setup.py build

USER root
RUN python setup.py develop

USER reddit
RUN make
