<?php

use Psr\Http\Message\StreamFactoryInterface;
use Psr\Http\Message\StreamInterface;

class SampleStreamFactory implements StreamFactoryInterface
{
    public function createStream(string $content = ''): StreamInterface
    {
        var_dump(__METHOD__, $content);
        return new SampleStream();
    }

    public function createStreamFromFile(string $filename, string $mode = 'r'): StreamInterface
    {
        var_dump(__METHOD__, $filename, $mode);
        return new SampleStream();
    }

    public function createStreamFromResource($resource): StreamInterface
    {
        var_dump(__METHOD__, $resource);
        return new SampleStream();
    }
}

