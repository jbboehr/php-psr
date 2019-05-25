--TEST--
Psr\Http\Server\MiddlewareInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleMessage.inc';
include __DIR__ . '/SampleRequest.inc';
include __DIR__ . '/SampleServerRequest.inc';
include __DIR__ . '/SampleResponse.inc';
include __DIR__ . '/SampleRequestHandler.inc';
include __DIR__ . '/SampleMiddleware.inc';
var_dump(interface_exists('\\Psr\\Http\\Server\\MiddlewareInterface', false));
var_dump(class_implements('SampleMiddleware', false));
$request = new SampleServerRequest();
var_dump($request instanceof \Psr\Http\Message\ServerRequestInterface);
$handler = new SampleRequestHandler();
var_dump($handler instanceof \Psr\Http\Server\RequestHandlerInterface);
$middleware = new SampleMiddleware();
$response = $middleware->process($request, $handler);
var_dump($response instanceof \Psr\Http\Message\ResponseInterface);
--EXPECT--
bool(true)
array(1) {
  ["Psr\Http\Server\MiddlewareInterface"]=>
  string(35) "Psr\Http\Server\MiddlewareInterface"
}
bool(true)
bool(true)
string(25) "SampleMiddleware::process"
bool(true)
