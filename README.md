
# php-psr

The module implementation for the [PSR][:psr-fig:] standards as established by the [PHP-FIG][:php-fig:] group.

[![Build Status][:badge-travis:]][:build-travis:]
[![Build status][:badge-appveyor:]][:build-appveyor:]
[![Coverage Status][:badge-coveralls:]][:build-coveralls:]
[![License][:badge-license:]][:ext-license:]

This project is aimed to provide the accepted PSR interfaces in PHP extension form.
You can use interfaces provided by this extension easily, [exactly in the same way as you normally do][:example:].

## Interfaces

- [PSR-3][:psr-3:] - [psr/log][:psr-log:] - tested against [monolog][:monolog:]
- [PSR-6][:psr-6:] - [psr/cache][:psr-cache:] - tested against [Stash][:stash:] and [psx-cache][:psx-cache:]
- [PSR-7][:psr-7:] - [psr/http-message][:psr-http-message:] - tested against [guzzle/psr7][:guzzle:]
- [PSR-11][:psr-11:] - [psr/container][:psr-container:] - tested against [league/container][:league-container:]
- [PSR-13][:psr-13:] - [psr/link][:psr-link:] - tested against [php-fig/link-util][:link-util:]
- [PSR-16][:psr-16:] - [psr/simple-cache][:psr-simple-cache:] - tested against [psx-cache][:psx-cache:]

## Requirements

Prerequisite packages are:

- PHP development headers and tools
- `gcc` >= 4.4 | `clang` >= 3.x | `vc` >= 11
- GNU `make` >= 3.81
- `automake`
- `autoconf`

You will need PHP development headers. If PHP was manually installed, these should be available by default. Otherwise, you will need to fetch them from a repository.

## Installation

### Linux / macOS

You can install the PSR extension from source.
Building from source is straightforward. Follow these instructions to generate a binary extension for your platform:

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
phpize
./configure --with-php-config=/usr/local/bin/php-config
make
make test
sudo make install
```

Add the extension to your *php.ini*:

```ini
echo extension=psr.so
```

Finally, _restart the web server_.

## License

This project is open source software licensed under the Simplified BSD License.
See the [LICENSE.md][:ext-license:] file for more information.

PSR Interfaces: Copyright (c) 2012-present [PHP Framework Interoperability Group][:php-fig:].

[:psr-fig:]: http://www.php-fig.org/psr
[:php-fig:]: http://www.php-fig.org
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
[:psr-6:]: http://www.php-fig.org/psr/psr-6
[:psr-cache:]: https://github.com/php-fig/cache
[:stash:]: https://github.com/tedious/Stash
[:psx-cache:]: https://github.com/apioo/psx-cache
[:psr-7:]: http://www.php-fig.org/psr/psr-7
[:psr-http-message:]: https://github.com/php-fig/http-message
[:guzzle:]: https://github.com/guzzle/psr7
[:psr-11:]: http://www.php-fig.org/psr/psr-11
[:psr-container:]: https://github.com/php-fig/container
[:league-container:]: https://github.com/thephpleague/container
[:psr-13:]: http://www.php-fig.org/psr/psr-13
[:psr-link:]: https://github.com/php-fig/link
[:link-util:]: https://github.com/php-fig/link-util
[:psr-16:]: http://www.php-fig.org/psr/psr-16
[:psr-simple-cache:]: https://github.com/php-fig/simple-cache
