FROM ubuntu:trusty

MAINTAINER Geekwolf
RUN  apt-get -y update && apt-get  -y install php5 ImageMagick  apache2
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apachectl","start"]


