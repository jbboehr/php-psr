--TEST--
Psr\Container\ContainerExceptionInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Container\ContainerExceptionInterface;
class MyException extends Exception implements ContainerExceptionInterface {}
$ex = new MyException('test');
var_dump($ex instanceof ContainerExceptionInterface);
var_dump($ex instanceof Exception);
try {
    throw $ex;
} catch( ContainerExceptionInterface $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
bool(true)
bool(true)
string(4) "test"
