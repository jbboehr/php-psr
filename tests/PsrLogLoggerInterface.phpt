--TEST--
Psr\Log\LoggerInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleLogger.inc';
var_dump(interface_exists('\\Psr\\Log\\LoggerInterface', false));
var_dump(class_implements('SampleLogger', false));
$logger = new SampleLogger();
$logger->emergency('msg emergency', array(1));
$logger->alert('msg alert', array(2));
$logger->critical('msg critical', array(3));
$logger->error('msg error', array(4));
$logger->warning('msg warning', array(5));
$logger->notice('msg notice', array(6));
$logger->info('msg info', array(7));
$logger->debug('msg debug', array(8));
$logger->log('level', 'msg', array(9));
$logger->log('level', 'no context');
--EXPECT--
bool(true)
array(1) {
  ["NativePsrExt\Log\LoggerInterface"]=>
  string(32) "NativePsrExt\Log\LoggerInterface"
}
string(9) "emergency"
string(13) "msg emergency"
array(1) {
  [0]=>
  int(1)
}
string(5) "alert"
string(9) "msg alert"
array(1) {
  [0]=>
  int(2)
}
string(8) "critical"
string(12) "msg critical"
array(1) {
  [0]=>
  int(3)
}
string(5) "error"
string(9) "msg error"
array(1) {
  [0]=>
  int(4)
}
string(7) "warning"
string(11) "msg warning"
array(1) {
  [0]=>
  int(5)
}
string(6) "notice"
string(10) "msg notice"
array(1) {
  [0]=>
  int(6)
}
string(4) "info"
string(8) "msg info"
array(1) {
  [0]=>
  int(7)
}
string(5) "debug"
string(9) "msg debug"
array(1) {
  [0]=>
  int(8)
}
string(5) "level"
string(3) "msg"
array(1) {
  [0]=>
  int(9)
}
string(5) "level"
string(10) "no context"
array(0) {
}

