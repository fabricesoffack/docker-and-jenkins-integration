# Amazon Linux 2 as the base image
FROM amazonlinux:2 

#description
LABEL description="containerize apache webapp"

LABEL maintainer="fabrice best devops engineer"

# run yum update to update the system
RUN yum -y update 

#install apache
RUN yum install -y httpd

#source is your compputer and the destination is the container
#copy index file from our local to inside the container
COPY index.html /var/www/html/

# open port 80 for HTTP traffic
EXPOSE 80

# run httpd service when the container starts systemctl start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# can override CMD in the background
CMD [ "-D", "FOREGROUND" ]