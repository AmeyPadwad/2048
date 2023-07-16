FROM ubuntu:latest
MAINTAINER amey
WORKDIR /var/www/html/
RUN apt-get update -y
RUN apt-get install -y zip nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD master.gzip /var/www/html/
RUN unzip master.zip
RUN rm  master.zip 
EXPOSE 80
CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
