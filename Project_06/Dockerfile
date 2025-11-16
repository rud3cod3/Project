FROM php:8.2-apache

# Enable apache mods
RUN a2enmod rewrite

# Copy source code
COPY src/ /var/www/html/

EXPOSE 80

