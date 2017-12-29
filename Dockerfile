FROM composer:1.5
RUN composer create-project laravel/laravel laravel "v5.4.30" --prefer-dist

FROM sinacloud/docker-apache-php:latest

COPY --from=0 /app/laravel /laravel
COPY ./docker-entrypoint.sh /
COPY ./.htaccess /laravel

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
