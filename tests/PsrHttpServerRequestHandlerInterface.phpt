--TEST--
Psr\Http\Server\RequestHandlerInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleServerRequest.inc';
include __DIR__ . '/SampleResponse.inc';
include __DIR__ . '/SampleRequestHandler.inc';
var_dump(interface_exists('\\Psr\\Http\\Server\\RequestHandlerInterface', false));
var_dump(class_implements('SampleRequestHandler', false));
$request = new SampleServerRequest();
var_dump($request instanceof \Psr\Http\Message\ServerRequestInterface);
$handler = new SampleRequestHandler();
$response = $handler->handle($request);
var_dump($response instanceof \Psr\Http\Message\ResponseInterface);
--EXPECT--
bool(true)
array(1) {
  ["Psr\Http\Server\RequestHandlerInterface"]=>
  string(39) "Psr\Http\Server\RequestHandlerInterface"
}
bool(true)
string(28) "SampleRequestHandler::handle"
bool(true)
