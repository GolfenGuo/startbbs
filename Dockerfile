FROM ubuntu:trusty

MAINTAINER Geekwolf
RUN  apt-get -y update && apt-get  -y install mysql-client php5 ImageMagick  apache2
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html
RUN echo "ServerName startbbs.daoapp.io">>/etc/apache2/apache2.conf
RUN sed -i 's#'localhost'#getenv("MYSQL_PORT_3306_TCP_ADDR")#g' app/config/database.php && sed -i 's#'root'#getenv("MYSQL_USERNAME")#g' app/config/database.php && sed -i "s#'123456'#getenv("MYSQL_PASSWORD")#g' app/config/database.php
RUN mysql -h ${MYSQL_PORT_3306_TCP_ADDR} -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} -e "create  database startbbs;" && mysql -h ${MYSQL_PORT_3306_TCP_ADDR} -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} startbbs < data/db/startbbs.sql

EXPOSE 80

CMD ["/usr/sbin/apachectl","start"]


