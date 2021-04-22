--TEST--
Psr\Log\LoggerTrait
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\Log\LoggerTrait;
include __DIR__ . '/SampleLogger.inc';
class SampleLoggerTraitUser {
    use LoggerTrait;
    public function log($level, $message, array $context = array()) {
        var_dump($level, $message, $context);
    }
}
$logger = new SampleLoggerTraitUser();
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
var_dump(class_uses($logger, false));
--EXPECT--
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
array(1) {
  ["PsrExt\Log\LoggerTrait"]=>
  string(22) "PsrExt\Log\LoggerTrait"
}
