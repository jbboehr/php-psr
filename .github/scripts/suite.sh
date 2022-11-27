#!/usr/bin/env bash

set -o errexit -o pipefail

source .github/scripts/fold.sh

export PS4=' \e[33m$(date +"%H:%M:%S"): $BASH_SOURCE@$LINENO ${FUNCNAME[0]} -> \e[0m'
export COVERAGE=${COVERAGE:-true}
export PHP_VERSION_ID=$(php -r 'echo PHP_VERSION_ID;')
# error_reporting='E_ALL & ~E_DEPRECATED'
export PHP_WITH_EXT="`which php` -d error_reporting=24575 -d extension=`pwd`/modules/psr.so"
export DEFAULT_COMPOSER_FLAGS="--ansi --no-interaction --no-progress --prefer-dist --ignore-platform-reqs"
export PHP_VERSION_ID=$(php -r 'echo PHP_VERSION_ID;')

export NO_INTERACTION=1
export REPORT_EXIT_STATUS=1
export TEST_PHP_EXECUTABLE=`which php`

function install_coveralls_lcov() (
    set -o errexit -o pipefail -o xtrace

    # Don't install this unless we're actually on travis
    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        gem install coveralls-lcov
    fi
)

function before_install() (
    set -o errexit -o pipefail

    # Don't install this unless we're actually on travis
    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        cifold "install coveralls-lcov" install_coveralls_lcov
    fi
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
