--TEST--
Psr\Log\AbstractLogger
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\AbstractLogger;
try {
     new AbstractLogger();
} catch( \EngineException $e ) {
    echo $e->getMessage();
} catch( \Throwable $e ) {
    echo $e->getMessage();
}
--EXPECTF--
%SCannot instantiate abstract class Psr\Log\AbstractLogger%S
