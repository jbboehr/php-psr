<?php

use Psr\Http\Message\MessageInterface;
use Psr\Http\Message\StreamInterface;

class SampleMessage implements MessageInterface
{
    public function getProtocolVersion()
    {
        var_dump(__METHOD__);
    }

    public function withProtocolVersion($version)
    {
        var_dump(__METHOD__, $version);
    }

    public function getHeaders()
    {
        var_dump(__METHOD__);
    }

    public function hasHeader($name)
    {
        var_dump(__METHOD__, $name);
    }

    public function getHeader($name)
    {
        var_dump(__METHOD__, $name);
    }

    public function getHeaderLine($name)
    {
        var_dump(__METHOD__, $name);
    }

    public function withHeader($name, $value)
    {
        var_dump(__METHOD__, $name, $value);
    }

    public function withAddedHeader($name, $value)
    {
        var_dump(__METHOD__, $name, $value);
    }

    public function withoutHeader($name)
    {
        var_dump(__METHOD__, $name);
    }

    public function getBody()
    {
        var_dump(__METHOD__);
    }

    public function withBody(StreamInterface $body)
    {
        var_dump(__METHOD__, $body);
    }
}

