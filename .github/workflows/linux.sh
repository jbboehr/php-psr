#!/usr/bin/env bash

set -e -o pipefail
source .ci/fold.sh

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export COVERAGE=${COVERAGE:-false}
export DEBIAN_FRONTEND=noninteractive
export SUDO=sudo

function install_apt_packages() (
    ${SUDO} add-apt-repository ppa:ondrej/php
    ${SUDO} apt-get update
    ${SUDO} apt-get install -y composer jq php${PHP_VERSION}-dev
)

cifold "install apt packages" install_apt_packages

# source and execute script used in travis
source .ci/travis_php.sh
run_all
