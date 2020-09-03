# FROM bitnami/php-fpm:5.6.38
FROM bitnami/php-fpm:7.4.7

RUN apt-get update && \
    apt-get install locales build-essential autoconf libgpgme11-dev procps libmagickwand-dev \
    jpegoptim optipng pngquant gifsicle \
    --no-install-recommends -y && \
    # echo '' | pecl install redis-2.2.7 && \
    echo '' | pecl install imagick && \
    # echo "extension=redis.so" >> /opt/bitnami/php/etc/php.ini && \
    echo "extension=imagick.so" >> /opt/bitnami/php/etc/php.ini && \
    echo "zh_TW.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    update-locale LC_ALL=zh_TW.UTF-8 LANG=zh_TW.UTF-8 && \
    apt-get remove build-essential autoconf -y && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    pecl clear-cache

WORKDIR /var/www/html
