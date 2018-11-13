--TEST--
Psr\Http\Message\RequestFactoryInterface
--SKIPIF--
<?php include('skip_for_php5.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleUri.inc';
include __DIR__ . '/SampleRequestFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\RequestFactoryInterface', false));
var_dump(class_implements('SampleRequestFactory', false));
$factory = new SampleRequestFactory();
$request = $factory->createRequest('GET', 'http://domain.com');
var_dump($request instanceof \Psr\Http\Message\RequestInterface);
$factory->createRequest('POST', new SampleUri());
--EXPECTF--
bool(true)
array(1) {
  ["Psr\Http\Message\RequestFactoryInterface"]=>
  string(40) "Psr\Http\Message\RequestFactoryInterface"
}
string(35) "SampleRequestFactory::createRequest"
string(3) "GET"
string(17) "http://domain.com"
bool(true)
string(35) "SampleRequestFactory::createRequest"
string(4) "POST"
object(SampleUri)#%d (0) {
}
