
# php-psr

[![GitHub Linux Build Status](https://github.com/jbboehr/php-psr/workflows/linux/badge.svg)](https://github.com/jbboehr/php-psr/actions?query=workflow%3Alinux)
[![GitHub OSX Build Status](https://github.com/jbboehr/php-psr/workflows/osx/badge.svg)](https://github.com/jbboehr/php-psr/actions?query=workflow%3Aosx)
[![GitHub Windows Build Status](https://github.com/jbboehr/php-psr/workflows/windows/badge.svg)](https://github.com/jbboehr/php-psr/actions?query=workflow%3Awindows)
[![GitHub Docker Build Status](https://github.com/jbboehr/php-psr/workflows/docker/badge.svg)](https://github.com/jbboehr/php-psr/actions?query=workflow%3Adocker)
[![Appveyor Build Status][:badge-appveyor:]][:build-appveyor:]
[![Coverage Status][:badge-coveralls:]][:build-coveralls:]
[![License][:badge-license:]][:ext-license:]



This PHP extension provides the interfaces from the [PSR][:psr-fig:] standards as established by the [PHP-FIG][:php-fig:] group.
You can use interfaces provided by this extension in another extension easily - see this [example][:example:].

## Interfaces

| PSR | Reference | Tested against |
| --- | --- | --- |
| [PSR-3] | [psr/log] [*](#psrlogunimpl) | [monolog/monolog] |
| [PSR-6] | [psr/cache] | [psx/cache], [php-fig/cache-util] |
| [PSR-7] | [psr/http-message] | [laminas/laminas-diactoros] |
| [PSR-11] | [psr/container] | [psx/dependency] |
| [PSR-13] | [psr/link] | [php-fig/link-util] |
| [PSR-14] | [psr/event-dispatcher] | [crell/tukio], [php-fig/event-dispatcher-util] |
| [PSR-15] | [psr/http-server-handler] | [equip/dispatch] |
| [PSR-15] | [psr/http-server-middleware] | [middlewares/request-handler] |
| [PSR-16] | [psr/simple-cache] | [psx/cache] |
| [PSR-17] | [psr/http-factory] | [http-interop/http-factory-guzzle] |
| [PSR-18] | [psr/http-client] | [ricardofiorani/guzzle-psr18-adapter] |

## Installation

### Linux / macOS

Prerequisite packages are:

- PHP development headers and tools
- `gcc` >= 4.4 | `clang` >= 3.x | `vc` >= 11
- GNU `make` >= 3.81
- `automake`
- `autoconf`

You will need the PHP development headers. If PHP was manually installed, these should be available by default. Otherwise, you will need to fetch them from a repository.

```bash
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make test
sudo make install
```

If you have specific PHP versions running:

```bash
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
/usr/local/bin/phpize
./configure --with-php-config=/usr/local/bin/php-config
make
make test
sudo make install
```

Add the extension to your *php.ini*:

```ini
echo extension=psr.so | tee -a /path/to/your/php.ini
```

Finally, _restart the web server_.

### PECL / Windows

You may also be able to install this extension via [PECL][:pecl-psr:]:

```bash
pecl install psr
```

or by downloading a DLL from [PECL][:pecl-psr:] or [windows.php.net][:windows-psr:] and placing it in the appropriate directory.

### Nix / NixOS

```bash
nix-env -i -f https://github.com/jbboehr/php-psr/archive/master.tar.gz
```

with a custom version of PHP:

```bash
nix-env -i -f https://github.com/jbboehr/php-psr/archive/master.tar.gz --arg php '(import <nixpkgs> {}).php71'
```

or, in a `.nix` file:

```nix
(import <nixpkgs> {}).callPackage (import (fetchTarball {
  url = https://github.com/jbboehr/php-psr/archive/v1.0.0.tar.gz;
  sha256 = "12237b392rz224r4d8p6pwnldpl2bfrvpcim5947avjd49sn8ss4";
})) {}
```

### Using with composer

In your project, you can prevent the installation of the unnecessary composer packages provided by this extension by adding the following to your `composer.json`. You will need to make sure the extension is installed and enabled in your PHP configuration. You may also want to consider leaving them installed to provide stubs to your IDE. This configuration is not suitable for a library published to packagist.

<a name="psrlogunimpl">Note:</a> `LoggerInterfaceTest` and `TestLogger` from `psr/log` are not implemented. If you use these classes, you should keep `psr/log` installed ([discussion](https://github.com/jbboehr/php-psr/issues/57)).

```json
{
    "name": "sample/app",
    "require": {
        "ext-psr": "*"
    },
    "provide": {
        "psr/log": "^1",
        "psr/cache": "^1",
        "psr/http-message": "^1",
        "psr/container": "^1",
        "psr/link": "^1",
        "psr/event-dispatcher": "^1",
        "psr/http-server-handler": "^1",
        "psr/http-server-middleware": "^1",
        "psr/simple-cache": "^1",
        "psr/http-factory": "^1",
        "psr/http-client": "^1"
    },
}
```

This will use this PHP extension instead of downloading from packagist.

## Credits

* [@sergeyklay][:github-sergeyklay:] - Appveyor and documentation improvements
* [@flyinghail][:github-flyinghail:] - PSR-14, PSR-15, PSR-17, and PSR-18 support
* [@Jan-E][:github-jan-e:] - Original appveyor template
* [All Contributors](https://github.com/jbboehr/php-psr/graphs/contributors)

## License

This project is open source software licensed under the Simplified BSD License.
See the [LICENSE.md][:ext-license:] file for more information.

PSR Interfaces: Copyright (c) 2012-present [PHP Framework Interoperability Group][:php-fig:].

[:psr-fig:]: https://www.php-fig.org/psr
[:php-fig:]: https://www.php-fig.org
[:pecl-psr:]: https://pecl.php.net/package/psr
[:badge-appveyor:]: https://ci.appveyor.com/api/projects/status/x1ymkqggy1mkl0ux/branch/master?svg=true
[:badge-coveralls:]: https://coveralls.io/repos/jbboehr/php-psr/badge.svg?branch=master&service=github
[:badge-license:]: https://img.shields.io/badge/license-BSD-brightgreen.svg
[:build-appveyor:]: https://ci.appveyor.com/project/jbboehr/php-psr/branch/master
[:build-coveralls:]: https://coveralls.io/github/jbboehr/php-psr?branch=master
[:ext-license:]: https://github.com/jbboehr/php-psr/blob/master/LICENSE.md
[:example:]: https://github.com/jbboehr/php-handlebars/blob/v0.7.1/impl.c#L213-L215
[:windows-psr:]: http://windows.php.net/downloads/pecl/releases/psr/

[PSR-3]: http://www.php-fig.org/psr/psr-3
[PSR-6]: https://www.php-fig.org/psr/psr-6
[PSR-7]: https://www.php-fig.org/psr/psr-7
[PSR-11]: https://www.php-fig.org/psr/psr-11
[PSR-13]: https://www.php-fig.org/psr/psr-13
[PSR-14]: http://www.php-fig.org/psr/psr-14
[PSR-15]: http://www.php-fig.org/psr/psr-15
[PSR-16]: https://www.php-fig.org/psr/psr-16
[PSR-17]: https://www.php-fig.org/psr/psr-17
[PSR-18]: https://www.php-fig.org/psr/psr-18

[psr/log]: https://github.com/php-fig/log
[psr/cache]: https://github.com/php-fig/cache
[psr/http-message]: https://github.com/php-fig/http-message
[psr/container]: https://github.com/php-fig/container
[psr/link]: https://github.com/php-fig/link
[psr/simple-cache]: https://github.com/php-fig/simple-cache
[psr/http-server-handler]: https://github.com/php-fig/http-server-handler
[psr/http-server-middleware]: https://github.com/php-fig/http-server-middleware
[psr/http-factory]: https://github.com/php-fig/http-factory
[psr/http-client]: https://github.com/php-fig/http-client
[psr/event-dispatcher]: https://github.com/php-fig/event-dispatcher

[equip/dispatch]: https://github.com/equip/dispatch
[middlewares/request-handler]: https://github.com/middlewares/request-handler
[http-interop/http-factory-guzzle]: https://github.com/http-interop/http-factory-guzzle
[ricardofiorani/guzzle-psr18-adapter]: https://github.com/ricardofiorani/guzzle-psr18-adapter
[monolog/monolog]: https://github.com/Seldaek/monolog
[psx/cache]: https://github.com/apioo/psx-cache
[psx/dependency]: https://github.com/apioo/psx-dependency
[php-fig/link-util]: https://github.com/php-fig/link-util
[crell/tukio]: https://github.com/Crell/Tukio.git
[php-fig/event-dispatcher-util]: https://github.com/php-fig/event-dispatcher-util
[php-fig/cache-util]: https://github.com/php-fig/cache-util
[laminas/laminas-diactoros]: https://github.com/laminas/laminas-diactoros
[php-fig/event-dispatcher-util]: https://github.com/php-fig/event-dispatcher-util

[:github-sergeyklay:]: https://github.com/sergeyklay
[:github-jan-e:]: https://github.com/Jan-E
[:github-flyinghail:]: https://github.com/flyinghail
