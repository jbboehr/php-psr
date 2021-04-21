--TEST--
Psr\Http\Message\RequestInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleUri.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\RequestInterface', false));
var_dump(is_subclass_of('\\Psr\\Http\\Message\\RequestInterface', '\\Psr\\Http\\Message\\MessageInterface'));
var_dump(class_implements('SampleRequest', false));
$request = new SampleRequest();
var_dump($request instanceof \Psr\Http\Message\MessageInterface);
$request->getRequestTarget();
$request->withRequestTarget('test');
$request->getMethod();
$request->withMethod('PUT');
$request->getUri();
$request->withUri(new SampleUri());
$request->withUri(new SampleUri(), true);
--EXPECTF--
bool(true)
bool(true)
array(2) {
  ["PsrExt\Http\Message\MessageInterface"]=>
  string(36) "PsrExt\Http\Message\MessageInterface"
  ["PsrExt\Http\Message\RequestInterface"]=>
  string(36) "PsrExt\Http\Message\RequestInterface"
}
bool(true)
string(31) "SampleRequest::getRequestTarget"
string(32) "SampleRequest::withRequestTarget"
string(4) "test"
string(24) "SampleRequest::getMethod"
string(25) "SampleRequest::withMethod"
string(3) "PUT"
string(21) "SampleRequest::getUri"
string(22) "SampleRequest::withUri"
object(SampleUri)#%d (0) {
}
bool(false)
string(22) "SampleRequest::withUri"
object(SampleUri)#%d (0) {
}
bool(true)
