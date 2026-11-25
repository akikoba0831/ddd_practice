FROM php:8.4-cli-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl git unzip libicu-dev libonig-dev libsqlite3-dev libzip-dev \
    && docker-php-ext-install -j"$(nproc)" bcmath intl mbstring pdo_sqlite zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
COPY docker/backend/entrypoint.sh /usr/local/bin/app-entrypoint

WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["sh", "/usr/local/bin/app-entrypoint"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
