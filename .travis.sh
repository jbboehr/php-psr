#!/usr/bin/env bash

set -ex

case "$1" in
monolog_init)
	rm -rf monolog
	git clone -b ${MONOLOG_VERSION:-master} https://github.com/Seldaek/monolog.git
	cd monolog
	composer install $DEFAULT_COMPOSER_FLAGS
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
	composer install $DEFAULT_COMPOSER_FLAGS
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
	composer install $DEFAULT_COMPOSER_FLAGS
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
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr
	cd ..
	;;
league_container_test)
	php -d extension=modules/psr.so ./league-container/vendor/bin/phpunit -c league-container
	;;
link_util_init)
	rm -rf link-util
	git clone -b ${LINK_UTIL_VERSION:-master} https://github.com/php-fig/link-util.git
	cd link-util
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr/link
	cd ..
	;;
link_util_test)
	php -d extension=modules/psr.so ./link-util/vendor/bin/phpunit -c link-util/
	;;
psx_cache_init)
	rm -rf psx-cache
	git clone -b ${PSX_CACHE_VERSION:-master} https://github.com/apioo/psx-cache.git
	cd psx-cache
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr
	cd ..
	;;
psx_cache_test)
	php -d extension=modules/psr.so ./psx-cache/vendor/bin/phpunit -c psx-cache/
	;;
dispatch_init)
	rm -rf dispatch
	git clone -b ${DISPATCH_VERSION:-master} https://github.com/equip/dispatch.git
	cd dispatch
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr
	cd ..
	;;
dispatch_test)
	php -d extension=modules/psr.so ./dispatch/vendor/bin/phpunit -c dispatch/
	;;
request_handler_init)
	rm -rf request-handler
	git clone -b ${REQUEST_HANDLER_VERSION:-master} https://github.com/middlewares/request-handler.git
	cd request-handler
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr
	cd ..
	;;
request_handler_test)
	php -d extension=modules/psr.so ./request-handler/vendor/bin/phpunit -c request-handler/
	;;
http_factory_guzzle_init)
	rm -rf http-factory-guzzle
	git clone -b ${HTTP_FACTORY_GUZZLE_VERSION:-master} https://github.com/http-interop/http-factory-guzzle.git
	cd http-factory-guzzle
	composer install $DEFAULT_COMPOSER_FLAGS
	rm -rf vendor/psr
	cd ..
	;;
http_factory_guzzle_test)
	php -d extension=modules/psr.so ./http-factory-guzzle/vendor/bin/phpunit -c http-factory-guzzle/
	;;
esac

exit 0
