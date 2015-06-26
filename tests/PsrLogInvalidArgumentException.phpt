--TEST--
Psr\Log\InvalidArgumentException
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\InvalidArgumentException;
$ex = new InvalidArgumentException('test');
var_dump($ex instanceof \InvalidArgumentException);
var_dump($ex instanceof \Exception);
throw $ex;
--EXPECTF--
bool(true)
bool(true)

Fatal error: Uncaught %SPsr\Log\InvalidArgumentException%stest in %s:%d
Stack trace:
#0 {main}
  thrown in %s on line %d
