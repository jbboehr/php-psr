--TEST--
Psr\Log\AbstractLogger
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\AbstractLogger;
var_dump(new AbstractLogger());
--EXPECTF--
Fatal error: Cannot instantiate abstract class Psr\Log\AbstractLogger in %s on line 3
