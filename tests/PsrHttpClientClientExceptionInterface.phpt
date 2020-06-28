--TEST--
Psr\Http\Client\ClientExceptionInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Http\Client\ClientExceptionInterface;
var_dump(is_subclass_of(ClientExceptionInterface::class, Throwable::class));
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
bool(true)
bool(true)
bool(true)
bool(true)
string(4) "test"
