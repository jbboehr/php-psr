#!/bin/sh

# set -e

case "$1" in
monolog_init)
	rm -rf monolog
	git clone -b 1.15.0 https://github.com/Seldaek/monolog.git
	cd monolog
	composer install
	rm -f vendor/psr/log/Psr/Log/*.php
	cd ..
	;;
monolog_test)
	php -d extension=modules/psr.so ./monolog/vendor/bin/phpunit -c monolog/
	;;
cache_init)
	rm -rf Cache
	git clone -b master https://github.com/egils/Cache.git
	cd Cache
	composer install
	rm -f Psr/Cache/*.php
	cd ..
	;;
cache_test)
	php -d extension=modules/psr.so ./Cache/vendor/bin/phpunit -c Cache/
	;;
psr7_init)
	if [ "$TRAVIS_PHP_VERSION" != "5.3" ]; then
		rm -rf psr7
		git clone -b 1.1.0 https://github.com/guzzle/psr7.git
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
esac

