ARG VERSION=latest
FROM centos:${VERSION}
ARG VERSION
RUN echo $VERSION > image_version
RUN apt-get -y update 
RUN apt-get install -y apache2 
RUN apt-get install -y apache2-utils 
RUN apt clean 
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
