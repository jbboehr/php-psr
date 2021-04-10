<?php

use Psr\Cache\CacheItemInterface;

class SampleCacheItem implements CacheItemInterface
{
    public function getKey(): string
    {
        var_dump(__METHOD__);
        return "";
    }

    public function get(): mixed
    {
        var_dump(__METHOD__);
        return null;
    }

    public function isHit(): bool
    {
        var_dump(__METHOD__);
        return false;
    }

    public function set(mixed $value): static
    {
        var_dump(__METHOD__, $value);
        return $this;
    }

    public function expiresAt(?\DateTimeInterface $expiration): static
    {
        var_dump(__METHOD__, $expiration?->getTimestamp());
        return $this;
    }

    public function expiresAfter(int|\DateInterval|null $time): static
    {
        if (!($time instanceof \DateInterval)) {
            var_dump(__METHOD__, $time);
        } else {
            var_dump(__METHOD__, $time->format('%d days'));
        }
        return $this;
    }
}
