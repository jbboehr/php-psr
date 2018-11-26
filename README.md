
# php-psr

[![Build Status][:badge-travis:]][:build-travis:]
[![Build status][:badge-appveyor:]][:build-appveyor:]
[![Coverage Status][:badge-coveralls:]][:build-coveralls:]
[![License][:badge-license:]][:ext-license:]

This PHP extension provides the interfaces from the [PSR][:psr-fig:] standards as established by the [PHP-FIG][:php-fig:] group.
You can use interfaces provided by this extension in another extension easily - see this [example][:example:].

## Interfaces

| PSR | Reference | Tested against |
| --- | --- | --- |
| [PSR-3][:psr-3:] | [psr/log][:psr-log:] [*](#psrlogunimpl) | [monolog][:monolog:] |
| [PSR-6][:psr-6:] | [psr/cache][:psr-cache:] | [Stash][:stash:] and [psx-cache][:psx-cache:] |
| [PSR-7][:psr-7:] | [psr/http-message][:psr-http-message:] | [guzzle/psr7][:guzzle:] |
| [PSR-11][:psr-11:] | [psr/container][:psr-container:] | [league/container][:league-container:] |
| [PSR-13][:psr-13:] | [psr/link][:psr-link:] | [php-fig/link-util][:link-util:] |
| [PSR-15][:psr-15:] | [psr/http-server-handler][:psr-http-server-handler:] | [equip/dispatch][:dispatch:] |
| [PSR-15][:psr-15:] | [psr/http-server-middleware][:psr-http-server-middleware:] | [middleware/request-handler][:request-handler:] |
| [PSR-16][:psr-16:] | [psr/simple-cache][:psr-simple-cache:] | [psx-cache][:psx-cache:] |
| [PSR-17][:psr-17:] | [psr/http-factory][:psr-http-factory:] | [http-interop/http-factory-guzzle][:http-factory-guzzle:] |
| [PSR-18][:psr-18:] | [psr/http-client][:psr-http-client:] | [ricardofiorani/guzzle-psr18-adapter][:guzzle-psr18-adapter:] |

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

### Nix/NixOS

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
  url = https://github.com/jbboehr/php-psr/archive/v0.6.0.tar.gz;
  sha256 = "1zslwrjpzsvvnr5igy0j6z7hgjvrflzk7j20v6w0pc2v124g5ykk";
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
* [@flyinghail][:github-flyinghail:] - PSR-15, PSR-17, and PSR-18 support
* [@Jan-E][:github-jan-e:] - Original appveyor template

## License

This project is open source software licensed under the Simplified BSD License.
See the [LICENSE.md][:ext-license:] file for more information.

PSR Interfaces: Copyright (c) 2012-present [PHP Framework Interoperability Group][:php-fig:].

[:psr-fig:]: https://www.php-fig.org/psr
[:php-fig:]: https://www.php-fig.org
[:pecl-psr:]: https://pecl.php.net/package/psr
[:badge-travis:]: https://travis-ci.org/jbboehr/php-psr.svg?branch=master
[:badge-appveyor:]: https://ci.appveyor.com/api/projects/status/x1ymkqggy1mkl0ux/branch/master?svg=true
[:badge-coveralls:]: https://coveralls.io/repos/jbboehr/php-psr/badge.svg?branch=master&service=github
[:badge-license:]: https://img.shields.io/badge/license-BSD-brightgreen.svg
[:build-travis:]: https://travis-ci.org/jbboehr/php-psr
[:build-appveyor:]: https://ci.appveyor.com/project/jbboehr/php-psr/branch/master
[:build-coveralls:]: https://coveralls.io/github/jbboehr/php-psr?branch=master
[:ext-license:]: https://github.com/jbboehr/php-psr/blob/master/LICENSE.md
[:example:]: https://github.com/jbboehr/php-handlebars/blob/v0.7.1/impl.c#L213-L215
[:psr-3:]: http://www.php-fig.org/psr/psr-3
[:psr-log:]: https://github.com/php-fig/log
[:monolog:]: https://github.com/Seldaek/monolog
[:psr-6:]: https://www.php-fig.org/psr/psr-6
[:psr-cache:]: https://github.com/php-fig/cache
[:stash:]: https://github.com/tedious/Stash
[:psx-cache:]: https://github.com/apioo/psx-cache
[:psr-7:]: https://www.php-fig.org/psr/psr-7
[:psr-http-message:]: https://github.com/php-fig/http-message
[:guzzle:]: https://github.com/guzzle/psr7
[:psr-11:]: https://www.php-fig.org/psr/psr-11
[:psr-container:]: https://github.com/php-fig/container
[:league-container:]: https://github.com/thephpleague/container
[:psr-13:]: https://www.php-fig.org/psr/psr-13
[:psr-link:]: https://github.com/php-fig/link
[:link-util:]: https://github.com/php-fig/link-util
[:psr-16:]: https://www.php-fig.org/psr/psr-16
[:psr-simple-cache:]: https://github.com/php-fig/simple-cache
[:windows-psr:]: http://windows.php.net/downloads/pecl/releases/psr/
[:github-sergeyklay:]: https://github.com/sergeyklay
[:github-jan-e:]: https://github.com/Jan-E
[:github-flyinghail:]: https://github.com/flyinghail
[:psr-15:]: http://www.php-fig.org/psr/psr-15
[:psr-http-server-handler:]: https://github.com/php-fig/http-server-handler
[:psr-http-server-middleware:]: https://github.com/php-fig/http-server-middleware
[:dispatch:]: https://github.com/equip/dispatch
[:request-handler:]: https://github.com/middlewares/request-handler
[:psr-17:]: https://www.php-fig.org/psr/psr-17
[:psr-http-factory:]: https://github.com/php-fig/http-factory
[:http-factory-guzzle:]: https://github.com/http-interop/http-factory-guzzle
[:psr-18:]: https://www.php-fig.org/psr/psr-18
[:psr-http-client:]: https://github.com/php-fig/http-client
[:guzzle-psr18-adapter:]: https://github.com/ricardofiorani/guzzle-psr18-adapter
