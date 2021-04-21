--TEST--
Psr\Http\Message\ServerRequestFactoryInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleUri.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleServerRequest.inc';
include __DIR__ . '/SampleServerRequestFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\ServerRequestFactoryInterface', false));
var_dump(class_implements('SampleServerRequestFactory', false));
$factory = new SampleServerRequestFactory();
$request = $factory->createServerRequest('GET', 'http://domain.com');
var_dump($request instanceof \Psr\Http\Message\ServerRequestInterface);
$request = $factory->createServerRequest('POST', new SampleUri(), ['param' => 'value']);
--EXPECTF--
bool(true)
array(1) {
  ["NativePsrExt\Http\Message\ServerRequestFactoryInterface"]=>
  string(55) "NativePsrExt\Http\Message\ServerRequestFactoryInterface"
}
string(47) "SampleServerRequestFactory::createServerRequest"
string(3) "GET"
string(17) "http://domain.com"
array(0) {
}
bool(true)
string(47) "SampleServerRequestFactory::createServerRequest"
string(4) "POST"
object(SampleUri)#%d (0) {
}
array(1) {
  ["param"]=>
  string(5) "value"
}
