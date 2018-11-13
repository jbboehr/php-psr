--TEST--
Psr\Log\LoggerAwareInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleLogger.inc';
include __DIR__ . '/SampleLoggerAware.inc';
var_dump(interface_exists('\\Psr\\Log\\LoggerAwareInterface', false));
var_dump(class_implements('SampleLoggerAware', false));
$aware = new SampleLoggerAware();
$logger = new SampleLogger();
$aware->setLogger($logger);
$aware->doSomethingThatLogs();
--EXPECT--
bool(true)
array(1) {
  ["Psr\Log\LoggerAwareInterface"]=>
  string(28) "Psr\Log\LoggerAwareInterface"
}
string(10) "got logger"
string(9) "emergency"
string(8) "test log"
array(0) {
}
