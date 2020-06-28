--TEST--
Psr\Http\Client\NetworkExceptionInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Http\Message\RequestInterface;
use Psr\Http\Client\NetworkExceptionInterface;
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
var_dump(is_subclass_of(NetworkExceptionInterface::class, Psr\Http\Client\ClientExceptionInterface::class));
var_dump(is_subclass_of(NetworkExceptionInterface::class, Throwable::class));
class MyException extends Exception implements NetworkExceptionInterface {
    public function getRequest(): RequestInterface {
        var_dump(__METHOD__);
        return new SampleRequest();
    }
}
$ex = new MyException('test');
var_dump($ex instanceof NetworkExceptionInterface);
var_dump($ex instanceof Psr\Http\Client\ClientExceptionInterface);
var_dump($ex instanceof Exception);
var_dump($ex instanceof Throwable);
try {
    throw $ex;
} catch( NetworkExceptionInterface $e ) {
    var_dump($e->getMessage());
    var_dump($e->getRequest());
}
--EXPECTF--
bool(true)
bool(true)
bool(true)
bool(true)
bool(true)
bool(true)
string(4) "test"
string(23) "MyException::getRequest"
object(SampleRequest)#%d (0) {
}
