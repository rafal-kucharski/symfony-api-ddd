FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
        git \
        libpq-dev \
        libxml2-dev \
        libonig-dev \
        libzip-dev \
        unzip \
        && docker-php-ext-install \
        pdo \
        pdo_mysql \
        pdo_pgsql \
        mbstring \
        xml \
        ctype \
        tokenizer \
        json \
        zip \
        && pecl install apcu \
        && docker-php-ext-enable apcu \
        && pecl install xdebug \
        && docker-php-ext-enable xdebug \
        && docker-php-ext-install opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/symfony

COPY . /var/www/symfony

RUN chown -R www-data:www-data /var/www/symfony

RUN composer install --no-dev --optimize-autoloader

COPY ./php/entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint
