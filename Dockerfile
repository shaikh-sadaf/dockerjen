FROM centos
ARG package=$package
RUN echo $VERSION > image_version
RUN echo "$package"
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
#RUN if [ "${package}" = "httpd" ] ; then 
RUN yum install -y $package
#else RUN echo "Please Mention Correct Package" && exit; fi 
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
