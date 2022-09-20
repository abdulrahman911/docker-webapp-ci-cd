FROM centos:latest
MAINTAINER rahmanuk91@gmail.com

RUN yum update -y && yum install httpd httpd-tools -y
RUN yum install -y zip\
unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/potoub.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip potoub.zip
RUN cp -rvf potoub-html/* .
RUN rm -rf potoub-html potoub.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

# FROM    centos:7
# RUN yum update -y && yum install httpd httpd-tools -y

# EXPOSE  80

# CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
#######
# FROM ubuntu 
# RUN apt update 
# RUN apt install –y apache2 
# RUN apt install –y apache2-utils 
# RUN apt clean 
# EXPOSE 80
# CMD [“apache2ctl”, “-D”, “FOREGROUND”]
