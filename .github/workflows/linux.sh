#!/usr/bin/env bash

set -ex -o pipefail

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export COVERAGE=${COVERAGE:-false}

# install deps
export DEBIAN_FRONTEND=noninteractive
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y composer php${PHP_VERSION}-dev

# source and execute script used in travis
source .ci/travis_php.sh
run_all
