FROM debian
MAINTAINER Jochen Keil

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y \
    geoip-bin \
    geoip-database \
    python-flask \
    python-geoip \
    gunicorn

ADD geoip_service.py /data/geoip_service.py

WORKDIR /data

EXPOSE 5000

ENTRYPOINT gunicorn \
             --bind=0.0.0.0:5000 \
             --workers=1 \
             --limit-request-line=8190 \
             geoip_service:application
