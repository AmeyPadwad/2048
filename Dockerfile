FROM ubuntu:latest
MAINTAINER amey
WORKDIR /var/www/html/
RUN apt-get update -y
RUN apt-get install -y zip nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN zip Job1.zip /root/2048/Job1/
RUN gzip Job1.zip
ADD master.gzip /var/www/html/
RUN unzip Job1.zip
RUN rm  Job1.zip 
EXPOSE 80
CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
