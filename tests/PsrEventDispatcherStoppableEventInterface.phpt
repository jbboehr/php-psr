--TEST--
Psr\EventDispatcher\StoppableEventInterface
--SKIPIF--
<?php include('skip_lt_php72.inc'); ?>
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
  ["PsrExt\EventDispatcher\StoppableEventInterface"]=>
  string(46) "PsrExt\EventDispatcher\StoppableEventInterface"
}
bool(true)
string(42) "SampleStoppableEvent::isPropagationStopped"
bool(true)
