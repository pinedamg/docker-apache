FROM pinedamg/base

MAINTAINER MPineda <pinedamg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y apache2
RUN a2enmod rewrite

EXPOSE 80

WORKDIR /var/www
