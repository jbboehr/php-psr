#!/usr/bin/env bash

if [[ "${TRAVIS_PHP_VERSION}" != "" ]]; then
    export TRAVIS_LANGUAGE=php
    source .ci/travis_php.sh
else
    echo "Failed to detect build language"
    exit 1
fi
