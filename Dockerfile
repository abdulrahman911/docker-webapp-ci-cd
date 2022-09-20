FROM    centos:7
RUN yum update -y && yum install httpd httpd-tools -y

EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]

# FROM ubuntu 
# RUN apt update 
# RUN apt install –y apache2 
# RUN apt install –y apache2-utils 
# RUN apt clean 
# EXPOSE 80
# CMD [“apache2ctl”, “-D”, “FOREGROUND”]
