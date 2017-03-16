FROM gbolo/c7-apache

MAINTAINER George Bolo <gbolo@linuxctl.com>

EXPOSE 80 443

# -----------------------------------------------------------------------------
# Install php with some modules
# -----------------------------------------------------------------------------
RUN yum install -y php.x86_64 php-gd.x86_64 php-pdo.x86_64 php-mysqlnd.x86_64 php-pgsql.x86_64 php-snmp.x86_64 php-xml.x86_64 php-soap.x86_64 php-xmlrpc.x86_64 \
    yum clean all

# -----------------------------------------------------------------------------
# Install ssmtp from epel
# -----------------------------------------------------------------------------
RUN yum -y install epel-release && \
    yum -y install ssmtp && \
    yum clean all

# -----------------------------------------------------------------------------
# run apache, make sure to rm pid before starting it
# -----------------------------------------------------------------------------
CMD ["httpd-foreground"]
