FROM pinedamg/base
MAINTAINER MPineda <pinedamg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apache2

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN a2enmod rewrite
RUN a2enmod headers

EXPOSE 80
EXPOSE 443

RUN echo 'alias cd-www="cd /var/www"' >> /root/.bash_aliases
RUN echo 'alias cd-html="cd /var/www/html"' >> /root/.bash_aliases
RUN echo 'alias apache-reload="service apache2 reload"' >> /root/.bash_aliases

RUN apt-get update && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
