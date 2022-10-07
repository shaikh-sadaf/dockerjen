FROM centos
ARG package
RUN echo $VERSION > image_version
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUn echo "${package}"
RUN yum install -y ${package}
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
