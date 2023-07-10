# specify a base image
FROM centos:7 

#description
LABEL description="containerize apache webapp"

LABEL maintainer="fabrice best devops engineer"
# run yum update
RUN yum -y update 

#install apache
RUN yum install -y httpd

#source is your compputer and the destination is the container
#copy index file from our local to inside the container
COPY index.html /var/www/html/

# open port 80
EXPOSE 80

# run httpd service when the container starts systemctl start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# can override CMD in the background
CMD [ "-D", "FOREGROUND" ]