ARG VERSION=latest
FROM centos:${VERSION}
ARG VERSION
RUN echo $VERSION > image_version
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN ["./gradlew", "clean", "build", "--debug"]
RUN yum install -y apache2 
RUN yum install -y apache2-utils 
RUN yum clean 
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
