#!/usr/bin/env bash

export MONOLOG_VERSION=2.0.0-beta1
export STASH_VERSION=v0.15.2
export PSX_CACHE_VERSION=v1.0.2
export GUZZLE_PSR7_VERSION=1.5.2
export LEAGUE_CONTAINER_VERSION=3.2.2
export LINK_UTIL_VERSION=1.0.0
export DISPATCH_VERSION=2.0.0
export REQUEST_HANDLER_VERSION=v1.3.0
export HTTP_FACTORY_GUZZLE_VERSION=1.0.0
export HTTP_GUZZLE_PSR18_ADAPTER_VERSION=v1.0.1

export COVERAGE=${COVERAGE:-true}

export PHP_MAJOR=$(php -r 'echo phpversion();' | cut -d '.' -f 1)
export PHP_MINOR=$(php -r 'echo phpversion();' | cut -d '.' -f 2)
export PHP_MAJOR_MINOR="${PHP_MAJOR}.${PHP_MINOR}"

export PHP_WITH_EXT="`which php` -d extension=`pwd`/modules/psr.so"

export DEFAULT_COMPOSER_FLAGS="--no-interaction --no-ansi --no-progress --no-suggest"

# friendsofphp/php-cs-fixer v2.9.3 requires php ^5.6 || >=7.0 <7.3
# We'll remove this in the future
if [[ "${PHP_MAJOR_MINOR}" = "7.3" ]] || [[ "${PHP_MAJOR_MINOR}" = "7.4" ]] || [[ "${PHP_MAJOR_MINOR}" = "8.0" ]]; then
    export DEFAULT_COMPOSER_FLAGS="${DEFAULT_COMPOSER_FLAGS} --ignore-platform-reqs"
fi

export NO_INTERACTION=1
export REPORT_EXIT_STATUS=1
export TEST_PHP_EXECUTABLE=`which php`

function init_repository() (
    set -e -o pipefail

    local dir=third-party/${1}
    local ver=${2}
    local repo=${3}
    echo "Downloading ${1}"
	rm -rf ${dir}
	mkdir -p ${dir}
	git clone -b ${ver} ${repo} ${dir}
	cd ${dir}
	composer install ${DEFAULT_COMPOSER_FLAGS}
	# monolog requires the test class, so don't delete everything
	#rm -rf vendor/psr
	find vendor/psr/ -type f -not -iname "*test*" -delete
)

function test_repository() (
    set -e -o pipefail

    local dir=third-party/${1}
    echo "Testing ${1}"
    cd ${dir}
    pwd
    echo ${PHP_WITH_EXT} ./vendor/bin/phpunit
    ${PHP_WITH_EXT} ./vendor/bin/phpunit
)

function before_install() (
    set -e -o pipefail

    # Don't install this unless we're actually on travis
    if [[ "${COVERAGE}" = "true" ]] && [[ "${TRAVIS}" = "true" ]]; then
        gem install coveralls-lcov
    fi

    # install all libraries we test against
    init_repository monolog ${MONOLOG_VERSION} https://github.com/Seldaek/monolog.git
    init_repository stash ${STASH_VERSION} https://github.com/tedious/Stash.git
    init_repository psr7 ${GUZZLE_PSR7_VERSION} https://github.com/guzzle/psr7.git
    init_repository league-container ${LEAGUE_CONTAINER_VERSION} https://github.com/thephpleague/container.git
    init_repository link-util ${LINK_UTIL_VERSION} https://github.com/php-fig/link-util.git
    init_repository psx-cache ${PSX_CACHE_VERSION} https://github.com/apioo/psx-cache.git
    init_repository dispatch ${DISPATCH_VERSION} https://github.com/equip/dispatch.git
    init_repository request-handler ${REQUEST_HANDLER_VERSION} https://github.com/middlewares/request-handler.git
    init_repository http-factory-guzzle ${HTTP_FACTORY_GUZZLE_VERSION} https://github.com/http-interop/http-factory-guzzle.git
    init_repository guzzle-psr18-adapter ${HTTP_GUZZLE_PSR18_ADAPTER_VERSION} https://github.com/ricardofiorani/guzzle-psr18-adapter.git
)

function install() (
    set -e -o pipefail

    phpize
    if [[ "${COVERAGE}" = "true" ]]; then
        ./configure CFLAGS="-fprofile-arcs -ftest-coverage ${CFLAGS}" LDFLAGS="--coverage ${LDFLAGS}"
    else
        ./configure
    fi
    make clean all
)

function before_script() (
    set -e -o pipefail

    if [[ "${COVERAGE}" = "true" ]]; then
        echo "Initializing coverage"
        lcov --directory . --zerocounters
        lcov --directory . --capture --compat-libtool --initial --output-file coverage.info
    fi
)

function script() (
    set -e -o pipefail

    echo "Running main test suite"
    php run-tests.php -d extension=psr.so -d extension_dir=modules -n ./tests/*.phpt

    # run tests for all libraries we test against
    test_repository monolog
    test_repository stash
    test_repository psr7
    test_repository league-container
    test_repository link-util
    test_repository psx-cache
    test_repository dispatch
    test_repository request-handler
    test_repository http-factory-guzzle
    test_repository guzzle-psr18-adapter
)

function after_success() (
    set -e -o pipefail

    if [[ "${COVERAGE}" = "true" ]]; then
        echo "Processing coverage"
        lcov --no-checksum --directory . --capture --compat-libtool --output-file coverage.info
        lcov --remove coverage.info "/usr*" \
            --remove coverage.info "*/.phpenv/*" \
            --remove coverage.info "/home/travis/build/include/*" \
            --compat-libtool \
            --output-file coverage.info

        echo "Uploading coverage"
        coveralls-lcov coverage.info
    fi
)

function after_failure() (
    set -e -o pipefail

		for i in core core*; do
			if [ -f "$i" -a "$(file "$i" | grep -o 'core file')" ]; then
				gdb -q $(phpenv which php) "$i" <<EOF
set pagination 0
backtrace full
info registers
x/16i \$pc
thread apply all backtrace
quit
EOF
			fi
		done

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

function run_all() (
    set -e
    trap after_failure ERR
    before_install
    install
    before_script
    script
    after_success
)
