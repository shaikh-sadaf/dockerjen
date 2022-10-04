ARG VERSION=latest
FROM centos:${VERSION}
ARG VERSION
RUN echo $VERSION > image_version
RUN apt update -y
RUN apt install -y apache2 
RUN apt install -y apache2-utils 
RUN apt clean 
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
