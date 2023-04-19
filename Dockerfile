FROM php:8.2-fpm-alpine
RUN curl -sS https://getcomposer.org/installer​ | php -- \
     --install-dir=/usr/local/bin --filename=composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY . /app
RUN composer install
EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000





