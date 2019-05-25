--TEST--
Psr\Http\Message\StreamFactoryInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleStream.inc';
include __DIR__ . '/SampleStreamFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\StreamFactoryInterface', false));
var_dump(class_implements('SampleStreamFactory', false));
$factory = new SampleStreamFactory();
$stream = $factory->createStream();
var_dump($stream instanceof \Psr\Http\Message\StreamInterface);
$factory->createStream('content');
$stream = $factory->createStreamFromFile('/tmp/file1');
var_dump($stream instanceof \Psr\Http\Message\StreamInterface);
$factory->createStreamFromFile('/tmp/file2', 'wb');
$stream = $factory->createStreamFromResource(fopen('php://memory', 'r'));
var_dump($stream instanceof \Psr\Http\Message\StreamInterface);
--EXPECTF--
bool(true)
array(1) {
  ["Psr\Http\Message\StreamFactoryInterface"]=>
  string(39) "Psr\Http\Message\StreamFactoryInterface"
}
string(33) "SampleStreamFactory::createStream"
string(0) ""
bool(true)
string(33) "SampleStreamFactory::createStream"
string(7) "content"
string(41) "SampleStreamFactory::createStreamFromFile"
string(10) "/tmp/file1"
string(1) "r"
bool(true)
string(41) "SampleStreamFactory::createStreamFromFile"
string(10) "/tmp/file2"
string(2) "wb"
string(45) "SampleStreamFactory::createStreamFromResource"
resource(%d) of type (stream)
bool(true)
