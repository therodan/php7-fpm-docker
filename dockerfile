FROM php:7.0-fpm

RUN apt-get update \
    && apt-get install -y libpng12-dev libjpeg-dev libmcrypt-dev zip unzip \
    && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd

# PHP Extensions
RUN docker-php-ext-install mbstring mcrypt zip sockets bcmath mysqli

# Install composer
RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar \
	&& chmod +x /usr/local/bin/composer
