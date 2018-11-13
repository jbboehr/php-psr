#!/usr/bin/env bash

if [[ "${TRAVIS_PHP_VERSION}" != "" ]]; then
    export TRAVIS_LANGUAGE=php
    source .ci/travis_php.sh
elif which nix-build 2>/dev/null 1>/dev/null; then
    export TRAVIS_LANGUAGE=nix
    source .ci/travis_nix.sh
else
    echo "Failed to detect build language"
    exit 1
fi
