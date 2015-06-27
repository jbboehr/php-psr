--TEST--
Psr\Cache\CacheException
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Cache\CacheException;
class MyCacheException extends Exception implements CacheException {}
$ex = new MyCacheException('test');
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
