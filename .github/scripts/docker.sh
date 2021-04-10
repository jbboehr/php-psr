#!/usr/bin/env bash

set -e -o pipefail
source .ci/fold.sh

# config
export DOCKER_NAME=${DOCKER_NAME:-"alpine"}
export PHP_VERSION=${PHP_VERSION:-"7.4"}
export TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE:-"/usr/local/bin/php"}
export RUN_TESTS_PHP=${RUN_TESTS_PHP:-"/usr/local/lib/php/build/run-tests.php"}

function docker_build() (
    docker build \
        -f .github/php-${DOCKER_NAME}.Dockerfile \
        -t php-psr \
        --build-arg PHP_VERSION=${PHP_VERSION} \
        .
)

function docker_run() (
    set -x
    docker run \
        --env NO_INTERACTION=1 \
        --env REPORT_EXIT_STATUS=1 \
        --env TEST_PHP_EXECUTABLE=${TEST_PHP_EXECUTABLE} \
        -v "$PWD/tests:/mnt" \
        php-psr \
        php ${RUN_TESTS_PHP} /mnt
)

cifold "docker build" docker_build
cifold "docker run" docker_run
