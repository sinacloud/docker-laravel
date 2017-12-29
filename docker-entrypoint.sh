#!/bin/sh
# if the file not exist, execute copy 
if [ ! -f "/var/www/html/package.json" ]; then 
    cp -rT /laravel /var/www/html 
    php /var/www/html/artisan key:generate
    chmod 777 -R /var/www/html/*
fi

exec "$@"
