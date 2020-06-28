ARG PHP_VERSION=7.4
ARG PHP_TYPE=alpine
ARG BASE_IMAGE=php:${PHP_VERSION}-${PHP_TYPE}

# image0
FROM ${BASE_IMAGE}
WORKDIR /build/php-psr
RUN apk update && \
    apk --no-cache add alpine-sdk automake autoconf libtool
ADD . .
RUN phpize
RUN ./configure CFLAGS="-O3"
RUN make
RUN make install

# image1
FROM ${BASE_IMAGE}
COPY --from=0 /usr/local/lib/php/extensions /usr/local/lib/php/extensions
RUN docker-php-ext-enable psr
ENTRYPOINT ["docker-php-entrypoint"]
