This is the source code for a docker image build. Place the contents into a directory and from that directory, issue the command:
# docker-compose build -t fasherman/apache-php .
It will produce a docker image, based on centos 8, that contains Apache 2.4.37 and PHP 7.6.16. The html directory for this build is located in /var/www/html
When you create an container from this image, mount a persistent volume on /var/www/html.
