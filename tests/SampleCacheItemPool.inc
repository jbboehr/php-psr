<?php

use Psr\Cache\CacheItemInterface;
use Psr\Cache\CacheItemPoolInterface;

class SampleCacheItemPool implements CacheItemPoolInterface
{
    public function getItem(string $key): CacheItemInterface
    {
        var_dump(__METHOD__, $key);
        return new SampleCacheItem();
    }

    public function getItems(array $keys = []): iterable
    {
        var_dump(__METHOD__, $keys);
        return [];
    }

    public function hasItem(string $key): bool
    {
        var_dump(__METHOD__, $key);
        return false;
    }

    public function clear(): bool
    {
        var_dump(__METHOD__);
        return true;
    }

    public function deleteItem($key): bool
    {
        var_dump(__METHOD__, $key);
        return true;
    }

    public function deleteItems(array $keys): bool
    {
        var_dump(__METHOD__, $keys);
        return true;
    }

    public function save(CacheItemInterface $item): bool
    {
        var_dump(__METHOD__, $item);
        return true;
    }

    public function saveDeferred(CacheItemInterface $item): bool
    {
        var_dump(__METHOD__, $item);
        return true;
    }

    public function commit(): bool
    {
        var_dump(__METHOD__);
        return true;
    }
}

