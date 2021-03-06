ARG TAG=5.5.3-php7.4-apache

FROM wordpress:${TAG} 

LABEL maintainer="info@thorstenreichelt.de" 

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
	locales=2.28-10 \
	tzdata=2020d-0+deb10u1 \
	&& rm -rf /var/lib/apt/lists/* 

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
	&& \dpkg-reconfigure --frontend=noninteractive locales \
	&& \update-locale LANG=de_DE.UTF-8 \
	&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime 

ENV LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"