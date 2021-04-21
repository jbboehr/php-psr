--TEST--
Psr\EventDispatcher\StoppableEventInterface
--FILE--
<?php
include __DIR__ . '/SampleStoppableEvent.inc';
var_dump(interface_exists('\\Psr\\EventDispatcher\\StoppableEventInterface', false));
var_dump(class_implements('SampleStoppableEvent', false));
$event = new SampleStoppableEvent();
var_dump($event instanceof SampleStoppableEvent);
$return = $event->isPropagationStopped();
var_dump(is_bool($return));
--EXPECT--
bool(true)
array(1) {
  ["NativePsrExt\EventDispatcher\StoppableEventInterface"]=>
  string(52) "NativePsrExt\EventDispatcher\StoppableEventInterface"
}
bool(true)
string(42) "SampleStoppableEvent::isPropagationStopped"
bool(true)
