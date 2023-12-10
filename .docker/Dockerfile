FROM php:8.2-fpm

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    git \
    libpq-dev \
    libxml2-dev \
    libonig-dev \
    libzip-dev \
    unzip

RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    mbstring \
    xml \
    ctype \
    zip \
    opcache

RUN pecl install \
    apcu \
    xdebug

RUN docker-php-ext-enable \
    apcu \
    xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/symfony

COPY . /var/www/symfony

RUN chown -R www-data:www-data /var/www/symfony

COPY ./php/entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint
