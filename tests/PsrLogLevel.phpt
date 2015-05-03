--TEST--
PsrLogLevel
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\LogLevel;
var_dump(LogLevel::EMERGENCY);
var_dump(LogLevel::ALERT);
var_dump(LogLevel::CRITICAL);
var_dump(LogLevel::ERROR);
var_dump(LogLevel::WARNING);
var_dump(LogLevel::NOTICE);
var_dump(LogLevel::INFO);
var_dump(LogLevel::DEBUG);
--EXPECT--
string(9) "emergency"
string(5) "alert"
string(8) "critical"
string(5) "error"
string(7) "warning"
string(6) "notice"
string(4) "info"
string(5) "debug"
