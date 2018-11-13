--TEST--
Psr\Container\NotFoundExceptionInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
class MyException extends Exception implements NotFoundExceptionInterface {}
$ex = new MyException('test');
var_dump($ex instanceof ContainerExceptionInterface);
var_dump($ex instanceof NotFoundExceptionInterface);
var_dump($ex instanceof Exception);
try {
    throw $ex;
} catch( NotFoundExceptionInterface $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
bool(true)
bool(true)
bool(true)
string(4) "test"
