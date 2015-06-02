FROM centos:latest
RUN yum makecache && yum -y install  php ImageMagick
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html

EXPOSE 80

CMD [" /usr/sbin/apachectl"]


