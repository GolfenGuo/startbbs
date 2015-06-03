FROM ubuntu:trusty

MAINTAINER Geekwolf
RUN  apt-get -y update && apt-get  -y install mysql php5 ImageMagick  apache2
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html
RUN echo "ServerName startbbs.daoapp.io">>/etc/apache2/apache2.conf
RUN sed -i "s#localhost#${MYSQL_PORT_3306_TCP_ADDR}#" app/conf/database.php && sed -i "s#root#${MYSQL_USERNAME}" app/conf/database.php && sed -i "s#123456#${MYSQL_PASSWORD}" app/conf/database.php
RUN mysql -h ${MYSQL_PORT_3306_TCP_ADDR} -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} -e "create  database startbbs;" && mysql -h ${MYSQL_PORT_3306_TCP_ADDR} -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} startbbs < data/db/startbbs.sql

EXPOSE 80

CMD ["/usr/sbin/apachectl","start"]


