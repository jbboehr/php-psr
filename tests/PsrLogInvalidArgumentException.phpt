--TEST--
Psr\Log\InvalidArgumentException
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Log\InvalidArgumentException;
$ex = new InvalidArgumentException('test');
var_dump($ex instanceof \InvalidArgumentException);
var_dump($ex instanceof \Exception);
try {
    throw $ex;
} catch( InvalidArgumentException $e ) {
    var_dump($e->getMessage());
}
--EXPECT--
bool(true)
bool(true)
string(4) "test"
