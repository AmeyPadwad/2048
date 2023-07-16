FROM ubuntu:latest
MAINTAINER amey
WORKDIR /var/www/html/
RUN apt-get update -y
RUN apt-get install -y zip nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mv /root/2048/Job1/Dockerfile /root/2048/
RUN zip master.zip /root/2048/Job1/
RUN gzip master.zip
ADD master.gzip /var/www/html/
RUN unzip master.zip
RUN rm  master.zip 
EXPOSE 80
CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
