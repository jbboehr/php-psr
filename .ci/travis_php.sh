#!/usr/bin/env bash

set -o errexit -o pipefail

source .ci/deps.sh
source .ci/fold.sh

export PS4=' \e[33m$(date +"%H:%M:%S"): $BASH_SOURCE@$LINENO ${FUNCNAME[0]} -> \e[0m'
export COVERAGE=${COVERAGE:-true}
export PHP_VERSION_ID=$(php -r 'echo PHP_VERSION_ID;')
# error_reporting='E_ALL & ~E_DEPRECATED'
export PHP_WITH_EXT="`which php` -d error_reporting=24575 -d extension=`pwd`/modules/psr.so"
export DEFAULT_COMPOSER_FLAGS="--no-interaction --no-ansi --no-progress --no-suggest"

# friendsofphp/php-cs-fixer v2.9.3 requires php ^5.6 || >=7.0 <7.3
# We'll remove this in the future
if [[ ${PHP_VERSION_ID} -ge 70300 ]]; then
    export DEFAULT_COMPOSER_FLAGS="${DEFAULT_COMPOSER_FLAGS} --ignore-platform-reqs"
fi

export NO_INTERACTION=1
export REPORT_EXIT_STATUS=1
export TEST_PHP_EXECUTABLE=`which php`

# we needed this for the tests we are now removing in laminas, so we can disable it for now
# make a temp directory with a php.ini - phpunit's process isolation ignore flags to PHP
# export PHP_INI_SCAN_DIR=$(mktemp -d)
# echo error_reporting=24575 | tee -a ${PHP_INI_SCAN_DIR}/php.ini
# echo memory_limit=256M | tee -a ${PHP_INI_SCAN_DIR}/php.ini
# echo extension=`pwd`/modules/psr.so | tee -a ${PHP_INI_SCAN_DIR}/php.ini

function init_repository() (
    set -o errexit -o pipefail -o xtrace

    local dir=third-party/${1}
    local ver=${2}
    local repo=${3}
    mkdir -p ${dir}
    if [ ! -d ${dir}/.git ]; then
        rm -rf ${dir}
        git clone -b ${ver} ${repo} ${dir}
        cd ${dir}
    else
        cd ${dir}
        git fetch origin
        git checkout --force ${ver}
    fi
    composer install ${DEFAULT_COMPOSER_FLAGS}
    # remove their installed psr dependencies (except testing classes)
    # monolog requires the test class, so don't delete everything
    find vendor/psr/ -type f -not -iname "*test*" -delete
    # remove some tests from laminas that are really slow
    rm -f test/Storage/Adapter/FilesystemTest.php test/Storage/Adapter/MemoryTest.php
    # remove a test suite from laminas-diactoros that breaks due to process isolation
    rm -f test/ServerRequestFactoryTest.php
)

function test_repository() (
    set -o errexit -o pipefail -o xtrace

    cd third-party/${1}
    echo ${PHP_WITH_EXT} ./vendor/bin/phpunit
    ${PHP_WITH_EXT} ./vendor/bin/phpunit
)

function install_coveralls_lcov() (
    set -o errexit -o pipefail -o xtrace

    # Don't install this unless we're actually on travis
    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        gem install coveralls-lcov
    fi
)

function checkout_third_party_repos() (
    set -o errexit -o pipefail -o xtrace

    # install all libraries we test against
    init_repository ${MONOLOG_SHORTNAME} ${MONOLOG_VERSION} ${MONOLOG_REPO}
    init_repository ${LEAGUE_CONTAINER_SHORTNAME} ${LEAGUE_CONTAINER_VERSION} ${LEAGUE_CONTAINER_REPO}
    init_repository ${LINK_UTIL_SHORTNAME} ${LINK_UTIL_VERSION} ${LINK_UTIL_REPO}
    init_repository ${PSX_CACHE_SHORTNAME} ${PSX_CACHE_VERSION} ${PSX_CACHE_REPO}
    init_repository ${DISPATCH_SHORTNAME} ${DISPATCH_VERSION} ${DISPATCH_REPO}
    init_repository ${REQUEST_HANDLER_SHORTNAME} ${REQUEST_HANDLER_VERSION} ${REQUEST_HANDLER_REPO}
    init_repository ${HTTP_FACTORY_GUZZLE_SHORTNAME} ${HTTP_FACTORY_GUZZLE_VERSION} ${HTTP_FACTORY_GUZZLE_REPO}
    init_repository ${HTTP_GUZZLE_PSR18_ADAPTER_SHORTNAME} ${HTTP_GUZZLE_PSR18_ADAPTER_VERSION} ${HTTP_GUZZLE_PSR18_ADAPTER_REPO}
    init_repository ${TUKIO_SHORTNAME} ${TUKIO_VERSION} ${TUKIO_REPO}
    if [[ -z "${TRAVIS_ARCH}" ]] || [[ "${TRAVIS_ARCH}" == "amd64" ]]; then
        # laminas-cache tests are failing on basically all non-x86 architectures and it's not my fault (I think)
        init_repository ${LAMINAS_CACHE_SHORTNAME} ${LAMINAS_CACHE_VERSION} ${LAMINAS_CACHE_REPO}
    fi
    init_repository ${LAMINAS_DIACTOROS_SHORTNAME} ${LAMINAS_DIACTOROS_VERSION} ${LAMINAS_DIACTOROS_REPO}
)

