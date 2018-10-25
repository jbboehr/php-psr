--TEST--
Psr\Http\Message\ServerRequestInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleServerRequest.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\ServerRequestInterface', false));
$ifaces = class_implements('SampleServerRequest', false);
ksort($ifaces);
var_dump($ifaces);
$request = new SampleServerRequest();
var_dump($request instanceof \Psr\Http\Message\MessageInterface);
var_dump($request instanceof \Psr\Http\Message\RequestInterface);
$request->getServerParams();
$request->getCookieParams();
$request->withCookieParams(array('a' => 'b'));
$request->getQueryParams();
$request->withQueryParams(array('c' => 'd'));
$request->getUploadedFiles();
$request->withUploadedFiles(array());
$request->getParsedBody();
$request->withParsedBody('body');
$request->getAttributes();
$request->getAttribute('attr');
$request->getAttribute('attr', 'bar');
$request->withAttribute('foo', 'baz');
$request->withoutAttribute('bar');
--EXPECT--
bool(true)
array(3) {
  ["Psr\Http\Message\MessageInterface"]=>
  string(33) "Psr\Http\Message\MessageInterface"
  ["Psr\Http\Message\RequestInterface"]=>
  string(33) "Psr\Http\Message\RequestInterface"
  ["Psr\Http\Message\ServerRequestInterface"]=>
  string(39) "Psr\Http\Message\ServerRequestInterface"
}
bool(true)
bool(true)
string(36) "SampleServerRequest::getServerParams"
string(36) "SampleServerRequest::getCookieParams"
string(37) "SampleServerRequest::withCookieParams"
array(1) {
  ["a"]=>
  string(1) "b"
}
string(35) "SampleServerRequest::getQueryParams"
string(36) "SampleServerRequest::withQueryParams"
array(1) {
  ["c"]=>
  string(1) "d"
}
string(37) "SampleServerRequest::getUploadedFiles"
string(38) "SampleServerRequest::withUploadedFiles"
array(0) {
}
string(34) "SampleServerRequest::getParsedBody"
string(35) "SampleServerRequest::withParsedBody"
string(4) "body"
string(34) "SampleServerRequest::getAttributes"
string(33) "SampleServerRequest::getAttribute"
string(4) "attr"
NULL
string(33) "SampleServerRequest::getAttribute"
string(4) "attr"
string(3) "bar"
string(34) "SampleServerRequest::withAttribute"
string(3) "foo"
string(3) "baz"
string(37) "SampleServerRequest::withoutAttribute"
string(3) "bar"
