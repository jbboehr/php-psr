#!/bin/sh

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
	rm -rf Stash
	git clone -b v1.0.0-dev https://github.com/tedious/Stash.git
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
	git clone -b $GUZZLE_PSR7_VERSION https://github.com/guzzle/psr7.git
	cd psr7
	composer install
	rm -f vendor/psr/http-message/src/*.php
	cd ..
	;;
psr7_test)
	php -d extension=modules/psr.so ./psr7/vendor/bin/phpunit -c psr7/
	;;
league_container_init)
	rm -rf league-container
	git clone -b ${LEAGUE_CONTAINER_VERSION:-master} https://github.com/thephpleague/container.git league-container
	cd league-container
	composer install
	rm -rf vendor/psr
	cd ..
	;;
league_container_test)
	php -d extension=modules/psr.so ./league-container/vendor/bin/phpunit -c league-container
	;;
esac

exit 0
