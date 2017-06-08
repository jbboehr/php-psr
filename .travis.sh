#!/usr/bin/env bash

set -ex

case "$1" in
monolog_init)
	rm -rf monolog
	git clone -b ${MONOLOG_VERSION:-master} https://github.com/Seldaek/monolog.git
	cd monolog
	composer install
	rm -f vendor/psr/log/Psr/Log/*.php
	cd ..
	;;
monolog_test)
	php -d extension=modules/psr.so ./monolog/vendor/bin/phpunit -c monolog/
	;;
stash_init)
	rm -rf Stash
	git clone -b ${STASH_VERSION:-master} https://github.com/tedious/Stash.git
	cd Stash
	composer install
	rm -f vendor/psr/cache/src/*.php
	cd ..
	;;
stash_test)
	php -d extension=modules/psr.so ./Stash/vendor/bin/phpunit -c Stash/
	;;
psr7_init)
	rm -rf psr7
	git clone -b ${GUZZLE_PSR7_VERSION:-master} https://github.com/guzzle/psr7.git
	cd psr7
	composer install
	rm -f vendor/psr/http-message/src/*.php
	cd ..
	;;
psr7_test)
	php -d extension=modules/psr.so ./psr7/vendor/bin/phpunit -c psr7/
	;;
link_util_init)
	rm -rf link-util
	git clone -b ${LINK_UTIL_VERSION:-master} https://github.com/php-fig/link-util.git
	cd link-util
	composer install
	rm -rf vendor/psr/link
	cd ..
	;;
link_util_test)
	php -d extension=modules/psr.so ./link-util/vendor/bin/phpunit -c link-util/
	;;
esac

exit 0

