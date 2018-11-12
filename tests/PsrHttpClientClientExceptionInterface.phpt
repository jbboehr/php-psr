--TEST--
Psr\Http\Client\ClientExceptionInterface
--SKIPIF--
<?php if( !extension_loaded('psr') || PHP_MAJOR_VERSION < 7 ) die('skip '); ?>
--FILE--
<?php
use Psr\Http\Client\ClientExceptionInterface;
var_dump(class_implements('Psr\Http\Client\ClientExceptionInterface', false));
class MyException extends Exception implements ClientExceptionInterface {}
$ex = new MyException('test');
var_dump($ex instanceof ClientExceptionInterface);
var_dump($ex instanceof Exception);
var_dump($ex instanceof Throwable);
try {
    throw $ex;
} catch( ClientExceptionInterface $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
array(1) {
  ["Throwable"]=>
  string(9) "Throwable"
}
bool(true)
bool(true)
bool(true)
string(4) "test"
