<?php

use Psr\Http\Client\ClientInterface;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;

class SampleClient implements ClientInterface
{
    public function sendRequest(RequestInterface $request): ResponseInterface
    {
        var_dump(__METHOD__, $request);
        return new SampleResponse();
    }
}

