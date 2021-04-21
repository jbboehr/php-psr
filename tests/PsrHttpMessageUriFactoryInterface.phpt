--TEST--
Psr\Http\Message\UriFactoryInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleUri.inc';
include __DIR__ . '/SampleUriFactory.inc';
var_dump(interface_exists('\\Psr\\Http\\Message\\UriFactoryInterface', false));
var_dump(class_implements('SampleUriFactory', false));
$factory = new SampleUriFactory();
$uri = $factory->createUri();
var_dump($uri instanceof \Psr\Http\Message\UriInterface);
$factory->createUri('http://domain.com');
--EXPECT--
bool(true)
array(1) {
  ["PsrExt\Http\Message\UriFactoryInterface"]=>
  string(39) "PsrExt\Http\Message\UriFactoryInterface"
}
string(27) "SampleUriFactory::createUri"
string(0) ""
bool(true)
string(27) "SampleUriFactory::createUri"
string(17) "http://domain.com"
