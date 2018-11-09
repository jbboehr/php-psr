--TEST--
Psr\Http\Client\RequestExceptionInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Http\Message\RequestInterface;
use Psr\Http\Client\RequestExceptionInterface;
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
var_dump(class_implements('Psr\Http\Client\RequestExceptionInterface', false));
class MyException extends Exception implements RequestExceptionInterface {
    public function getRequest(): RequestInterface {
        var_dump(__METHOD__);
        return new SampleRequest();
    }
}
$ex = new MyException('test');
var_dump($ex instanceof RequestExceptionInterface);
var_dump($ex instanceof Psr\Http\Client\ClientExceptionInterface);
var_dump($ex instanceof Exception);
var_dump($ex instanceof Throwable);
try {
    throw $ex;
} catch( RequestExceptionInterface $e ) {
    var_dump($e->getMessage());
    var_dump($e->getRequest());
}
--EXPECTF--
array(2) {
  ["Psr\Http\Client\ClientExceptionInterface"]=>
  string(40) "Psr\Http\Client\ClientExceptionInterface"
  ["Throwable"]=>
  string(9) "Throwable"
}
bool(true)
bool(true)
bool(true)
bool(true)
string(4) "test"
string(23) "MyException::getRequest"
object(SampleRequest)#%d (0) {
}
