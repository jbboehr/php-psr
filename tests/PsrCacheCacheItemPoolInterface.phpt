--TEST--
Psr\Cache\CacheItemPoolInterface
--SKIPIF--
<?php if( !extension_loaded('psr') ) die('skip '); ?>
--FILE--
<?php
include __DIR__ . '/SampleCacheItem.inc';
include __DIR__ . '/SampleCacheItemPool.inc';
var_dump(interface_exists('\\Psr\\Cache\\CacheItemPoolInterface', false));
var_dump(class_implements('SampleCacheItemPool', false));
$cacheItem = new SampleCacheItemPool();
$cacheItem->getItem('key');
$cacheItem->getItems();
$cacheItem->getItems(array('keyA', 'keyB'));
$cacheItem->clear();
$cacheItem->deleteItems(array('keyC'));
$cacheItem->save(new SampleCacheItem());
$cacheItem->saveDeferred(new SampleCacheItem());
$cacheItem->commit();
--EXPECTF--
bool(true)
array(1) {
  ["Psr\Cache\CacheItemPoolInterface"]=>
  string(32) "Psr\Cache\CacheItemPoolInterface"
}
string(28) "SampleCacheItemPool::getItem"
string(3) "key"
string(29) "SampleCacheItemPool::getItems"
array(0) {
}
string(29) "SampleCacheItemPool::getItems"
array(2) {
  [0]=>
  string(4) "keyA"
  [1]=>
  string(4) "keyB"
}
string(26) "SampleCacheItemPool::clear"
string(32) "SampleCacheItemPool::deleteItems"
array(1) {
  [0]=>
  string(4) "keyC"
}
string(25) "SampleCacheItemPool::save"
object(SampleCacheItem)#%d (0) {
}
string(33) "SampleCacheItemPool::saveDeferred"
object(SampleCacheItem)#%d (0) {
}
string(27) "SampleCacheItemPool::commit"
