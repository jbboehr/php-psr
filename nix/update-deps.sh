#!/usr/bin/env bash

set -e -o pipefail
set -x

source "$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"/../.ci/deps.sh
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export CHECKOUT_DIR=$(dirname $SCRIPTPATH)/third-party

cd $SCRIPTPATH

function checkout_dep() (
    cd $CHECKOUT_DIR
    if [ ! -d $1 ]; then
        git clone $2 $CHECKOUT_DIR/$1
    fi
    cd $1
    git fetch origin
    git checkout $3
)

function build_composer2nix() (
    cd $CHECKOUT_DIR/$1
    composer install --dev
    cp composer.lock $SCRIPTPATH/deps/$1-composer.lock
    composer2nix --output=$1-packages.nix \
        --composer-env=/dev/null \
        --composition=/dev/null \
        --prefer-dist \
        --dev
    mv $1-packages.nix $SCRIPTPATH/deps/
)

function build_dep() {
    nix-prefetch-git --url $2 --rev $3 | tee $SCRIPTPATH/deps/$1.json
    checkout_dep $1 $2 $3
    build_composer2nix $1 $2 $3
}

build_dep ${MONOLOG_SHORTNAME} ${MONOLOG_REPO} ${MONOLOG_VERSION}
build_dep $PSX_CACHE_SHORTNAME $PSX_CACHE_REPO $PSX_CACHE_VERSION
build_dep $LEAGUE_CONTAINER_SHORTNAME $LEAGUE_CONTAINER_REPO $LEAGUE_CONTAINER_VERSION
build_dep $LINK_UTIL_SHORTNAME $LINK_UTIL_REPO $LINK_UTIL_VERSION
build_dep $DISPATCH_SHORTNAME $DISPATCH_REPO $DISPATCH_VERSION
build_dep $HTTP_FACTORY_GUZZLE_SHORTNAME $HTTP_FACTORY_GUZZLE_REPO $HTTP_FACTORY_GUZZLE_VERSION
build_dep $HTTP_GUZZLE_PSR18_ADAPTER_SHORTNAME $HTTP_GUZZLE_PSR18_ADAPTER_REPO $HTTP_GUZZLE_PSR18_ADAPTER_VERSION
build_dep $TUKIO_SHORTNAME $TUKIO_REPO $TUKIO_VERSION
build_dep ${LAMINAS_CACHE_SHORTNAME} ${LAMINAS_CACHE_REPO} ${LAMINAS_CACHE_VERSION}
build_dep ${LAMINAS_DIACTOROS_SHORTNAME} ${LAMINAS_DIACTOROS_REPO} ${LAMINAS_DIACTOROS_VERSION}
