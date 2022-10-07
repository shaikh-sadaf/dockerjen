FROM centos
ARG package
RUN echo $VERSION > image_version
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN echo "${package}"
RUN if [ "${package}" = "httpd" ] ; then  RUN yum install -y ${package}; fi
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
