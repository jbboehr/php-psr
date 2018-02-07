
# php-psr

[![Build Status](https://travis-ci.org/jbboehr/php-psr.svg?branch=master)](https://travis-ci.org/jbboehr/php-psr)
[![Build status](https://ci.appveyor.com/api/projects/status/x1ymkqggy1mkl0ux/branch/master?svg=true)](https://ci.appveyor.com/project/jbboehr/php-psr/branch/master)
[![Coverage Status](https://coveralls.io/repos/jbboehr/php-psr/badge.svg?branch=master&service=github)](https://coveralls.io/github/jbboehr/php-psr?branch=master)
[![License](https://img.shields.io/badge/license-BSD-brightgreen.svg)](LICENSE.md)

PHP extension providing the accepted [PSR](http://www.php-fig.org/psr/) interfaces, so they can be used [in an extension](https://github.com/jbboehr/php-handlebars/blob/v0.7.1/impl.c#L213-L215).

- [PSR-3](http://www.php-fig.org/psr/psr-3/) - [psr/log](https://github.com/php-fig/log) - tested against [monolog](https://github.com/Seldaek/monolog)
- [PSR-6](http://www.php-fig.org/psr/psr-6/) - [psr/cache](https://github.com/php-fig/cache) - tested against [Stash](https://github.com/tedious/Stash) and [psx-cache](https://github.com/apioo/psx-cache)
- [PSR-7](http://www.php-fig.org/psr/psr-7/) - [psr/http-message](https://github.com/php-fig/http-message) - tested against [guzzle/psr7](https://github.com/guzzle/psr7)
- [PSR-11](http://www.php-fig.org/psr/psr-11/) - [psr/container](https://github.com/php-fig/container) - tested against [league/container](https://github.com/thephpleague/container)
- [PSR-13](http://www.php-fig.org/psr/psr-13/) - [psr/link](https://github.com/php-fig/link) - tested against [php-fig/link-util](https://github.com/php-fig/link-util)
- [PSR-15](http://www.php-fig.org/psr/psr-15/) - [psr/http-server-handler](https://github.com/php-fig/http-server-handler) - tested against [equip/dispatch](https://github.com/equip/dispatch)
- [PSR-15](http://www.php-fig.org/psr/psr-15/) - [psr/http-server-middleware](https://github.com/php-fig/http-server-middleware) - tested against [middleware/request-handler](https://github.com/middlewares/request-handler)
- [PSR-16](http://www.php-fig.org/psr/psr-16/) - [psr/simple-cache](https://github.com/php-fig/simple-cache) - tested against [psx-cache](https://github.com/apioo/psx-cache)


## Installation

### Ubuntu

```bash
sudo apt-get install php5-dev
git clone https://github.com/jbboehr/php-psr.git
cd php-psr
phpize
./configure
make
make test
sudo make install

# precise
echo extension=psr.so | sudo tee /etc/php5/conf.d/psr.ini

# trusty
echo extension=psr.so | sudo tee /etc/php5/mods-available/psr.ini
sudo php5enmod psr

# xenial
echo extension=psr.so | sudo tee /etc/php5/mods-available/psr.ini
sudo phpenmod psr
```


## License

This project is licensed under the [Simplified BSD License](LICENSE.md).

