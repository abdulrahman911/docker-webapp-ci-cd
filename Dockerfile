FROM centos:latest
MAINTAINER rahmanuk91@gmail.com

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y && yum install httpd httpd-tools -y
RUN yum install -y zip
RUN yum install -y unzip

ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/biznews.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip biznews.zip
RUN cp -rvf free-news-website-template/* .
RUN rm -rf free-news-website-template biznews.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

#### The below version just before we provision.

# FROM centos:latest
# MAINTAINER rahmanuk91@gmail.com

# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# RUN yum update -y && yum install httpd httpd-tools -y
# RUN yum install -y zip
# RUN yum install -y unzip

# ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/potoub.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip potoub.zip
# RUN cp -rvf potoub-html/* .
# RUN rm -rf potoub-html potoub.zip

# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80

####### This is base webapp
# FROM    centos:7
# RUN yum update -y && yum install httpd httpd-tools -y

# EXPOSE  80

# CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]
#######
