#!/usr/bin/env bash

set -e -o pipefail
source .ci/fold.sh

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export NO_INTERACTION=1
export REPORT_EXIT_STATUS=1
export TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE:-`which php`}

function install_brew_packages() (
    brew install php@$PHP_VERSION
)

function install() (
    phpize
    ./configure
    make
)

function script() (
    make test
)

cifold "install brew packages" install_brew_packages
cifold "install" install
cifold "script" script
