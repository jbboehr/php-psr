#!/usr/bin/env bash

# set -e

case "$1" in
monolog_init)
	rm -rf monolog
	git clone -b $MONOLOG_VERSION https://github.com/Seldaek/monolog.git
	cd monolog
	composer install
	rm -f vendor/psr/log/Psr/Log/*.php
	cd ..
	;;
monolog_test)
	php -d extension=modules/psr.so ./monolog/vendor/bin/phpunit -c monolog/
	;;
stash_init)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ]; then
		rm -rf Stash
		git clone -b v1.0.0-dev https://github.com/tedious/Stash.git
		cd Stash
		composer install
		rm -f vendor/psr/cache/src/*.php
		cd ..
	else
		echo Stash does not support PHP 5.3
	fi
	;;
stash_test)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ]; then
		php -d extension=modules/psr.so ./Stash/vendor/bin/phpunit -c Stash/
	else
		echo Stash does not support PHP 5.3
	fi
	;;
psr7_init)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ]; then
		rm -rf psr7
		git clone -b $GUZZLE_PSR7_VERSION https://github.com/guzzle/psr7.git
		cd psr7
		composer install
		rm -f vendor/psr/http-message/src/*.php
		cd ..
	else
		echo PSR7 does not support PHP 5.3
	fi
	;;
psr7_test)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ]; then
		php -d extension=modules/psr.so ./psr7/vendor/bin/phpunit -c psr7/
	else
		echo PSR7 does not support PHP 5.3
	fi
	;;
psx_cache_init)
    rm -rf psx-cache
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ] && [ "$TRAVIS_PHP_VERSION" != "5.4" ]; then
		git clone -b ${PSX_CACHE_VERSION:-master} https://github.com/apioo/psx-cache.git
		cd psx-cache
		composer install
		rm -rf vendor/psr
		cd ..
	else
		echo psx-cache does not support PHP 5.3 or PHP 5.4
	fi
	;;
psx_cache_test)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ] && [ "$TRAVIS_PHP_VERSION" != "5.4" ]; then
		php -d extension=modules/psr.so ./psx-cache/vendor/bin/phpunit -c psx-cache/
	else
		echo psx-cache does not support PHP 5.3 or PHP 5.4
	fi
	;;
esac

