<?php

use Psr\Http\Server\RequestHandlerInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

class SampleRequestHandler implements RequestHandlerInterface {
    public function handle(ServerRequestInterface $reqeust): ResponseInterface
    {
        var_dump(__METHOD__);

        return new SampleResponse();
    }
}

