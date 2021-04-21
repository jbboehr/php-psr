--TEST--
Psr\Http\Message\ResponseFactoryInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleResponse.inc';
include __DIR__ . '/SampleResponseFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\ResponseFactoryInterface', false));
var_dump(class_implements('SampleResponseFactory', false));
$factory = new SampleResponseFactory();
$response = $factory->createResponse();
var_dump($response instanceof \Psr\Http\Message\ResponseInterface);
$factory->createResponse(400, 'BAD REQUEST');
--EXPECT--
bool(true)
array(1) {
  ["NativePsrExt\Http\Message\ResponseFactoryInterface"]=>
  string(50) "NativePsrExt\Http\Message\ResponseFactoryInterface"
}
string(37) "SampleResponseFactory::createResponse"
int(200)
string(0) ""
bool(true)
string(37) "SampleResponseFactory::createResponse"
int(400)
string(11) "BAD REQUEST"
