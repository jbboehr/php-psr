<?php

use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

class SampleMiddleware implements MiddlewareInterface {
    public function process(ServerRequestInterface $reqeust, RequestHandlerInterface $handler): ResponseInterface
    {
        var_dump(__METHOD__);

        return new SampleResponse();
    }
}

