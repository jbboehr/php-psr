--TEST--
Psr\Http\Message\MessageInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleStream.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\MessageInterface', false));
var_dump(class_implements('SampleMessage', false));
$message = new SampleMessage();
$message->getProtocolVersion();
$message->withProtocolVersion('1.0');
$message->getHeaders();
$message->hasHeader('content-type');
$message->getHeader('content-type');
$message->getHeaderLine('content-type');
$message->withHeader('content-type', 'text/plain');
$message->withAddedHeader('content-type', 'text/html');
$message->withoutHeader('content-type');
$message->getBody();
$message->withBody(new SampleStream());
--EXPECTF--
bool(true)
array(1) {
  ["NativePsrExt\Http\Message\MessageInterface"]=>
  string(42) "NativePsrExt\Http\Message\MessageInterface"
}
string(33) "SampleMessage::getProtocolVersion"
string(34) "SampleMessage::withProtocolVersion"
string(3) "1.0"
string(25) "SampleMessage::getHeaders"
string(24) "SampleMessage::hasHeader"
string(12) "content-type"
string(24) "SampleMessage::getHeader"
string(12) "content-type"
string(28) "SampleMessage::getHeaderLine"
string(12) "content-type"
string(25) "SampleMessage::withHeader"
string(12) "content-type"
string(10) "text/plain"
string(30) "SampleMessage::withAddedHeader"
string(12) "content-type"
string(9) "text/html"
string(28) "SampleMessage::withoutHeader"
string(12) "content-type"
string(22) "SampleMessage::getBody"
string(23) "SampleMessage::withBody"
object(SampleStream)#%d (0) {
}
