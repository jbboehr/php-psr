--TEST--
Psr\EventDispatcher\EventDispatcherInterface
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
  ["Psr\EventDispatcher\EventDispatcherInterface"]=>
  string(44) "Psr\EventDispatcher\EventDispatcherInterface"
}
bool(true)
string(31) "SampleEventDispatcher::dispatch"
bool(true)
bool(true)
