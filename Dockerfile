FROM gbolo/c7-apache

MAINTAINER George Bolo <gbolo@linuxctl.com>

EXPOSE 80 443

# -----------------------------------------------------------------------------
# Install php with some modules
# -----------------------------------------------------------------------------
RUN yum install -y php.x86_64 php-pdo.x86_64 php-mysqlnd.x86_64 php-pgsql.x86_64 php-snmp.x86_64 php-xml.x86_64 php-soap.x86_64 php-xmlrpc.x86_64 \
    yum clean all

# -----------------------------------------------------------------------------
# Install php phalcon module
# -----------------------------------------------------------------------------
RUN yum install -y php-devel pcre-devel gcc make git && \
    git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
    cd cphalcon/build && \
    ./install && \
    echo "extension=phalcon.so" > /etc/php.d/phalcon.ini && \
    yum remove -y php-devel pcre-devel gcc make git && \
    yum clean all

# -----------------------------------------------------------------------------
# run apache, make sure to rm pid before starting it
# -----------------------------------------------------------------------------
CMD ["httpd-foreground"]
