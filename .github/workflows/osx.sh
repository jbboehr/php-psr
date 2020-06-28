#!/usr/bin/env bash

set -ex -o pipefail

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}

# build and install and run tests
brew install php@$PHP_VERSION
export NO_INTERACTION=1
export REPORT_EXIT_STATUS=1
export TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE:-`which php`}
phpize
./configure
make
make test
