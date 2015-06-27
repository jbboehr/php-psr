<?php

use Psr\Cache\CacheItemInterface;
use Psr\Cache\CacheItemPoolInterface;

class SampleCacheItemPool implements CacheItemPoolInterface
{
    public function getItem($key)
    {
        var_dump(__METHOD__, $key);
    }

    public function getItems(array $keys = array())
    {
        var_dump(__METHOD__, $keys);
    }

    public function clear()
    {
        var_dump(__METHOD__);
    }

    public function deleteItems(array $keys)
    {
        var_dump(__METHOD__, $keys);
    }

    public function save(CacheItemInterface $item)
    {
        var_dump(__METHOD__, $item);
    }

    public function saveDeferred(CacheItemInterface $item)
    {
        var_dump(__METHOD__, $item);
    }

    public function commit()
    {
        var_dump(__METHOD__);
    }
}

