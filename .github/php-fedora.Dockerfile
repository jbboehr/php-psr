ARG BASE_IMAGE=fedora:latest

# image0
FROM ${BASE_IMAGE}
RUN dnf groupinstall 'Development Tools' -y
RUN dnf install \
    gcc \
    automake \
    autoconf \
    libtool \
    php-devel \
    -y
WORKDIR /build/php-psr
ADD . .
RUN phpize
RUN ./configure CFLAGS="-O3"
RUN make
RUN make install

# image1
FROM ${BASE_IMAGE}
RUN dnf install php-cli -y
# this probably won't work on other arches
COPY --from=0 /usr/lib64/php/modules/psr.so /usr/lib64/php/modules/psr.so
# please forgive me
COPY --from=0 /usr/lib64/php/build/run-tests.php /usr/local/lib/php/build/run-tests.php
RUN echo extension=psr.so | sudo tee /etc/php.d/30-psr.ini
