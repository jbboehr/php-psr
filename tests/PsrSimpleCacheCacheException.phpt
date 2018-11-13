--TEST--
Psr\SimpleCache\CacheException
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\SimpleCache\CacheException;
class MyException extends Exception implements CacheException {}
$ex = new MyException('test');
var_dump($ex instanceof CacheException);
var_dump($ex instanceof Exception);
try {
    throw $ex;
} catch( CacheException $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
bool(true)
bool(true)
string(4) "test"
