FROM rockylinux:8

# Install necessary packages
RUN dnf install -y httpd wget unzip zip

# Add and unzip the template
ADD https://www.tooplate.com/zip-templates/2133_moso_interior.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip 2133_moso_interior.zip && \
    cp -rvf 2133_moso_interior/* . && \
    rm -rf 2133_moso_interior 2133_moso_interior.zip

# Run the Apache HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80




