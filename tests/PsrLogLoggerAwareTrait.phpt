--TEST--
Psr\Log\LoggerAwareTrait
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
use Psr\Log\LoggerAwareTrait;
include __DIR__ . '/SampleLogger.inc';
class SampleLoggerAwareTraitUser {
    use LoggerAwareTrait;
    public function getLogger() {
        return $this->logger;
    }
}

$aware = new SampleLoggerAwareTraitUser();
$logger = new SampleLogger();
$aware->setLogger($logger);
var_dump($logger === $aware->getLogger());
var_dump(class_uses($aware, false));
--EXPECT--
bool(true)
array(1) {
  ["Psr\Log\LoggerAwareTrait"]=>
  string(24) "Psr\Log\LoggerAwareTrait"
}
