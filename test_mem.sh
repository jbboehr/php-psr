#!/bin/sh

# sed really doesn't like me
php -r 'file_put_contents("run-tests.php", str_replace(array("([0-9])", "[.-\\w]"), array("([0-9]+)", "[.\\-\\w]"), file_get_contents("run-tests.php")));'
TEST_PHP_ARGS=-m make test $@
