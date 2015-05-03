--TEST--
PsrLogNullLogger
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\NullLogger;
$logger = new NullLogger;
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
var_dump($logger instanceof \Psr\Log\LoggerInterface);
var_dump($logger instanceof \Psr\Log\AbstractLogger);
--EXPECT--
bool(true)
bool(true)
