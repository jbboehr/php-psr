--TEST--
Psr\Log\AbstractLogger context not array
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleLogger2.inc';
$logger = new SampleLogger2;
$logger->emergency('msg emergency');
--EXPECT--
string(9) "emergency"
string(13) "msg emergency"
array(0) {
}
