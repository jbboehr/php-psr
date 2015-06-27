--TEST--
Psr\Http\Message\ResponseInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleResponse.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\ResponseInterface', false));
var_dump(class_implements('SampleResponse', false));
$request = new SampleResponse();
var_dump($request instanceof \Psr\Http\Message\MessageInterface);
$request->getStatusCode();
$request->withStatus(400, 'BAD REQUEST');
$request->getReasonPhrase();
--EXPECT--
bool(true)
array(1) {
  ["Psr\Http\Message\MessageInterface"]=>
  string(33) "Psr\Http\Message\MessageInterface"
}
bool(true)
string(29) "SampleResponse::getStatusCode"
string(26) "SampleResponse::withStatus"
int(400)
string(11) "BAD REQUEST"
string(31) "SampleResponse::getReasonPhrase"
