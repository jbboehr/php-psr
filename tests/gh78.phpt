--TEST--
Psr\Log\LoggerInterface - Invalid context default value (PHP 8)
--SKIPIF--
<?php
include 'skip.inc';
if (PHP_VERSION_ID < 80000) {
    print "skip Due to version incompatibility";
}
?>
--FILE--
<?php
$reflectionMethod = new \ReflectionMethod(\Psr\Log\LoggerInterface::class, "emergency");
$reflectionParameter = $reflectionMethod->getParameters()[1];
var_dump($reflectionParameter->isOptional());
var_dump($reflectionParameter->isDefaultValueAvailable());
var_dump($reflectionParameter->getDefaultValue());
--EXPECT--
bool(true)
bool(true)
array(0) {
}
