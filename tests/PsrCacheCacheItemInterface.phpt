--TEST--
Psr\Cache\CacheItemInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
include __DIR__ . '/SampleCacheItem.inc';
var_dump(interface_exists('\\Psr\\Cache\\CacheItemInterface', false));
var_dump(class_implements('SampleCacheItem', false));
$cacheItem = new SampleCacheItem();
$cacheItem->getKey();
$cacheItem->get();
$cacheItem->isHit();
$cacheItem->set('test set');
$cacheItem->expiresAt(new DateTime('2000-01-01'));
$cacheItem->expiresAfter(new DateInterval("P2Y4DT6H8M"));
--EXPECT--
bool(true)
array(1) {
  ["NativePsrExt\Cache\CacheItemInterface"]=>
  string(37) "NativePsrExt\Cache\CacheItemInterface"
}
string(23) "SampleCacheItem::getKey"
string(20) "SampleCacheItem::get"
string(22) "SampleCacheItem::isHit"
string(20) "SampleCacheItem::set"
string(8) "test set"
string(26) "SampleCacheItem::expiresAt"
int(946684800)
string(29) "SampleCacheItem::expiresAfter"
string(6) "4 days"

