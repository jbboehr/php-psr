--TEST--
Psr\EventDispatcher\ListenerProviderInterface
--SKIPIF--
<?php include('skip_lt_php72.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleListenerProvider.inc';
var_dump(interface_exists('\\Psr\\EventDispatcher\\ListenerProviderInterface', false));
var_dump(class_implements('SampleListenerProvider', false));
$provider = new SampleListenerProvider();
var_dump($provider instanceof SampleListenerProvider);
$event = new stdClass();
$return = $provider->getListenersForEvent($event);
var_dump(is_iterable($return));
--EXPECT--
bool(true)
array(1) {
  ["Psr\EventDispatcher\ListenerProviderInterface"]=>
  string(45) "Psr\EventDispatcher\ListenerProviderInterface"
}
bool(true)
string(44) "SampleListenerProvider::getListenersForEvent"
bool(true)
bool(true)
