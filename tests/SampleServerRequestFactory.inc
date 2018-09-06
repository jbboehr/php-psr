<?php

use Psr\Http\Message\ServerRequestFactoryInterface;
use Psr\Http\Message\ServerRequestInterface;

class SampleServerRequestFactory implements ServerRequestFactoryInterface
{
    public function createServerRequest(string $method, $uri, array $serverParams = []): ServerRequestInterface
    {
        var_dump(__METHOD__, $method, $uri, $serverParams);
        return new SampleServerRequest();
    }
}

