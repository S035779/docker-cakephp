FROM php:7.0.33-apache

EXPOSE 80
EXPOSE 443

ARG FILES

WORKDIR /var/www/cakephp/app

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NOWARNINGS yes
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libicu-dev \
    libpq-dev \
    libzip-dev \
    zlib1g-dev \
    zip \
    unzip \
    ssl-cert \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*


# Enable PHP extensions
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install intl
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Add cake and composer command to system path
ENV PATH="${PATH}:/var/www/html/lib/Cake/Console"
ENV PATH="${PATH}:/var/www/html/app/Vendor/bin"

# COPY apache .conf file
COPY ${FILES}/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ${FILES}/001-default-ssl.conf /etc/apache2/sites-available/001-default-ssl.conf

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN make-ssl-cert generate-default-snakeoil
RUN a2enmod ssl rewrite && a2ensite 001-default-ssl.conf
