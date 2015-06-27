<?php

use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\UriInterface;

class SampleRequest extends SampleMessage implements RequestInterface
{
    public function getRequestTarget()
    {
        var_dump(__METHOD__);
    }

    public function withRequestTarget($requestTarget)
    {
        var_dump(__METHOD__, $requestTarget);
    }

    public function getMethod()
    {
        var_dump(__METHOD__);
    }

    public function withMethod($method)
    {
        var_dump(__METHOD__, $method);
    }

    public function getUri()
    {
        var_dump(__METHOD__);
    }

    public function withUri(UriInterface $uri, $preserveHost = false)
    {
        var_dump(__METHOD__, $uri, $preserveHost);
    }
}

