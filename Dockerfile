FROM centos:latest

RUN dnf -y install dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
     dnf -y module reset php && \
     dnf -y module enable php:remi-7.4 && \
     dnf -y install php php-opcache php-gd php-curl php-mysqlnd && \
     dnf -y install ncurses && \
     yum clean all

COPY index.html /var/www/html/
COPY info.php /var/www/html/
COPY 00-mpm.conf /etc/httpd/conf.modules.d/
COPY httpd.conf /etc/httpd/conf/
COPY php.ini /etc/

EXPOSE 80

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
