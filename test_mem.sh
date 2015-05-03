#!/bin/sh

# sed really doesn't like me
php -r 'file_put_contents("run-tests.php", str_replace("([0-9])", "([0-9]+)", file_get_contents("run-tests.php")));'
TEST_PHP_ARGS=-m make test $@
