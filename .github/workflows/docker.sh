#!/usr/bin/env bash

set -ex -o pipefail

# config
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE:-"/usr/local/bin/php"}
export RUN_TESTS_PHP=${RUN_TESTS_PHP:-"/usr/local/lib/php/build/run-tests.php"}

# docker build
docker build \
    -f .github/php-${DOCKER_NAME}.Dockerfile \
    -t php-psr \
    --build-arg PHP_VERSION=${PHP_VERSION} \
    .

# docker run
docker run \
    --env NO_INTERACTION=1 \
    --env REPORT_EXIT_STATUS=1 \
    --env TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE} \
    -v "$PWD/tests:/mnt" \
    php-psr \
    php ${RUN_TESTS_PHP} /mnt
