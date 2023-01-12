#reference: https://www.youtube.com/watch?v=5N6gTVCG_rw

#get the 'php 8.1-fpm alpine' image version as the base image to be customize
FROM php:8.1-fpm-alpine

#copy custom php.ini to docker image directory
COPY ./php/php.ini /usr/local/etc/php/

#install all the necessary goodies
RUN apk add --no-cache libpng-dev postgresql-dev icu-data-full freetype freetype-dev

#configure gd with freetype support for yii captcha
RUN docker-php-ext-configure gd \
    #--with-jpeg \
    #--with-png
    --with-freetype

#install all the necessary extension so that yii can run normal
RUN docker-php-ext-install gd pdo pdo_mysql pgsql pdo_pgsql intl