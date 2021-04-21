--TEST--
Psr\EventDispatcher\EventDispatcherInterface
--SKIPIF--
<?php include('skip_lt_php72.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleEventDispatcher.inc';
var_dump(interface_exists('\\Psr\\EventDispatcher\\EventDispatcherInterface', false));
var_dump(class_implements('SampleEventDispatcher', false));
$dispatcher = new SampleEventDispatcher();
var_dump($dispatcher instanceof SampleEventDispatcher);
$event = new stdClass();
$return = $dispatcher->dispatch($event);
var_dump(is_object($return));
--EXPECT--
bool(true)
array(1) {
  ["NativePsrExt\EventDispatcher\EventDispatcherInterface"]=>
  string(53) "NativePsrExt\EventDispatcher\EventDispatcherInterface"
}
bool(true)
string(31) "SampleEventDispatcher::dispatch"
bool(true)
bool(true)