function before_install() (
    set -o errexit -o pipefail

    # Don't install this unless we're actually on travis
    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        cifold "install coveralls-lcov" install_coveralls_lcov
    fi
    cifold "checkout all third-party test repos" checkout_third_party_repos
)

function build_php_psr() (
    set -o errexit -o pipefail -o xtrace

    phpize
    if [[ "${COVERAGE}" = "true" ]]; then
        ./configure CFLAGS="-fprofile-arcs -ftest-coverage ${CFLAGS}" LDFLAGS="--coverage ${LDFLAGS}"
    else
        ./configure
    fi
    make clean all
)

function install() (
    set -o errexit -o pipefail

    cifold "main build step" build_php_psr
)

function initialize_coverage() (
    set -o errexit -o pipefail -o xtrace

    if [[ "${COVERAGE}" = "true" ]]; then
        echo "Initializing coverage"
        lcov --directory . --zerocounters
        lcov --directory . --capture --compat-libtool --initial --output-file coverage.info
    fi
)

function before_script() (
    set -o errexit -o pipefail

    cifold "initialize coverage" initialize_coverage
)

function test_php_psr() (
    set -o errexit -o pipefail -o xtrace

    php run-tests.php -d extension=psr.so -d extension_dir=modules -n ./tests
)

function script() (
    set -o errexit -o pipefail

    cifold "main test suite" test_php_psr

    # run tests for all libraries we test against
    cifold "test ${MONOLOG_SHORTNAME}" test_repository ${MONOLOG_SHORTNAME}
    cifold "test ${LEAGUE_CONTAINER_SHORTNAME}" test_repository ${LEAGUE_CONTAINER_SHORTNAME}
    cifold "test ${LINK_UTIL_SHORTNAME}" test_repository ${LINK_UTIL_SHORTNAME}
    cifold "test ${PSX_CACHE_SHORTNAME}" test_repository ${PSX_CACHE_SHORTNAME}
    cifold "test ${DISPATCH_SHORTNAME}" test_repository ${DISPATCH_SHORTNAME}
    cifold "test ${REQUEST_HANDLER_SHORTNAME}" test_repository ${REQUEST_HANDLER_SHORTNAME}
    cifold "test ${HTTP_FACTORY_GUZZLE_SHORTNAME}" test_repository ${HTTP_FACTORY_GUZZLE_SHORTNAME}
    cifold "test ${HTTP_GUZZLE_PSR18_ADAPTER_SHORTNAME}" test_repository ${HTTP_GUZZLE_PSR18_ADAPTER_SHORTNAME}
    cifold "test ${TUKIO_SHORTNAME}" test_repository ${TUKIO_SHORTNAME}
    if [[ -z "${TRAVIS_ARCH}" ]] || [[ "${TRAVIS_ARCH}" == "amd64" ]]; then
        # laminas-cache tests are failing on basically all non-x86 architectures and it's not my fault (I think)
        cifold "test ${LAMINAS_CACHE_SHORTNAME}" test_repository ${LAMINAS_CACHE_SHORTNAME}
    fi
    cifold "test ${LAMINAS_DIACTOROS_SHORTNAME}" test_repository ${LAMINAS_DIACTOROS_SHORTNAME}
)

function upload_coverage() (
    set -o errexit -o pipefail -o xtrace

    if [[ "${COVERAGE}" = "true" ]]; then
        echo "Processing coverage"
        lcov --no-checksum --directory . --capture --compat-libtool --output-file coverage.info
        lcov --remove coverage.info "/usr*" \
            --remove coverage.info "*/.phpenv/*" \
            --remove coverage.info "/home/travis/build/include/*" \
            --compat-libtool \
            --output-file coverage.info
    fi

    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        echo "Uploading coverage"
        coveralls-lcov coverage.info
    fi
)

function after_success() (
    set -o errexit -o pipefail

    if [[ "${COVERAGE}" = "true" ]]; then
        cifold "upload coverage" upload_coverage
    fi
)

function dump_logs() (
    #set -o errexit -o pipefail -o xtrace

    for i in `find tests -name "*.out" 2>/dev/null`; do
        echo "-- START ${i}";
        cat ${i};
        echo "-- END";
        done
    for i in `find tests -name "*.mem" 2>/dev/null`; do
        echo "-- START ${i}";
        cat ${i};
        echo "-- END";
    done
)

function after_failure() (
    set -o errexit -o pipefail

    cifold "dump logs" dump_logs
)

function run_all() (
    set -o errexit -o pipefail
    trap after_failure ERR
    before_install
    install
    before_script
    script
    after_success
)

if [ "$1" == "run-all-now" ]; then
    run_all
fi
