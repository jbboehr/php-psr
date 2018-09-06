<?php

use Psr\Http\Message\ResponseFactoryInterface;
use Psr\Http\Message\ResponseInterface;

class SampleResponseFactory implements ResponseFactoryInterface
{
    public function createResponse(int $code = 200, string $reasonPhrase = ''): ResponseInterface
    {
        var_dump(__METHOD__, $code, $reasonPhrase);
        return new SampleResponse();
    }
}

