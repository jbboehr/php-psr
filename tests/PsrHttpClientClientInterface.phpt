--TEST--
Psr\Http\Client\ClientInterface
--SKIPIF--
<?php if( !extension_loaded('psr') || PHP_MAJOR_VERSION < 7 ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleResponse.inc';
include __DIR__ . '/SampleClient.inc';
var_dump(interface_exists('\\Psr\\Http\\Client\\ClientInterface', false));
var_dump(class_implements('SampleClient', false));
$client = new SampleClient();
$request = new SampleRequest();
$response = $client->sendRequest($request);
var_dump($response instanceof \Psr\Http\Message\ResponseInterface);
--EXPECTF--
bool(true)
array(1) {
  ["Psr\Http\Client\ClientInterface"]=>
  string(31) "Psr\Http\Client\ClientInterface"
}
string(25) "SampleClient::sendRequest"
object(SampleRequest)#%d (0) {
}
bool(true)
