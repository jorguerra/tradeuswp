FROM wordpress:php8.3-fpm-alpine

COPY --from=wordpress:cli-2 /usr/local/bin/wp /usr/local/bin/wp

COPY ./content/Divi /var/www/html/wp-content/themes/Divi
COPY ./content/uploads /var/www/html/wp-content/uploads
RUN chown -R www-data:www-data /var/www
RUN find /var/www/ -type d -exec chmod 0755 {} \;
RUN find /var/www/ -type f -exec chmod 644 {} \;
USER root