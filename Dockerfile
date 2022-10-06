ARG VERSION=latest
FROM centos:${VERSION}
ARG VERSION
RUN echo $VERSION > image_version
RUN yum update -y
RUN ["./gradlew", "clean", "build", "--debug"]
RUN yum install -y apache2 
RUN yum install -y apache2-utils 
RUN yum clean 
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
