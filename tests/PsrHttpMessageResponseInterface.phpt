--TEST--
Psr\Http\Message\ResponseInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleResponse.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\ResponseInterface', false));
var_dump(is_subclass_of('\\Psr\\Http\\Message\\ResponseInterface', '\\Psr\\Http\\Message\\MessageInterface'));
var_dump(class_implements('SampleResponse', false));
$request = new SampleResponse();
var_dump($request instanceof \Psr\Http\Message\MessageInterface);
$request->getStatusCode();
$request->withStatus(400, 'BAD REQUEST');
$request->getReasonPhrase();
--EXPECT--
bool(true)
bool(true)
array(2) {
  ["Psr\Http\Message\MessageInterface"]=>
  string(33) "Psr\Http\Message\MessageInterface"
  ["Psr\Http\Message\ResponseInterface"]=>
  string(34) "Psr\Http\Message\ResponseInterface"
}
bool(true)
string(29) "SampleResponse::getStatusCode"
string(26) "SampleResponse::withStatus"
int(400)
string(11) "BAD REQUEST"
string(31) "SampleResponse::getReasonPhrase"
