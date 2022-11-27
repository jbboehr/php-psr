#!/usr/bin/env bash

set -e -o pipefail
source .github/scripts/fold.sh

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export COVERAGE=${COVERAGE:-false}
export DEBIAN_FRONTEND=noninteractive
export SUDO=sudo

function install_apt_packages() (
    ${SUDO} add-apt-repository ppa:ondrej/php
    ${SUDO} apt-get update
    ${SUDO} apt-get install -y composer jq lcov \
        php${PHP_VERSION}-dev \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-mongodb \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-zip
    ${SUDO} update-alternatives --set php /usr/bin/php${PHP_VERSION}
    ${SUDO} update-alternatives --set php-config /usr/bin/php-config${PHP_VERSION}
    ${SUDO} update-alternatives --set phpize /usr/bin/phpize${PHP_VERSION}
    # ${SUDO} update-alternatives --set phpdbg /usr/bin/phpdbg${PHP_VERSION}
    ${SUDO} update-alternatives --config php
)

function install_composer() (
    wget https://getcomposer.org/installer -O - | php
    mkdir -p ~/.local/bin
    mv -v composer.phar ~/.local/bin/composer
)

cifold "install apt packages" install_apt_packages
cifold "install composer" install_composer

# source and execute script used in travis
source .github/scripts/suite.sh
run_all
