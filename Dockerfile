FROM centos:latest
RUN  yum -y install httpd httpd-devel php ImageMagick
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html

EXPOSE 80

CMD [" /usr/sbin/apachectl"]


