<?php

use Psr\Http\Message\UriFactoryInterface;
use Psr\Http\Message\UriInterface;

class SampleUriFactory implements UriFactoryInterface
{
    public function createUri(string $uri = ''): UriInterface
    {
        var_dump(__METHOD__, $uri);
        return new SampleUri();
    }
}

