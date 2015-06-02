FROM centos:latest
RUN rm -rf /etc/yum.repo.d/* && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN  yum -y install php ImageMagick && yum -y reinstall httpd
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY . /var/www/html

EXPOSE 80

CMD [" /usr/sbin/apachectl"]


