--TEST--
Psr\SimpleCache\CacheInterface
--SKIPIF--
<?php include('skip.inc'); ?>
--FILE--
<?php
use Psr\SimpleCache\CacheInterface;
class MyImpl implements CacheInterface {
    public function get($key, $default = null) {}
    public function set($key, $value, $ttl = null) {}
    public function delete($key) {}
    public function clear() {}
    public function getMultiple($keys, $default = null) {}
    public function setMultiple($values, $ttl = null) {}
    public function deleteMultiple($keys) {}
    public function has($key) {}
}
$ex = new MyImpl();
var_dump($ex instanceof CacheInterface);
--EXPECT--
bool(true)
