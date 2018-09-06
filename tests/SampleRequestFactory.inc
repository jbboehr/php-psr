<?php

use Psr\Http\Message\RequestFactoryInterface;
use Psr\Http\Message\RequestInterface;

class SampleRequestFactory implements RequestFactoryInterface
{
    public function createRequest(string $method, $uri): RequestInterface
    {
        var_dump(__METHOD__, $method, $uri);
        return new SampleRequest();
    }
}

