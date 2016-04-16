
# php-psr

[![Build Status](https://travis-ci.org/jbboehr/php-psr.svg?branch=master)](https://travis-ci.org/jbboehr/php-psr)

PHP extension providing the accepted [PSR](http://www.php-fig.org/psr/) interfaces, so they can be used [in an extension](https://github.com/jbboehr/php-handlebars/blob/v0.7.1/impl.c#L215).


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
```


## License

This project is licensed under the [LGPLv3](http://www.gnu.org/licenses/lgpl-3.0.txt).

